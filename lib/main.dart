import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasteefood/pages/login/components/login_auth_provider.dart';
import 'package:tasteefood/pages/menu/mainmenu.dart';
import 'package:tasteefood/pages/provider/cart_provider.dart';
import 'package:tasteefood/pages/provider/favorite_provider.dart';
import 'package:tasteefood/pages/signup/components/signup_auth_provider.dart';
import 'package:tasteefood/pages/splash_screen/splash_screen.dart';
import 'package:tasteefood/pages/welcome/welcome_page.dart';
import 'package:firebase_core/firebase_core.dart';





void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SignupAuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => LoginAuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CartProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => FavoriteProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Testee Food',
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            iconTheme: IconThemeData(
              color: Colors.black,
            ),
          ),

          primarySwatch: Colors.blue,
        ),
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, userSnp) {
            if (userSnp.hasData) {
              return SplashScreen();
            }
            return SplashScreen();
          },
        ),
        // home: SignupPage(),
      ),
    );
  }
}
