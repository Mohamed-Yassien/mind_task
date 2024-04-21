import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mind_task_app/core/router/app_router.dart';
import 'package:mind_task_app/core/shared/customtext.dart';
import 'package:mind_task_app/core/shared/default_text_field.dart';
import 'package:mind_task_app/core/themes/colors.dart';
import 'package:mind_task_app/presentation/features/login/data/requests/login_request.dart';
import 'package:mind_task_app/presentation/features/login/logic/cubit/login_cubit.dart';
import 'package:mind_task_app/presentation/features/login/logic/cubit/login_state.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocListener<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccessState) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              Routes.layoutRoute,
              (route) => false,
            );
          }
        },
        child: Scaffold(
          body: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
            child: Form(
              key: formKey,
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
                    keyboardType: TextInputType.emailAddress,
                    hintText: "البريد الالكتروني",
                    controller: emailController,
                    validate: (value) {
                      if (value!.isEmpty) {
                        return "البريد الالكتروني مطلوب";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  DefaultTextField(
                    hintText: "كلمة المرور",
                    controller: passwordController,
                    validate: (value) {
                      if (value!.isEmpty) {
                        return " كلمة المرور مطلوبة";
                      }
                      return null;
                    },
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
                  GestureDetector(
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        LoginRequest loginRequest = LoginRequest(
                          email: emailController.text,
                          password: passwordController.text,
                          token: "asd342dsdddsd323dsdadasd3e",
                          platform: "1",
                          deviceId: "bfghtr5yrtytd654e6trd",
                        );
                        BlocProvider.of<LoginCubit>(context).login(
                          context: context,
                          loginRequest: loginRequest,
                        );
                      }
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const CustomText(
                        "تسجيل دخول",
                        fontSize: 17,
                        color: Colors.white,
                        weight: FontWeight.w600,
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
}
