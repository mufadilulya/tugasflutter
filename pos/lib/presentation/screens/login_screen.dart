import 'package:flutter/material.dart';
import 'package:pos/components/appcolors.dart';
import 'package:pos/components/assets_const.dart';
import 'package:pos/components/custom_text_field.dart';
import 'package:pos/components/custom_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.first,
      body: Stack(
        children: [
          SizedBox(
            height: 80.0,
            child: Center(child: Image.asset(AssetsConst.fromLogo)),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SingleChildScrollView(
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(30.0),
                ),
                child: ColoredBox(
                  color: AppColor.third,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 28.0,
                      vertical: 44.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextField(
                          hintText: 'Email',
                          keyboardType: TextInputType.emailAddress,
                          prefixIcon: Icons.email,
                        ),
                        SizedBox(height: 16),
                        CustomTextField(
                          hintText: 'Password',
                          obscureText: true,
                          prefixIcon: Icons.lock,
                        ),
                        SizedBox(height: 24),
                        CustomButton(
                          text: 'Login',
                          onPressed: () {
                            Navigator.pushNamed(context, '/main');
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
