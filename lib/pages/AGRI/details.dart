import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tasteefood/pages/detailPage/details_page.dart';
class DetailsHoney1 extends StatefulWidget {
  const DetailsHoney1({Key? key}) : super(key: key);

  @override
  _DetailsHoney1State createState() => _DetailsHoney1State();
}

class _DetailsHoney1State extends State<DetailsHoney1> {
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
        title: Text('Honey Jelly'),
        centerTitle: true,

      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 15.0,),
            Padding(
              padding:EdgeInsets.only(left: 18.0),
              child: Text('Broken glass honey jelly pudding',style: TextStyle(color: Colors.black , fontSize: 22.0 , fontWeight: FontWeight.bold),),
            ),
            SizedBox(height: 14.0),
            Padding(
              padding:EdgeInsets.only(left: 18.0),
              child: Text('Ingredients',style: TextStyle(color: Colors.black , fontSize: 18.0 , fontWeight: FontWeight.w500),),
            ),
            SizedBox(height: 15.0,),
            Padding(
              padding:EdgeInsets.only(left: 18.0),
              child: Text('• Jelly Crystals\n• Gelatin\n• Condensed Milk\n• Water\n• Oil a little for greasing moulds ',style: TextStyle(color: Colors.black , fontSize: 18.0 , fontWeight: FontWeight.w500),),
            ),
            SizedBox(height:20.0,),
            Padding(
                padding: EdgeInsets.only(left: 25.0 ,right: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 150.0,
                      height: 180.0,
                      decoration: BoxDecoration(
                        // color: Colors.red,
                          image: DecorationImage(
                            image: AssetImage('AGRI/IM01.PNG'),
                            fit: BoxFit.cover,
                          )
                      ),

                    ),
                    Container(
                      width: 150.0,
                      height: 180.0,
                      decoration: BoxDecoration(
                        // color: Colors.red,
                          image: DecorationImage(
                            image: AssetImage('AGRI/IM03.JPG'),
                            fit: BoxFit.cover,
                          )
                      ),

                    ),
                  ],
                )
            ),
            SizedBox(height:15.0,),
            Padding(
              padding:EdgeInsets.only(left: 18.0),
              child: Text('Preparation',style: TextStyle(color: Colors.black , fontSize: 18.0 , fontWeight: FontWeight.w500),),
            ),
            SizedBox(height:15.0,),
            Padding(
              padding:EdgeInsets.only(left: 18.0),
              child: Text('1. pour ½ cup cold water in gelatin and let it soak for 5 mins. Take this in a saucepan, heat till it is melted. Set aside.\n\n2.	Take condensed milk in a bowl. In the condensed milk tin pour 1 cup of water and mix well. Pour this over the condensed milk and mix well. Pour the gelatin mix and mix well.\n\n3.	Now remove the bee’s wish honey jelly from package and freeze it,slice it into cubes.\n\n4.	Now take a big tray or mould to set the pudding. Grease it well with oil.\n\n5.	Put the cubes in the mould. Pour the condensed milk mix over this.\n\n6.	Chill this for 2 to 3 hours till it is set. ',style: TextStyle(color: Colors.black , fontSize: 18.0 , fontWeight: FontWeight.w500),),
            ),

             //PART 02 //

            SizedBox(height: 28.0,),
            Padding(
              padding:EdgeInsets.only(left: 18.0),
              child: Text('Honey jelly spread pancakes',style: TextStyle(color: Colors.black , fontSize: 22.0 , fontWeight: FontWeight.bold),),
            ),
            SizedBox(height: 15.0,),
            Padding(
              padding:EdgeInsets.only(left: 18.0),
              child: Text('Ingredients',style: TextStyle(color: Colors.black , fontSize: 18.0 , fontWeight: FontWeight.w500),),
            ),
            SizedBox(height: 20.0,),
            Padding(
              padding:EdgeInsets.only(left: 18.0),
              child: Text('• 1 1/2 cups self-raising flour\n• 1 tsp baking powder\n• 1/4 cup caster sugar\n• 2 eggs, lightly beaten\n•	60g butter, melted, cooled\n•	1 cup (250ml) milk\n•	1/2 tsp vanilla essence\n•	Bees wish honey jelly ',style: TextStyle(color: Colors.black , fontSize: 18.0 , fontWeight: FontWeight.w500),),
            ),

            SizedBox(height:20.0,),
            Padding(
                padding: EdgeInsets.only(left: 25.0 ,right: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 150.0,
                      height: 180.0,
                      decoration: BoxDecoration(
                        // color: Colors.red,
                          image: DecorationImage(
                            image: AssetImage('AGRI/IM02.PNG'),
                            fit: BoxFit.cover,
                          )
                      ),

                    ),
                    Container(
                      width: 150.0,
                      height: 180.0,
                      decoration: BoxDecoration(
                        // color: Colors.red,
                          image: DecorationImage(
                            image: AssetImage('AGRI/IM04.JPG'),
                            fit: BoxFit.cover,
                          )
                      ),

                    ),
                  ],
                )
            ),
            Padding(
              padding:EdgeInsets.only(left: 18.0),
              child: Text('Preparation',style: TextStyle(color: Colors.black , fontSize: 18.0 , fontWeight: FontWeight.w500),),
            ),
            SizedBox(height:15.0,),
            Padding(
              padding:EdgeInsets.only(left: 18.0),
              child: Text('1. Sift the flour and baking powder into a medium mixing bowl and Stir in the sugar.\n\n2.	Combine the eggs, butter, milk and vanilla in a jug. Pour in the milk mixture and use a whisk to mix to a smooth batter. \n\n3.	Cover with plastic wrap and Stand 10 minutes\n\n4. Heat a medium non-stick frypan over medium to low heat and Lightly oil with cooking spray.\n\n5.	Pour 1/4 cup of the batter into the pan and cook for 2 minutes or until small bubbles appear on the surface. \n\n6.	Turn over and cook for 1 minute or until golden and cooked through.\n\n7.	Spread Bee’s wish honey jelly on the pancakes and serve.',style: TextStyle(color: Colors.black , fontSize: 18.0 , fontWeight: FontWeight.w500),),
            ),





          ],
        ),
      ),
    );
  }
}
