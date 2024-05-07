import 'package:flutter/material.dart';

import 'background_gradient.dart';
import 'form_container.dart';

class Login2 extends StatelessWidget {
  const Login2({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var w = size.width;
    var h = size.height;
    return Stack(
      children: [
        BackgroundGradient(h: h, w: w),
        Positioned(
          bottom: 0,
          child: FormContainer(h: h, w: w),
        ),
      ],
    );
  }
}
