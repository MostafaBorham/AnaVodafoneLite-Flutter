import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({Key? key, required this.controller,this.enabled=true, required this.obscureText, required this.keyboardType, this.validator, this.onChanged, this.suffixIcon, this.hintText}) : super(key: key);
  final TextEditingController controller;
  final bool obscureText;
  final TextInputType keyboardType;
  final FormFieldValidator? validator;
  final ValueChanged<String>? onChanged;
  final Widget? suffixIcon;
  final String? hintText;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      enabled: enabled,
      style: Theme.of(context).textTheme.labelLarge?.copyWith(
          color: Colors.grey.shade500,
          fontWeight: FontWeight.w300,
      ),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 8,vertical: 15),
        isDense: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.grey.shade400
          )
        ),
        suffixIcon: suffixIcon,
        hintText: hintText,
        hintStyle: Theme.of(context).textTheme.labelLarge?.copyWith(
          color: Colors.grey.shade500,
          fontWeight: FontWeight.w300,
        ),
      ),
      obscureText: obscureText,
      keyboardType: keyboardType,
      validator: validator,
      onChanged: onChanged,
    );
  }
}
