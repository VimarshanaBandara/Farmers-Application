import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tasteefood/pages/home/home_page.dart';
class AboutUs extends StatefulWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
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
        title: Text('About us'),
        centerTitle: true,

      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 15.0,top: 10.0),
              child: Text('Our Story',style: TextStyle(color: Colors.black , fontSize: 18.0 , fontWeight: FontWeight.bold),),
            ),
            SizedBox(height: 15.0,),
            Padding(
              padding: EdgeInsets.only(left: 15.0,top: 10.0),
              child: Text('Great new jelly product comes first every day. More than many customers visit and find value added products from honey. And they want to test high-quality, great-tasting and affordable product. \n\nBee’s Wish honey jelly is a new product chain in the Sri Lanka. It is the creation of us and launched innovative honey product in 2020. Our passion to bring forth the rich in nutritious and tasteful delights to the public drew leads to start up our own business. The main ingredient is honey and our commitment to premium ingredients, signature recipes and sweet desert experience. \n\nBee’s Wish with a dedicated and friendly staff, we strive to provide the best quality honey jelly and customer service always. And also, we think about our product is great.'),
            ),
            SizedBox(height: 15.0,),
            Padding(
              padding: EdgeInsets.only(left: 15.0,top: 10.0),
              child: Text('Vision',style: TextStyle(color: Colors.black , fontSize: 18.0 , fontWeight: FontWeight.bold),),
            ),
            SizedBox(height: 15.0,),
            Padding(
              padding: EdgeInsets.only(left: 15.0,top: 10.0),
              child: Text('To be Sri Lanka’s exclusive honey product company by offering quality, nutritious products with superior taste.'),
            ),
            SizedBox(height: 15.0,),
            Padding(
              padding: EdgeInsets.only(left: 15.0,top: 10.0),
              child: Text('Mision',style: TextStyle(color: Colors.black , fontSize: 18.0 , fontWeight: FontWeight.bold),),
            ),
            SizedBox(height: 15.0,),
            Padding(
              padding: EdgeInsets.only(left: 15.0,top: 10.0),
              child: Text('Bee’s wish is dedicated to producing the highest quality honey jelly, delivering superior customer service. We seek to be a responsible company and to ensure high-quality and safety standards in our business.\n\nWe expect our consumers and business partners to have confidence in the product bearing our name and that our product is manufactured in accordance with a guiding code of conduct. Bee’s wish is committed to conducting business with ethical business standards and asks its’ vendors, suppliers and licensees to conduct themselves in the same manner.'),
            ),
          ],
        ),
      ),
    );
  }
}
