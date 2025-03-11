import 'package:flutter/material.dart';
import 'package:pos/components/appcolors.dart';
import 'package:pos/components/assets_const.dart';
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
            child: Center(
              child: SizedBox(
                width: MediaQuery.sizeOf(context).width / 2,
                child: Image.asset(AssetsConst.fromLogo),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0),
              ),
              child: ColoredBox(
                color: AppColor.third,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 28.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 44),
                      Text(
                        'Email',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextField(
                        decoration: InputDecoration(hintText: 'Email Loket'),
                      ),
                      SizedBox(height: 36),
                      Text(
                        'Password',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'Masukkan Password',
                          suffixIcon: Icon(Icons.visibility),
                        ),
                      ),
                      const SizedBox(height: 86.0),
                      SizedBox(
                        width: double.infinity,
                        child: CustomButton(
                          text: 'Login',
                          onPressed: () {
                            Navigator.pushNamed(context, '/main');
                          },
                        ),
                      ),
                      SizedBox(height: 128.0),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Image.asset(AssetsConst.fromLogo, height: 70.0),
                      ),
                      SizedBox(height: 20.0),
                    ],
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
