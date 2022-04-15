import 'package:flutter/material.dart';
import 'dart:async';

import 'package:tasteefood/pages/welcome/welcome_page.dart';







class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {

    super.initState();
    displaySplash();
  }

  displaySplash(){

    Timer(Duration(seconds: 3), () async{



      Route route = MaterialPageRoute(builder: (_) =>  WelcomePage());
      Navigator.pushReplacement(context, route);


    });

  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [

          Container(

            decoration:   BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('AGRI/sp1.png'),
                    fit: BoxFit.fill
                )

            ),

          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [

                      Padding(
                        padding: EdgeInsets.only(top: 70.0),

                      ),
                      Text("Welcome",style: TextStyle(color: Colors.black26,fontSize: 35.0,fontWeight: FontWeight.bold ,
                      ),
                      ),
                    ],
                  ),
                ),

              ),
              Expanded(
                flex:8,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [




                    Text("Bee\'s Wish",style: TextStyle(color: Colors.blue,fontSize: 26.0,fontWeight: FontWeight.bold,
                    ),
                    ),






                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}