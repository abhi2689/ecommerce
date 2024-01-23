import 'dart:ffi';
import 'dart:math';

import 'package:ecommerce/auth/google_button.dart';
import 'package:ecommerce/const/validator.dart';
import 'package:ecommerce/services/myAppFunction.dart';
import 'package:ecommerce/widgets/app_name.dart';
import 'package:ecommerce/widgets/image_picker.dart';
import 'package:ecommerce/widgets/subtitle_test.dart';
import 'package:ecommerce/widgets/title_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:image_picker/image_picker.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late final TextEditingController usernameController;
  late final TextEditingController repeatPassword;
  late final FocusNode nameFocusNode;
  late final FocusNode emailFocusNode;
  late final FocusNode repeatFocusNode;
  late final FocusNode passwordFocusNode;
  final _formKey = GlobalKey<FormState>();
  bool isVisible = true;
  XFile? pickedImage;
  loginFct() async {
    final isVlaid = _formKey.currentState?.validate();
  }

  Future<void> localImagePicker() async {
    final ImagePicker imagePicker = ImagePicker();
    await MyAppFUnction.imagePickerDialogue(
      context: context,
      cFct: () async {
        pickedImage = await imagePicker.pickImage(source: ImageSource.camera);
        setState(() {});
      },
      gFct: () async {
        pickedImage = await imagePicker.pickImage(source: ImageSource.gallery);
        setState(() {});
      },
      rFct: () {
        setState(() {
          pickedImage = null;
        });
      },
    );
  }

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    usernameController = TextEditingController();
    repeatPassword = TextEditingController();
    nameFocusNode = FocusNode();
    repeatFocusNode = FocusNode();
    emailFocusNode = FocusNode();
    passwordFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    usernameController.dispose();
    repeatPassword.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    nameFocusNode.dispose();
    repeatFocusNode.dispose();
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
                    child: TitleWidget(text: 'Welcome'),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18.0),
                  child: FittedBox(
                    child: Subtitletext(
                        text:
                            'Sign up to receive official notifications and news from our app'),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                FittedBox(
                  child: SizedBox(
                      height: 100,
                      width: 100,
                      child: ImagePickerWidget(
                        fct: () async{
                         await localImagePicker();
                        },
                        pickedImage: pickedImage,
                      )),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                      controller: usernameController,
                      focusNode: nameFocusNode,
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                        hintText: 'UserName',
                        prefixIcon: Icon(IconlyLight.profile),
                      ),
                      onFieldSubmitted: (value) {
                        FocusScope.of(context).requestFocus(emailFocusNode);
                      },
                      validator: (value) {
                        return MyValidators.displayNamevalidator(value);
                      }),
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
                    obscureText: isVisible,
                    focusNode: passwordFocusNode,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                      hintText: " Password",
                      prefixIcon: const Icon(IconlyLight.lock),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isVisible = !isVisible;
                          });
                        },
                        icon: Icon(isVisible
                            ? Icons.visibility_off
                            : Icons.visibility),
                      ),
                    ),
                    onFieldSubmitted: (value) {
                      FocusScope.of(context).requestFocus(repeatFocusNode);
                    },
                    validator: (value) {
                      return MyValidators.passwordValidator(value);
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: repeatPassword,
                    focusNode: repeatFocusNode,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.done,
                    decoration: const InputDecoration(
                      hintText: 'RepeatPassword',
                      prefixIcon: Icon(IconlyLight.lock),
                    ),
                    onFieldSubmitted: (value) {
                      loginFct();
                    },
                    validator: (value) {
                      return MyValidators.repeatPasswordValidator(
                          value: value, password: passwordController.text);
                    },
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
                          backgroundColor: Colors.blue,
                          padding: const EdgeInsets.all(18)),
                      onPressed: () {},
                      icon: const Icon(Icons.login),
                      label: const Text('Register'),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
