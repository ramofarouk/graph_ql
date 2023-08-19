import 'package:flutter/material.dart';

class HeadPhone {
  final String id;
  final String name;
  final String price;
  final Color color;
  final String wireless;
  final String warranty;
  final String image;

  HeadPhone({
    required this.id,
    required this.name,
    required this.price,
    required this.color,
    required this.wireless,
    required this.image,
    required this.warranty,
  });
  factory HeadPhone.fromJson(Map<String, dynamic> json) {
    List<String> colorsString = [
      'red',
      'blue',
      'green',
      'yellow',
      'purple',
      'orange'
    ];
    List<Color> colorList = [
      Colors.red,
      Colors.blue,
      Colors.green,
      Colors.yellow,
      Colors.purple,
      Colors.orange,
    ];
    Color color = colorList[colorsString.indexOf(json['color'])];
    return HeadPhone(
      id: json["id"],
      image: json['image'],
      name: json["name"],
      price: json["price"],
      color: color,
      wireless: json["wireless"],
      warranty: json["warranty"],
    );
  }
}
