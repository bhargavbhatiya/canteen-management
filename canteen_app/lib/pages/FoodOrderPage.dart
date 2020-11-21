import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:canteen_app/global.dart';

class SignInButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: new BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Color(0xFFfbab66),
          ),
          BoxShadow(
            color: Color(0xFFf7418c),
          ),
        ],
        gradient: new LinearGradient(
            colors: [Color(0xFFf7418c), Color(0xFFfbab66)],
            begin: const FractionalOffset(0.2, 0.2),
            end: const FractionalOffset(1.0, 1.0),
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp),
      ),
      child: MaterialButton(
          highlightColor: Colors.transparent,
          splashColor: Color(0xFFf7418c),
          //shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5.0))),
          child: Padding(
            padding:
            const EdgeInsets.symmetric(vertical: 10.0, horizontal: 42.0),
            child: Text(
              "PLACE ORDER",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                  fontFamily: "WorkSansBold"),
            ),
          ),
          onPressed: () => {
            placeOrder()
          }),
    );
  }
}

bool payment = false;
String t = total.toString();

void placeOrder() async {
  await Firebase.initializeApp();
  print("fuc called");
  FirebaseFirestore.instance
      .collection('orders')
      .add({
    "amount": total,
    "items": items,
    "user": currentUser,
    "quantity":quantity,
    "payment": payment,
    "orderid": orders + 1,
  })
      .then((result) => {
    print("success"),
    Dialog(child: Text("Ordered sucessfully"),),
    updateUser()
  })
      .catchError((err) => Dialog(child: Text(err)));
}

void updateUser(){
  FirebaseFirestore.instance.collection("users")
      .document(uid)
      .updateData({
    "orders": [1]
  });
}


class FoodOrderPage extends StatefulWidget {
  @override
  _FoodOrderPageState createState() => _FoodOrderPageState();
}

class _FoodOrderPageState extends State<FoodOrderPage> {
  int counter = 3;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xFFFAFAFA),
            elevation: 0,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: Color(0xFF3a3737),
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
            title: Center(
              child: Text(
                "Item Carts",
                style: TextStyle(
                    color: Color(0xFF3a3737),
                    fontWeight: FontWeight.w600,
                    fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ),
            brightness: Brightness.light,
            actions: <Widget>[
              CartIconWithBadge(),
            ],
          ),
          body: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(left: 5),
                    child: Text(
                      "Your Food Cart",
                      style: TextStyle(
                          fontSize: 20,
                          color: Color(0xFF3a3a3b),
                          fontWeight: FontWeight.w600),
                      textAlign: TextAlign.left,
                    ),
                  ),

                  SizedBox(
                    height: 10,
                  ),
              Container(
                alignment: Alignment.center,
                width: double.infinity,
                height: 100,
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                    color: Color(0xFFfae3e2).withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: Offset(0, 1),
                  ),
                ]),
                child: Card(
                  color: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(5.0),
                    ),
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(left: 25, right: 30, top: 10, bottom: 10),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "items",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Color(0xFF3a3a3b),
                                  fontWeight: FontWeight.w600),
                              textAlign: TextAlign.left,
                            ),
                            Text(
                              "price",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Color(0xFF3a3a3b),
                                  fontWeight: FontWeight.w600),
                              textAlign: TextAlign.left,
                            ),
                            Text(
                              "quantity",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Color(0xFF3a3a3b),
                                  fontWeight: FontWeight.w600),
                              textAlign: TextAlign.left,
                            ),
                            Text(
                              "Amount",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Color(0xFF3a3a3b),
                                  fontWeight: FontWeight.w600),
                              textAlign: TextAlign.left,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),

                  SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Container(
                      width: double.maxFinite,
                      height: 300,
                      child: ListDisplay(),
                    )),
                  Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    height: 100,
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                        color: Color(0xFFfae3e2).withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset: Offset(0, 1),
                      ),
                    ]),
                    child: Card(
                      color: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(5.0),
                        ),
                      ),
                      child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.only(left: 25, right: 30, top: 10, bottom: 10),
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  "Total",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Color(0xFF3a3a3b),
                                      fontWeight: FontWeight.w600),
                                  textAlign: TextAlign.left,
                                ),
                                Text(
                                  total.toString(),
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Color(0xFF3a3a3b),
                                      fontWeight: FontWeight.w600),
                                  textAlign: TextAlign.left,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 10,
                  ),

                  Container(
                    padding: EdgeInsets.only(left: 5),
                    child: Text(
                      "Payment Method",
                      style: TextStyle(
                          fontSize: 20,
                          color: Color(0xFF3a3a3b),
                          fontWeight: FontWeight.w600),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  PaymentMethodWidget(),
                  SizedBox(
                    height: 10,
                  ),
                  SignInButtonWidget(),
                ],
              ),
            ),
          )),
    );
  }
}

class PaymentMethodWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Color(0xFFfae3e2).withOpacity(0.1),
          spreadRadius: 1,
          blurRadius: 1,
          offset: Offset(0, 1),
        ),
      ]),
      child: Card(
        color: Colors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(5.0),
          ),
        ),
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(left: 10, right: 30, top: 10, bottom: 10),
          child: Row(
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                child: Image.asset(
                  "assets/images/menus/ic_credit_card.png",
                  width: 50,
                  height: 50,
                ),
              ),
              Text(
                "Credit/Debit Card",
                style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF3a3a3b),
                    fontWeight: FontWeight.w400),
                textAlign: TextAlign.left,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TotalCalculationWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      height: 150,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Color(0xFFfae3e2).withOpacity(0.1),
          spreadRadius: 1,
          blurRadius: 1,
          offset: Offset(0, 1),
        ),
      ]),
      child: Card(
        color: Colors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(5.0),
          ),
        ),
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(left: 25, right: 30, top: 10, bottom: 10),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  ListView.builder(
                    itemCount: items.length,
                      itemBuilder: (BuildContext ctxt, int index) {
                        return new Text(items[index] + "       " + quantity[index].toString() + "         " + prices[index].toString(),
                          style: TextStyle(
                              fontSize: 18,
                              color: Color(0xFF3a3a3b),
                              fontWeight: FontWeight.w600),
                          textAlign: TextAlign.left,
                        );
                      }),
                  Text(
                    "Total",
                    style: TextStyle(
                        fontSize: 18,
                        color: Color(0xFF3a3a3b),
                        fontWeight: FontWeight.w600),
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    total.toString(),
                    style: TextStyle(
                        fontSize: 18,
                        color: Color(0xFF3a3a3b),
                        fontWeight: FontWeight.w600),
                    textAlign: TextAlign.left,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PromoCodeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.only(left: 3, right: 3),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Color(0xFFfae3e2).withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 1,
            offset: Offset(0, 1),
          ),
        ]),
        child: TextFormField(
          decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFe6e1e1), width: 1.0),
              ),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFe6e1e1), width: 1.0),
                  borderRadius: BorderRadius.circular(7)),
              fillColor: Colors.white,
              hintText: 'Add Your Promo Code',
              filled: true,
              suffixIcon: IconButton(
                  icon: Icon(
                    Icons.local_offer,
                    color: Color(0xFFfd2c2c),
                  ),
                  onPressed: () {
                    debugPrint('222');
                  })),
        ),
      ),
    );
  }
}

class CartItem extends StatelessWidget {
  String productName;
  String productPrice;
  String productImage;
  String productCartQuantity;

  CartItem({
    Key key,
    @required this.productName,
    @required this.productPrice,
    @required this.productImage,
    @required this.productCartQuantity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 130,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Color(0xFFfae3e2).withOpacity(0.3),
          spreadRadius: 1,
          blurRadius: 1,
          offset: Offset(0, 1),
        ),
      ]),
      child: Card(
          color: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: const BorderRadius.all(
              Radius.circular(5.0),
            ),
          ),
          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(left: 5, right: 5, top: 10, bottom: 10),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Container(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Center(
                        child: Image.asset(
                      "assets/images/popular_foods/$productImage.png",
                      width: 110,
                      height: 100,
                    )),
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              child: Text(
                                "$productName",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Color(0xFF3a3a3b),
                                    fontWeight: FontWeight.w400),
                                textAlign: TextAlign.left,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              child: Text(
                                "$productPrice",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Color(0xFF3a3a3b),
                                    fontWeight: FontWeight.w400),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 40,
                        ),
                        Container(
                          alignment: Alignment.centerRight,
                          child: Image.asset(
                            "assets/images/menus/ic_delete.png",
                            width: 25,
                            height: 25,
                          ),
                        )
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20),
                      alignment: Alignment.centerRight,
                      child: AddToCartMenu(2),
                    )
                  ],
                )
              ],
            ),
          )),
    );
  }
}

class CartIconWithBadge extends StatelessWidget {
  int counter = 3;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        IconButton(
            icon: Icon(
              Icons.business_center,
              color: Color(0xFF3a3737),
            ),
            onPressed: () {}),
        counter != 0
            ? Positioned(
                right: 11,
                top: 11,
                child: Container(
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  constraints: BoxConstraints(
                    minWidth: 14,
                    minHeight: 14,
                  ),
                  child: Text(
                    '$counter',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 8,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            : Container()
      ],
    );
  }
}

class AddToCartMenu extends StatelessWidget {
  int productCounter;

  AddToCartMenu(this.productCounter);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.remove),
            color: Colors.black,
            iconSize: 18,
          ),
          InkWell(
            onTap: () => print('hello'),
            child: Container(
              width: 100.0,
              height: 35.0,
              decoration: BoxDecoration(
                color: Color(0xFFfd2c2c),
                border: Border.all(color: Colors.white, width: 2.0),
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Center(
                child: Text(
                  'Add To $productCounter',
                  style: new TextStyle(
                      fontSize: 12.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w300),
                ),
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.add),
            color: Color(0xFFfd2c2c),
            iconSize: 18,
          ),
        ],
      ),
    );
  }
}
