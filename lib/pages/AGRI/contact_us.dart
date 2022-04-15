import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tasteefood/pages/home/home_page.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.pink , Colors.lightGreenAccent],
                  begin: const FractionalOffset(0.0,0.0),
                  end: const FractionalOffset(1.0,0.0),
                  stops: [0.0,1.0],
                  tileMode: TileMode.clamp
              )
          ),
        ),
        title: Text('Contact us'),
        centerTitle: true,

      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 15.0,top: 10.0),
              child: Text('Our customer support team provide best service. We’re friendly and available to chat. So, reach out us anytime and we will happily answer your questions.\n\nPhone- 045- 1560488\n\nFax- 045- 1560489\n\nFacebook- Bee’s Wish honey jelly',style: TextStyle(color: Colors.black , fontSize: 18.0 , fontWeight: FontWeight.bold),),
            ),
            SizedBox(height: 15.0,),

          ],
        ),
      ),
    );
  }
}
