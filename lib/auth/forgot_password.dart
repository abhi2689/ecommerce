import 'package:ecommerce/const/app_constants.dart';
import 'package:ecommerce/const/validator.dart';
import 'package:ecommerce/services/assetManager.dart';
import 'package:ecommerce/widgets/app_name.dart';
import 'package:ecommerce/widgets/subtitle_test.dart';
import 'package:ecommerce/widgets/title_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});
static const routeName = '/ForgotPassword';
  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  late final TextEditingController emailController;
  late final _formKey = GlobalKey<FormState>();

  forgotFct() {
    bool isvalid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
  }

  @override
  void initState() {
    emailController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    if (mounted) {
      emailController.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Form(
        key: _formKey,
        child: Scaffold(
          appBar: AppBar(
            title: const AppNameWidget(),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Image.asset('${AssetManager.imagePath}/forgot_password.jpg'),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: TitleWidget(text: 'Forgot Password'),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Subtitletext(
                    text:
                        'Please enter the email address you like to recevie reset information',
                    fontsize: 15,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: emailController,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      filled: true,
                      hintText: 'Enter your email',
                      prefixIcon: Icon(IconlyLight.message),
                    ),
                    validator: (value) {
                      return MyValidators.emailValidator(value);
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    height: kBottomNavigationBarHeight,
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      onPressed: () {
                        forgotFct();
                      },
                      icon: const Icon(
                        Icons.email,
                      ),
                      label: const Text(
                        'Request Link',
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
