import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tasteefood/pages/home/home_page.dart';
class MainMenu extends StatefulWidget {
  const MainMenu({Key? key}) : super(key: key);

  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

          body: SingleChildScrollView(
            child: Container(


              width: MediaQuery.of(context).size.width,
              height:MediaQuery.of(context).size.height ,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/Bg.png'),
                    fit: BoxFit.fill, colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.7), BlendMode.dstATop),
                  )
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [


                  GestureDetector(

                    child: Image.asset('images/btn1.png',width: 300.0,height: 260,),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
                    }
                  ),
                  GestureDetector(

                    child: Image.asset('images/btn2.png',width: 300.0,height: 260,),
                      onTap: (){
                        //Navigator.push(context, MaterialPageRoute(builder: (context)=>DetectScreen()));
                      }

                  ),

                ],
              ),
            ),
          )
        ),
      );


  }
}
