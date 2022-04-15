import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasteefood/pages/checkout/check_out_page.dart';
import 'package:tasteefood/pages/provider/cart_provider.dart';
import 'package:tasteefood/route/routing_page.dart';
import 'package:tasteefood/widgets/my_button.dart';
import 'package:tasteefood/widgets/single_cart_item.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    cartProvider.getCartData();

    return Scaffold(
      bottomNavigationBar: cartProvider.getCartList.isEmpty
          ? Text("")
          : MyButton(
        text: "Check Out",
        onPressed: () {
          RoutingPage.goTonext(
            context: context,
            navigateTo: CheckOutPage(),
          );
        },
      ),
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
        elevation: 0,
      ),
      body: cartProvider.getCartList.isEmpty
          ? Center(
        child: Text("No Product"),
      )
          : ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: cartProvider.getCartList.length,
        itemBuilder: (ctx, index) {
          var data = cartProvider.cartList[index];
          return SingleCartItem(
            productId: data.productId,
            productCategory: data.productCategory,
            productImage: data.productImage,
            productPrice: data.productPrice,
            productQuantity: data.productQuantity,
            productName: data.productName,
          );
        },
      ),
    );
  }
}