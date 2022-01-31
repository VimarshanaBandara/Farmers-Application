import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

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
        title: Text('Delivery Contacts',style: TextStyle(color: Colors.blue , fontWeight: FontWeight.bold),),
        backgroundColor: Colors.white,
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
                  },
                  color: Colors.greenAccent[200],
                  child: Text('Store Order'),
                ),
              ],
            ),
          ),
        ),
      )
    );

  }
}
