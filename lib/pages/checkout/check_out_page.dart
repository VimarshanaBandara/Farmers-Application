import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasteefood/appColors/app_colors.dart';
import 'package:tasteefood/pages/Delivery/address.dart';
import 'package:tasteefood/pages/provider/cart_provider.dart';
import 'package:tasteefood/widgets/my_button.dart';
import 'package:tasteefood/widgets/single_cart_item.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class CheckOutPage extends StatefulWidget {
  const CheckOutPage({Key? key}) : super(key: key);

  @override
  _CheckOutPageState createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {
  late Razorpay _razorpay;
  late double totalPrice;

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }

  void openCheckout() async {
    var options = {
      'key': 'rzp_test_1DP5mmOlF5G5ag',
      'amount': num.parse(totalPrice.toString()) * 100,
      'name': 'Yaqoob Bugti',
      'description': 'Payment for some randonm product',
      'prefill': {
        'contact': '8888888888',
        'email': 'yaqoobkafeel580@gmail.com',
      },
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      print(e.toString());
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    print("Payment Susccess");
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    print("Payment error");
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    print("EXTERNAL_WALLET ");
  }

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    cartProvider.getCartData();

    double subTotal = cartProvider.subTotal();

    double discount = 5;
    int shipping = 10;

    double discountValue = (subTotal * discount) / 100;

    double value = subTotal - discountValue;

    totalPrice = value += shipping;

    if (cartProvider.getCartList.isEmpty) {
      setState(() {
        totalPrice = 0.0;
      });
    }

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          "Check out",
          style: TextStyle(
            color: AppColors.KblackColor,
          ),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
         decoration: BoxDecoration(
           image: DecorationImage(
             image: AssetImage('images/Bg2.png'),
             colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.1), BlendMode.dstATop),
             fit: BoxFit.cover,
           )
         ),
        child:  Column(
          children: [
            Expanded(
              child: cartProvider.getCartList.isEmpty
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
            ),
            Expanded(
              child: Column(
                children: [
                  ListTile(
                    leading: Text("Sub Total",style: TextStyle(color: Colors.black87 ,fontSize: 17.0,fontWeight: FontWeight.bold),),
                    trailing: Text("\$ $subTotal",style: TextStyle(color: Colors.black,fontSize: 16.0,fontWeight: FontWeight.bold),),
                  ),
                  ListTile(
                    leading: Text("Discount",style: TextStyle(color: Colors.black87 ,fontSize: 17.0,fontWeight: FontWeight.bold),),
                    trailing: Text("%5",style: TextStyle(color: Colors.black,fontSize: 16.0,fontWeight: FontWeight.bold),),
                  ),
                  ListTile(
                    leading: Text("Shiping",style: TextStyle(color: Colors.black87 ,fontSize: 17.0,fontWeight: FontWeight.bold),),
                    trailing: Text("\$10",style: TextStyle(color: Colors.black,fontSize: 16.0,fontWeight: FontWeight.bold),),
                  ),
                  Divider(
                    thickness: 2,
                  ),
                  ListTile(
                    leading: Text("Total",style: TextStyle(color: Colors.blue ,fontSize: 17.0,fontWeight: FontWeight.bold),),
                    trailing: Text("\$ $totalPrice",style: TextStyle(color: Colors.red,fontSize: 16.0,fontWeight: FontWeight.bold),),
                  ),
                  cartProvider.getCartList.isEmpty
                      ? Text("")
                      : RaisedButton(
                    color: Colors.yellowAccent,
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> Address()));
                    },
                    child: Text('Buy',style: TextStyle(color: Colors.black , fontWeight: FontWeight.bold , fontSize: 16.0),),
                  )
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}
