import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tasteefood/pages/home/home_page.dart';
import 'package:tasteefood/route/routing_page.dart';
import 'package:tasteefood/widgets/my_button.dart';

class ProfilePage extends StatefulWidget {
  static Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  RegExp regExp = RegExp(ProfilePage.pattern.toString());

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isEdit = false;

  TextEditingController fullName =
      TextEditingController(text: userModel.fullName);
  TextEditingController emailAddress =
      TextEditingController(text: userModel.emailAddress);

  Widget textFromField({required String hintText}) {
    return Container(
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[300],
      ),
      child: ListTile(
        leading: Text(hintText),
      ),
    );
  }

  void profileVaidation(
      {required TextEditingController? emailAdress,
      required TextEditingController? fullName,
      required BuildContext context}) async {
    if (fullName!.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("fullName is empty"),
        ),
      );
      return;
    } else if (emailAdress!.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Email address is empty"),
        ),
      );
      return;
    } else if (!widget.regExp.hasMatch(emailAdress.text.trim())) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Invalid email address"),
        ),
      );
      return;
    } else {
      buildUpdateProfile();
    }
  }

  Widget nonEditTextField() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage("images/non_profile.jpg"),
              radius: 50,
            ),
          ],
        ),
        SizedBox(
          height: 15,
        ),
        textFromField(hintText: userModel.fullName),
        SizedBox(
          height: 15,
        ),
        textFromField(hintText: userModel.emailAddress),
      ],
    );
  }

  Widget editTextField() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage("images/non_profile.jpg"),
              radius: 50,
            ),
          ],
        ),
        TextFormField(
          controller: fullName,
          decoration: InputDecoration(hintText: "fullName"),
        ),
        SizedBox(height: 15.0,),
        TextFormField(
          controller: emailAddress,
          decoration: InputDecoration(
            hintText: "emailAddres",
          ),
        ),
        SizedBox(
          height: 15,
        ),
        MyButton(
          onPressed: () {
            profileVaidation(
              context: context,
              emailAdress: emailAddress,
              fullName: fullName,
            );
          },
          text: "Up date",
        )
      ],
    );
  }

  Future buildUpdateProfile() async {
    FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .update(
      {
        "fullName": fullName.text,
        "emailAdress": emailAddress.text,
      },
    ).then(
      (value) => RoutingPage.goTonext(
        context: context,
        navigateTo: HomePage(),
      ),
    );
  }

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
        title: Text('Edit Profile'),
        leading: isEdit
            ? IconButton(
                onPressed: () {
                  setState(() {
                    isEdit = false;
                  });
                },
                icon: Icon(Icons.close),
              )
            : IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back,
                ),
              ),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                isEdit = true;
              });
            },
            icon: Icon(Icons.edit),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                child: isEdit ? editTextField() : nonEditTextField(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
