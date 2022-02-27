import 'package:flutter/material.dart';
import 'package:tasteefood/appColors/app_colors.dart';

class TopPart extends StatelessWidget {
  const TopPart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [

            Text(
              "Login",
              style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),

            )
          ],
        ),
      ],
    );
  }
}
