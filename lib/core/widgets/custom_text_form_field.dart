import 'package:flutter/material.dart';
import 'package:todo_app/config/themes/app_colors.dart';

typedef Validator = String? Function(String?);

class CustomTextFormField extends StatefulWidget {
  final String hintText;
  Validator? validator;
  final TextEditingController controller;
  CustomTextFormField(
      {super.key,
      required this.hintText,
      this.validator,
      required this.controller});

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: TextFormField(
        controller: widget.controller,
        validator: widget.validator,
        style: Theme.of(context).textTheme.labelMedium,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(22),
            borderSide:
                BorderSide(color: AppColors.lightPrimaryColor, width: 2),
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
