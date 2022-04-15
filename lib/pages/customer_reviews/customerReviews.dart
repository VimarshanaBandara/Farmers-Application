import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:pushable_button/pushable_button.dart';
class CustomerReviews extends StatefulWidget {
  const CustomerReviews({Key? key}) : super(key: key);

  @override
  _CustomerReviewsState createState() => _CustomerReviewsState();
}

class _CustomerReviewsState extends State<CustomerReviews> {


  TextEditingController customerreview1 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Customer Reviews',style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.white,
        elevation: 1.0,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              SizedBox(height: 10.0,),
              Container(
                height: 300.0,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('images/customerReviews.png')
                    )
                ),
              ),
              SizedBox(height: 10.0,),
              Padding(
                padding: EdgeInsets.only(left: 10.0 , right: 10.0),
                child:  TextFormField(
                   controller: customerreview1,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  decoration: InputDecoration(
                      icon: Icon(Icons.add_comment,color:Colors.black87),
                      hintText: "Comments",
                      hintStyle: TextStyle(
                        color: Colors.black45,
                        fontWeight: FontWeight.bold,
                      )

                  ),

                ),
              ),
              SizedBox(height: 100.0,),

              Padding(
                padding: EdgeInsets.only(left: 30.0 , right: 30.0),
                child: PushableButton(
                  child: Text('SUBMIT' ,style: TextStyle(color: Colors.white , fontSize: 22.0 , fontWeight: FontWeight.bold),),
                  height: 60,
                  elevation: 8.0,
                  hslColor: HSLColor.fromAHSL(1.0, 120, 1.0, 0.37),
                  shadow: BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 2),
                  ),
                  onPressed: (){
                    Map<String,dynamic>data={"field1":customerreview1.text   };
                    FirebaseFirestore.instance.collection("CustomerReviews").add(data);
                    _displaySuccessToast(context);
                  },
                )
              )

            ],
          ),
        ),
      )
    );
  }
} void _displaySuccessToast(context){
  MotionToast.success(
      title: Text("Success",style: TextStyle(fontWeight: FontWeight.bold),),
      description: Text("This is Success Toast")
  ).show(context);
}
