import 'package:flutter/material.dart';
import 'package:login/login/custom_painter.dart';
import 'package:login/login/input_container.dart';
import 'package:login/login/login_button.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: LoginBackgroundPaint(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Login",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: Theme.of(context).textTheme.displayMedium?.fontSize),
          ),
          const SizedBox(
            height: 70,
          ),
          const SizedBox(
            width: double.infinity,
            child: Stack(
              children: [
                InputContainer(),
                Positioned(
                  left: 350,
                  top: 60,
                  child: LoginButton(),
                ),
              ],
            ),
          ),
          const Row(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(right: 25, top: 10),
                  child: Text(
                    "Forgot ?",
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 189, 188, 188),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              TextButton(
                onPressed: () {},
                child: const Text(
                  "Register",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 238, 134, 54),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
