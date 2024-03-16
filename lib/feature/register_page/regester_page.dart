import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/config/themes/app_colors.dart';
import 'package:todo_app/core/widgets/custom_password_text_form_field.dart';
import 'package:todo_app/core/widgets/custom_text_form_field.dart';
import 'package:todo_app/feature/home_page/home_page.dart';
import 'package:todo_app/feature/login_page/login_page.dart';
import 'package:todo_app/firebase_errors_codes/firebase_errors_codes.dart';
import '../../core/provider/setting_provider.dart';
import '../../data/utilies/email_formatting.dart';

class RegisterPage extends StatefulWidget {
  static const String routeName = "RegisterPage";

  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController fullNameController = TextEditingController();

  TextEditingController userNameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController confirmationPasswordController =
      TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingProvider>(context);
    var obscureText = true;

    return Container(
      decoration: BoxDecoration(
        color: AppColors.isDarkSelected
            ? AppColors.darkPrimaryColor
            : AppColors.lightBackgroundColor,
        image: const DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(
            "assets/images/background.png",
          ),
        ),
      ),
      child: Scaffold(
        backgroundColor: provider.currentTheme == ThemeMode.light
            ? AppColors.lightBackgroundColor
            : AppColors.darkBackgroundColor,
        appBar: AppBar(
          elevation: 0,
          shadowColor: AppColors.transparentColor,
          surfaceTintColor: AppColors.transparentColor,
          title: Text(
            "Register Page",
            style: Theme.of(context).textTheme.labelLarge,
          ),
          backgroundColor: AppColors.transparentColor,
        ),
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.only(top: 60, left: 10.0, right: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomTextFormField(
                    hintText: 'Full Name',
                    validator: (input) {
                      if (input == null || input.isEmpty) {
                        return "Please enter full name";
                      }
                      return null;
                    },
                    controller: fullNameController,
                  ),
                  CustomTextFormField(
                    hintText: 'User Name',
                    validator: (input) {
                      if (input == null || input.isEmpty) {
                        return "Please enter User Name";
                      }
                      return null;
                    },
                    controller: userNameController,
                  ),
                  CustomTextFormField(
                    hintText: 'Email',
                    validator: (input) {
                      if (!isEmailFormated(input!)) {
                        return "Please Enter Email";
                      }
                      return null;
                    },
                    controller: emailController,
                  ),
                  PasswordCustomTextFormField(
                    obscureText: obscureText,
                    hintText: 'Password',
                    validator: (input) {
                      if (input == null || input.isEmpty) {
                        return "Please enter full name";
                      }
                      if (input.length < 6) {
                        return "PLease the characters must be at least 6";
                      }
                      return null;
                    },
                    controller: passwordController,
                  ),
                  PasswordCustomTextFormField(
                    obscureText: obscureText,
                    hintText: 'Confirmation Password',
                    validator: (input) {
                      if (input == null || input.isEmpty) {
                        return "Please enter full name";
                      }
                      if (input.length < 6) {
                        return "PLease the characters must be at least 6";
                      }
                      if (input != confirmationPasswordController.text) {
                        return "PLease try to make the password and the confirmation of password the same";
                      }
                      return null;
                    },
                    controller: confirmationPasswordController,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Column(
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.lightPrimaryColor,
                          ),
                          onPressed: () {
                            createAccount();
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 20.0,
                              right: 20.0,
                            ),
                            child: Text(
                              "Create Account",
                              style: TextStyle(
                                fontSize: 20,
                                color: AppColors.lightCardColor,
                              ),
                            ),
                          ),
                        ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 20.0,
                              right: 20.0,
                            ),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context)
                                    .pushReplacementNamed(LoginPage.routeName);
                              },
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Already Have an Account? ",
                                    style:
                                        Theme.of(context).textTheme.labelSmall,
                                  ),
                                  Text(
                                    "Login",
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                  ),
                                ],
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
      ),
    );
  }

  void createAccount() async {
    if (formKey.currentState?.validate() == false) {
    } else {
      Navigator.pushReplacementNamed(context, HomePage.routeName);
    }
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: emailController.text, password: passwordController.text);
      print(credential.user?.uid);
    } on FirebaseAuthException catch (e) {
      if (e.code == FirebaseErrorCodes.emailAlreadyInUse) {
        print('The account is already exists for that email.');
      } else if (e.code == FirebaseErrorCodes.weakPassword) {
        print('Wrong password provided for that user.');
      }
    } catch (e) {
      print(e);
    }
  }
}
