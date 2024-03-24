import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/config/themes/app_colors.dart';
import 'package:todo_app/core/widgets/custom_password_text_form_field.dart';
import 'package:todo_app/core/widgets/custom_text_form_field.dart';
import 'package:todo_app/data/database/user_dao.dart';
import 'package:todo_app/data/dialog/dialog_utilits.dart';
import 'package:todo_app/feature/home_page/home_page.dart';
import 'package:todo_app/feature/register_page/regester_page.dart';
import 'package:todo_app/firebase_errors_codes/firebase_errors_codes.dart';
import '../../data/utilies/email_formatting.dart';

class LoginPage extends StatefulWidget {
  static const String routeName = "LoginPage";

  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var obscureText = true;

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        image: const DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(
            "assets/images/background.png",
          ),
        ),
      ),
      child: Scaffold(
        backgroundColor: AppColors.transparentColor,
        appBar: AppBar(
          elevation: 0,
          shadowColor: AppColors.transparentColor,
          surfaceTintColor: AppColors.transparentColor,
          title: Text(
            "LoginPage",
            style: Theme.of(context).textTheme.labelLarge,
          ),
          backgroundColor: AppColors.transparentColor,
        ),
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.only(top: 150, left: 10.0, right: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
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
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.lightPrimaryColor,
                      ),
                      onPressed: () {
                        login();
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 20.0,
                          right: 20.0,
                        ),
                        child: Text(
                          "Login",
                          style: TextStyle(
                            fontSize: 20,
                            color: AppColors.lightCardColor,
                          ),
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
                              .pushReplacementNamed(RegisterPage.routeName);
                        },
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don't Have an Account? ",
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void login() async {
    DialogUtils.showLoadingDialog(context, "Loading");
    if (formKey.currentState?.validate() == false) {
      return;
    }
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      DialogUtils.hideLoadingDialog(context);
      DialogUtils.showMassage(context, "You Logged in Successfully",
          isDismissible: false, posActionsTitle: "ok", posAction: () {
        Navigator.pushReplacementNamed(context, HomePage.routeName);
      });
      UserDao.getUser(credential.user!.uid);
    } on FirebaseAuthException catch (e) {
      DialogUtils.hideLoadingDialog(context);
      if (e.code == FirebaseErrorCodes.emailAlreadyInUse) {
        DialogUtils.showMassage(
          context,
          "No user found for that email.",
        );
      } else if (e.code == FirebaseErrorCodes.weakPassword) {
        DialogUtils.showMassage(
            context, 'Wrong password provided for that user.');
      }
    } catch (e) {
      print(e);
    }
  }
}
