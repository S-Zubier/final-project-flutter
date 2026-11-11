import 'package:flutter/material.dart';

// قمنا بتغيير الاسم إلى CustomTextField ليكون معبراً أكثر كـ Widget احترافي
class CustomTextField extends StatelessWidget {
  final String labelData;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final bool isPassword;

  const CustomTextField({
    super.key,
    required this.labelData,
    required this.controller,
    required this.validator,
    this.isPassword = false, // القيمة الافتراضية ليست كلمة مرور
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0), // حشو متناسق للحقول
      child: TextFormField(
        controller: controller,
        validator: validator,
        obscureText: isPassword,
        decoration: InputDecoration(
          labelText: labelData,
          filled: true,
          fillColor: Colors.grey[200], // خلفية رمادية خفيفة ومريحة للعين
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
      ),
    );
  }
}
