import 'package:flutter/material.dart';

var currentUser = " ";
var items = new List();
var quantity = new List();
var prices = new List();
var uid;
int total = calculateTotal();
int calculateTotal(){
  int total = 0;
  for (var i = 0; i < items.length; i++){
    total += int.parse(quantity[i]) * int.parse(prices[i]);
  }
  return total;
}

var orders = 1;