import 'package:flutter/material.dart';

const inputDecoration = InputDecoration(
  border: InputBorder.none,
  contentPadding: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
  hintStyle: TextStyle(
    fontSize: 22,
    letterSpacing: 1,
    color: Color.fromARGB(255, 155, 154, 154),
  ),
);

class InputContainer extends StatelessWidget {
  const InputContainer({
    super.key,
    required this.h,
    required this.w,
  });

  final double h;
  final double w;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: w * 0.8,
      padding: const EdgeInsets.all(40),
      margin: const EdgeInsets.only(top: 60),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(25),
          ),
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(166, 255, 207, 192),
              blurRadius: 30,
              spreadRadius: 0,
            ),
          ]),
      child: Column(
        children: [
          TextField(
            decoration:
                inputDecoration.copyWith(hintText: "Email or Phone number"),
          ),
          const Divider(),
          TextField(
            obscureText: true,
            decoration: inputDecoration.copyWith(hintText: "Password"),
          ),
        ],
      ),
    );
  }
}
