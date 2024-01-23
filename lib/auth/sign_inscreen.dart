import 'dart:ffi';

import 'package:ecommerce/auth/google_button.dart';
import 'package:ecommerce/const/validator.dart';
import 'package:ecommerce/services/myAppFunction.dart';
import 'package:ecommerce/widgets/app_name.dart';
import 'package:ecommerce/widgets/subtitle_test.dart';
import 'package:ecommerce/widgets/title_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late final FocusNode emailFocusNode;
  late final FocusNode passwordFocusNode;
  final _formKey = GlobalKey<FormState>();
  loginFct() async {
    final isVlaid = _formKey.currentState?.validate();
  }

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    emailFocusNode = FocusNode();
    passwordFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 60,
                ),
                const Align(
                  child: AppNameWidget(),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 18.0),
                    child: TitleWidget(text: 'Welcome Back'),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18.0),
                  child: FittedBox(
                    child: Subtitletext(
                        text:
                            'Lets get you logged in so you can start exploring'),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                      controller: emailController,
                      focusNode: emailFocusNode,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                        hintText: 'Email address',
                        prefixIcon: Icon(IconlyLight.message),
                      ),
                      onFieldSubmitted: (value) {
                        FocusScope.of(context).requestFocus(passwordFocusNode);
                      },
                      validator: (value) {
                        return MyValidators.emailValidator(value);
                      }),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: passwordController,
                    focusNode: passwordFocusNode,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.done,
                    decoration: const InputDecoration(
                      hintText: " Password",
                      prefixIcon: Icon(IconlyLight.lock),
                    ),
                    onFieldSubmitted: (value) {
                      loginFct();
                    },
                    validator: (value) {
                      return MyValidators.passwordValidator(value);
                    },
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Forgot Password ?",
                      style: TextStyle(
                          fontStyle: FontStyle.italic,
                          decoration: TextDecoration.underline),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          backgroundColor: Colors.white30,
                          padding: const EdgeInsets.all(18)),
                      onPressed: () {},
                      icon: const Icon(Icons.login),
                      label: const Text('Sign in'),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Subtitletext(text: 'or connect using'.toUpperCase()),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: kBottomNavigationBarHeight,
                  child: Row(
                    children: [
                      const Expanded(
                        flex: 2,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: SizedBox(
                            height: kBottomNavigationBarHeight,
                            child: GoogleButton(),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            height: kBottomNavigationBarHeight,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.all(12),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                backgroundColor: Colors.white30,
                              ),
                              onPressed: () {},
                              child: const FittedBox(
                                child: Text(
                                  "Guest",
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
