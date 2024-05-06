import 'package:flutter/material.dart';

const inputDecorations = InputDecoration(
  border: InputBorder.none,
  hintStyle: TextStyle(
    fontSize: 18,
    letterSpacing: 1,
  ),
);

const inputTextStyles = TextStyle(
  fontSize: 18,
  letterSpacing: 1,
);

class InputContainer extends StatelessWidget {
  const InputContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 50, 30, 50),
      width: 400,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(120),
          bottomRight: Radius.circular(120),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 50,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            style: inputTextStyles,
            keyboardType: TextInputType.emailAddress,
            decoration: inputDecorations.copyWith(
              prefixIcon: const Icon(Icons.person_rounded),
              hintText: "Username",
            ),
          ),
          TextField(
            obscureText: true,
            style: inputTextStyles,
            decoration: inputDecorations.copyWith(
              prefixIcon: const Icon(Icons.lock_rounded),
              hintText: "Password",
            ),
          ),
        ],
      ),
    );
  }
}
