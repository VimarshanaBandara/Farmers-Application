import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasteefood/pages/login/login_page.dart';
import 'package:tasteefood/pages/signup/components/signup_auth_provider.dart';
import 'package:tasteefood/route/routing_page.dart';
import 'package:tasteefood/widgets/my_button.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController fullName = TextEditingController();
  TextEditingController emailAddress = TextEditingController();
  TextEditingController password = TextEditingController();

  bool visibility = true;
  @override
  Widget build(BuildContext context) {
    SignupAuthProvider signupAuthProvider =
        Provider.of<SignupAuthProvider>(context);

    return Scaffold(

      body: SingleChildScrollView(
        child:SafeArea(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.pink , Colors.lightGreenAccent],
                  begin: Alignment.topRight,
                  end:Alignment.bottomLeft,

                )

            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Container(
                        alignment: Alignment.bottomCenter,
                        child: Image.asset('images/signup.png',height: 290.0,width: 290.0,),
                      ),
                      TextFormField(
                        controller: fullName,
                        decoration: InputDecoration(
                            hintText: "Full name",
                            hintStyle: TextStyle(fontWeight: FontWeight.bold)
                        ),
                      ),
                      TextFormField(
                        controller: emailAddress,
                        decoration: InputDecoration(
                            hintText: "Email address",
                            hintStyle: TextStyle(fontWeight: FontWeight.bold)
                        ),
                      ),
                      TextFormField(
                        obscureText: visibility,
                        controller: password,
                        decoration: InputDecoration(
                          hintText: "Password",
                          hintStyle: TextStyle(fontWeight: FontWeight.bold),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                visibility = !visibility;
                              });
                            },
                            icon: Icon(
                              visibility ? Icons.visibility_off : Icons.visibility,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      signupAuthProvider.loading == false
                          ? MyButton(
                        onPressed: () {
                          signupAuthProvider.signupVaidation(
                            fullName: fullName,
                            context: context,
                            emailAdress: emailAddress,
                            password: password,
                          );
                        },
                        text: "SIGN UP",
                      )
                          : Center(
                        child: CircularProgressIndicator(),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Already have an account?\t\t",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,shadows: <Shadow>[
                            Shadow(
                              offset: Offset(2.0, 2.0),
                              blurRadius: 3.0,
                              color: Colors.black87,
                            ),
                            Shadow(
                              offset: Offset(2.0, 2.0),
                              blurRadius: 8.0,
                              color: Colors.black87,
                            ),
                          ],
                              fontSize: 16.0),),
                          GestureDetector(
                            onTap: () {
                              RoutingPage.goTonext(
                                context: context,
                                navigateTo: LoginPage(),
                              );
                            },
                            child: Text("LOGIN",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,shadows: <Shadow>[
                              Shadow(
                                offset: Offset(2.0, 2.0),
                                blurRadius: 3.0,
                                color: Colors.black87,
                              ),
                              Shadow(
                                offset: Offset(2.0, 2.0),
                                blurRadius: 8.0,
                                color: Colors.black87,
                              ),
                            ],
                                fontSize: 18.0),),
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ),

        ),
      )
    );
  }
}
