import 'package:flutter/material.dart';

import 'input_container.dart';

class FormContainer extends StatelessWidget {
  const FormContainer({
    super.key,
    required this.h,
    required this.w,
  });

  final double h;
  final double w;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: h * 0.66,
      width: w,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(80),
          topRight: Radius.circular(80),
        ),
      ),
      child: Column(
        children: [
          InputContainer(
            h: h,
            w: w,
          ),
          const SizedBox(height: 40),
          const Text(
            "Forgot Password?",
            style: TextStyle(
                fontSize: 20, color: Color.fromARGB(255, 159, 158, 158)),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepOrange[700],
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 80),
            ),
            child: const Text(
              "Login",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
          const SizedBox(height: 50),
          const Text(
            "Continue with social media",
            style: TextStyle(
                fontSize: 20, color: Color.fromARGB(255, 159, 158, 158)),
          ),
          const SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[400],
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                ),
                child: const Text(
                  "Facebook",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                ),
                child: const Text(
                  "Github",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
