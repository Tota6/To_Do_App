import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:todo_app/core/widgets/custom_text_form_field.dart';

import '../../config/themes/app_colors.dart';

class PasswordCustomTextFormField extends StatefulWidget {
  final String hintText;
  Validator? validator;
  final bool obscureText;
  final TextEditingController controller;
  PasswordCustomTextFormField(
      {super.key,
      required this.hintText,
      required this.controller,
      this.validator,
      required this.obscureText});

  @override
  State<PasswordCustomTextFormField> createState() =>
      _PasswordCustomTextFormFieldState();
}

class _PasswordCustomTextFormFieldState
    extends State<PasswordCustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: TextFormField(
        controller: widget.controller,
        validator: widget.validator,
        obscureText: widget.obscureText,
        style: Theme.of(context).textTheme.labelMedium,
        decoration: InputDecoration(
          suffixIcon: InkWell(
            onTap: () {
              setState(() {
                widget.obscureText != widget.obscureText;
              });
            },
            child: Icon(
              widget.obscureText
                  ? FontAwesomeIcons.eyeSlash
                  : FontAwesomeIcons.eye,
              color: AppColors.lightPrimaryColor,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(22),
            borderSide: BorderSide(
              color: AppColors.lightPrimaryColor,
              width: 2,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(22),
            borderSide: BorderSide(
              color: AppColors.lightPrimaryColor.withOpacity(0.5),
              width: 2,
            ),
          ),
          labelText: widget.hintText,
          labelStyle: Theme.of(context).textTheme.labelMedium,
        ),
      ),
    );
  }
}
