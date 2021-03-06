import 'package:flutter/material.dart';
import 'package:tasteefood/appColors/app_colors.dart';
import 'package:tasteefood/pages/login/login_page.dart';
import 'package:tasteefood/pages/signup/signup_page.dart';
import 'package:tasteefood/route/routing_page.dart';
import 'package:tasteefood/widgets/my_button.dart';

class EndPart extends StatelessWidget {
  const EndPart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [


        RaisedButton.icon(
          onPressed: () {
            RoutingPage.goTonext(
              context: context,
              navigateTo: LoginPage(),
            );
          },
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          label: Text('LOG IN',
            style: TextStyle(color: Colors.black,fontSize: 18.0,fontWeight: FontWeight.bold),),
          icon: Icon(Icons.login, color:Colors.black,),
          textColor: Colors.white,
          splashColor: Colors.red,
          color: Colors.yellow,),

        SizedBox(
          height: 20,
        ),

        RaisedButton.icon(
          onPressed:  () {
            RoutingPage.goTonext(
              context: context,
              navigateTo: SignupPage(),
            );
          },
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          label: Text('SIGN UP',
            style: TextStyle(color: Colors.black,fontSize: 18.0,fontWeight: FontWeight.bold),),
          icon: Icon(Icons.wysiwyg, color:Colors.black,),
          textColor: Colors.white,
          splashColor: Colors.red,
          color: Colors.yellow,),


      ],
    );
  }
}
