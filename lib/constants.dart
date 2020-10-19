import 'package:flutter/material.dart';

const kSendButtonTextStyle = TextStyle(
  color: Colors.lightBlueAccent,
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);

const kMessageTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintText: 'Type your message here...',
  border: InputBorder.none,
);

const kMessageContainerDecoration = BoxDecoration(
  border: Border(
    top: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
  ),
);

const grocery_data= [
  {
    "name":"Fruits",
    "image":"fruits.png"

  },{
    "name":"Vegetables", "image": "vegetables.png"},
  {"name": "Dairy Products", "image": "dairy.png"},
  {"name": "Mart Products", "image": "supermart.png"},
  {"name": "Grains and Pulses", "image": "ricewheat.png"},
];
