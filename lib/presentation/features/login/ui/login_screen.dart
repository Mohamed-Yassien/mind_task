import 'package:flutter/material.dart';
import 'package:mind_task_app/core/shared/customtext.dart';
import 'package:mind_task_app/core/shared/default_text_field.dart';
import 'package:mind_task_app/core/themes/colors.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 90,
            ),
            Align(
              alignment: Alignment.center,
              child: Image.asset(
                "assets/images/logo.png",
              ),
            ),
            const SizedBox(
              height: 2,
            ),
            const CustomText(
              "مرحبا بك",
              fontSize: 22,
            ),
            const SizedBox(
              height: 30,
            ),
            DefaultTextField(
              hintText: "البريد الالكتروني",
            ),
            const SizedBox(
              height: 2,
            ),
            DefaultTextField(
              hintText: "كلمة المرور",
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: CustomText(
                "نسيت كلمة المرور",
                fontSize: 14,
                color: AppColors.hintColor,
                weight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Container(
              height: 50,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            Hexagon(),
          ],
        ),
      ),
    );
  }
}
