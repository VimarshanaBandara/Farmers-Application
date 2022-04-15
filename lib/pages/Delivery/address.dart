import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:tasteefood/pages/payments/card_payments.dart';

class Address extends StatefulWidget {
  const Address({Key? key}) : super(key: key);

  @override
  _AddressState createState() => _AddressState();
}

class _AddressState extends State<Address> {

  TextEditingController sampledata1 = TextEditingController();
  TextEditingController sampledata2 = TextEditingController();
  TextEditingController sampledata3 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Delivery Contacts',style: TextStyle(color: Colors.white , fontWeight: FontWeight.bold),),
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
        ),
        body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('images/Bg.png'),
                    fit: BoxFit.fill
                )
            ),
            child: SingleChildScrollView(
              child: Form(
                //key: formkey,
                child: Container(
                  padding: EdgeInsets.all(30.0),
                  child: Column(

                    children: [
                      TextFormField(
                        controller: sampledata1,
                        decoration: InputDecoration(
                            icon: Icon(Icons.account_circle,color:Colors.black87),
                            hintText: "Name",
                            hintStyle: TextStyle(
                              color: Colors.black45,
                              fontWeight: FontWeight.bold,
                            )
                        ),

                      ),
                      SizedBox(
                        height: 25.0,
                      ),
                      TextFormField(
                        controller: sampledata2,
                        decoration: InputDecoration(
                            icon: Icon(Icons.phone,color:Colors.black87),
                            hintText: "Contact No",

                            hintStyle: TextStyle(
                              color: Colors.black45,
                              fontWeight: FontWeight.bold,
                            )

                        ),

                      ),
                      SizedBox(
                        height: 25.0,
                      ),
                      TextFormField(
                        controller: sampledata3,
                        decoration: InputDecoration(
                            icon: Icon(Icons.location_city,color:Colors.black87),
                            hintText: "Delivery Address",
                            hintStyle: TextStyle(
                              color: Colors.black45,
                              fontWeight: FontWeight.bold,
                            )

                        ),

                      ),

                      SizedBox(
                        height: 30.0,
                      ),
                      FlatButton(
                        onPressed: (){
                          Map<String,dynamic>data={"field1":sampledata1.text , "field2":sampledata2.text, "field3":sampledata3.text  };
                          FirebaseFirestore.instance.collection("test").add(data);
                          _displaySuccessToast(context);
                        },
                        color: Colors.greenAccent[200],
                        child: Text('Store Order',style: TextStyle(fontWeight: FontWeight.bold),),
                      ),

                      
                    ],
                  ),
                ),
              ),
            )
        )
    );

  }
}

void _displaySuccessToast(context){
  MotionToast.success(
      title: Text("Success",style: TextStyle(fontWeight: FontWeight.bold),),
      description: Text("Successful Payment")
  ).show(context);
}
