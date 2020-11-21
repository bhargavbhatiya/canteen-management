import 'package:canteen_app/animation/ScaleRoute.dart';
import 'package:canteen_app/global.dart';
import 'package:flutter/material.dart';
import 'package:canteen_app/pages/FoodDetailsPage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:canteen_app/pages/HomePage.dart';

class PopularFoodsWidget extends StatefulWidget {
  @override
  _PopularFoodsWidgetState createState() => _PopularFoodsWidgetState();
}

class _PopularFoodsWidgetState extends State<PopularFoodsWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 310,
      width: double.infinity,
      child: Column(
        children: <Widget>[
          PopularFoodTitle(),
          Expanded(
            child: PopularFoodItems(),
          )
        ],
      ),
    );
  }
}

TextEditingController q = new TextEditingController(text: "1");

class PopularFoodTiles extends StatelessWidget {
  String name;
  String imageUrl;
  String description;
  String price;
  String image;

  PopularFoodTiles(
      {Key key,
      @required this.name,
      @required this.imageUrl,
      @required this.description,
      @required this.price,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, ScaleRoute(page: FoodDetailsPage()));
      },
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 10, right: 5, top: 5, bottom: 5),
            decoration: BoxDecoration(boxShadow: [
              /* BoxShadow(
                color: Color(0xFFfae3e2),
                blurRadius: 15.0,
                offset: Offset(0, 0.75),
              ),*/
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
                  width: 170,
                  height: 250,
                  child: Column(
                    children: <Widget>[
                      Stack(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.topRight,
                            child: Container(
                              alignment: Alignment.topRight,
                              width: double.infinity,
                              padding: EdgeInsets.only(right: 5, top: 5),
                              child: Container(
                                height: 28,
                                width: 28,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white70,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color(0xFFfae3e2),
                                        blurRadius: 25.0,
                                        offset: Offset(0.0, 0.75),
                                      ),
                                    ]),
                                child: Icon(
                                  Icons.favorite,
                                  color: Color(0xFFfb3132),
                                  size: 16,
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Center(
                                child: Image.asset(
                              'assets/images/popular_foods/ic_popular_food_1' +
                                  ".png",
                              width: 130,
                              height: 140,
                            )),
                          )
                        ],
                      ),
                      RaisedButton(
                          child: Text("add to cart"),
                          onPressed: () {
///<<<<<<< ui
                            showDialog(
                              context: context,
                                child: new Dialog(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.all(
                                          Radius.circular(10.0))),
                              child: new Column(
                                children: <Widget>[
                                  Text("Name: " + name),
                                  Text("Price: " + price),
                                  new TextField(
                                    decoration: new InputDecoration(
                                        hintText: "Quantity"),
                                    controller: q,
                                  ),
                                  new FlatButton(
                                      child: new Text("Add"),
                                      onPressed: () {
                                        addToCart(name, price);
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => HomePage()),
                                        );
                                      }
                                  ),
                                ],),));
=======
                            addToCart(this.name, this.price);
///>>>>>>> main
                          }),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            alignment: Alignment.bottomLeft,
                            padding: EdgeInsets.only(left: 5, top: 5),
                            child: Text(name,
                                style: TextStyle(
                                    color: Color(0xFF6e6e71),
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500)),
                          ),
                          Container(
                            alignment: Alignment.topRight,
                            padding: EdgeInsets.only(right: 5),
                            child: Container(
                              height: 28,
                              width: 28,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white70,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0xFFfae3e2),
                                      blurRadius: 25.0,
                                      offset: Offset(0.0, 0.75),
                                    ),
                                  ]),
                              child: Icon(
                                Icons.near_me,
                                color: Color(0xFFfb3132),
                                size: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Container(
                                alignment: Alignment.topLeft,
                                padding: EdgeInsets.only(left: 5, top: 5),
                                child: Text("rating",
                                    style: TextStyle(
                                        color: Color(0xFF6e6e71),
                                        fontSize: 10,
                                        fontWeight: FontWeight.w400)),
                              ),
                              Container(
                                padding: EdgeInsets.only(top: 3, left: 5),
                                child: Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.star,
                                      size: 10,
                                      color: Color(0xFFfb3132),
                                    ),
                                    Icon(
                                      Icons.star,
                                      size: 10,
                                      color: Color(0xFFfb3132),
                                    ),
                                    Icon(
                                      Icons.star,
                                      size: 10,
                                      color: Color(0xFFfb3132),
                                    ),
                                    Icon(
                                      Icons.star,
                                      size: 10,
                                      color: Color(0xFFfb3132),
                                    ),
                                    Icon(
                                      Icons.star,
                                      size: 10,
                                      color: Color(0xFF9b9b9c),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                alignment: Alignment.topLeft,
                                padding: EdgeInsets.only(left: 5, top: 5),
                                child: Text("numberOfRating",
                                    style: TextStyle(
                                        color: Color(0xFF6e6e71),
                                        fontSize: 10,
                                        fontWeight: FontWeight.w400)),
                              ),
                            ],
                          ),
                          Container(
                            alignment: Alignment.bottomLeft,
                            padding: EdgeInsets.only(left: 5, top: 5, right: 5),
                            child: Text('\$' + price,
                                style: TextStyle(
                                    color: Color(0xFF6e6e71),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600)),
                          ),
                        ],
                      )
                    ],
                  ),
                )),
          ),
        ],
      ),
    );
  }
}

class PopularFoodTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            "Popluar Foods",
            style: TextStyle(
                fontSize: 20,
                color: Color(0xFF3a3a3b),
                fontWeight: FontWeight.w300),
          ),
          Text(
            "See all",
            style: TextStyle(
                fontSize: 16, color: Colors.blue, fontWeight: FontWeight.w100),
          )
        ],
      ),
    );
  }
}

class PopularFoodItems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      //itemBuilder: (BuildContext ctxt, int index) => getItems(),
      children: <Widget>[
        PopularFoodTiles(
            name: "Fried Egg",
            imageUrl: "ic_popular_food_1",
            price: '15',
            description: "fried_egg"),
        PopularFoodTiles(
            name: "Mixed Vegetable",
            imageUrl: "ic_popular_food_3",
            price: "17",
            description: ""),
        PopularFoodTiles(
            name: "Salad With Chicken",
            imageUrl: "ic_popular_food_4",
            price: "11",
            description: ""),
        PopularFoodTiles(
            name: "Mixed Salad",
            imageUrl: "ic_popular_food_5",
            price: "11",
            description: ""),
        PopularFoodTiles(
            name: "Red meat,Salad",
            imageUrl: "ic_popular_food_2",
            price: "12",
            description: ""),
        PopularFoodTiles(
            name: "Mixed Salad",
            imageUrl: "ic_popular_food_5",
            price: "11",
            description: ""),
        PopularFoodTiles(
            name: "Potato,Meat fry",
            imageUrl: "ic_popular_food_6",
            price: "23",
            description: ""),
        PopularFoodTiles(
            name: "Fried Egg",
            imageUrl: "ic_popular_food_1",
            price: '12',
            description: "fried_egg"),
        PopularFoodTiles(
            name: "Red meat,Salad",
            imageUrl: "ic_popular_food_2",
            price: "12",
            description: ""),
      ],
    );
  }
}

///<<<<<<< ui

getItems() async {
   await Firebase.initializeApp();
   FirebaseFirestore.instance.collection("items").get().then((querySnapshot) {
     querySnapshot.docs.forEach((result) {
       return PopularFoodTiles(
         name: result.get("name"),
         imageUrl: result.get("image"),
         description: result.get("description"),
         price: result.get("price"),
       );
     });
   });
 }
   //FirebaseFirestore.instance.collection("items")
   //.getDocuments()
   //.then(QuerySnapshot snapshot){
     //snapshot.documents.forEach((f) => return PopularFoodTiles(
       //  name: f.name,
         // imageUrl:
     //));
   //};
  //return PopularFoodTiles(
    //name: "Noodles",
    //imageUrl: "",
  //);
//}


void addToCart(var name, var price){
  print(q.text);
  quantity.add(int.parse(q.text.toString()));
=======
//getItems() async {
//await Firebase.initializeApp();
//FirebaseFirestore.instance.collection("items")
//.getDocuments()
//.then(QuerySnapshot snapshot){
//snapshot.documents.forEach((f) => return PopularFoodTiles(
//  name: f.name,
// imageUrl:
//));
//};
//return PopularFoodTiles(
//name: "Noodles",
//imageUrl: "",
//);
//}

void addToCart(var name, var price) {
  quantity.add(1);
///>>>>>>> main
  items.add(name);
  print(price);
  prices.add(int.parse(price.toString()));
  print(quantity.length);
  print(items.length);
}
