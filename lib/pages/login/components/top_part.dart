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

            Container(
              alignment: Alignment.bottomCenter,
              child: Image.asset('images/login.png',height: 260.0,width: 260.0,),
            ),
          ],
        ),
      ],
    );
  }
}
