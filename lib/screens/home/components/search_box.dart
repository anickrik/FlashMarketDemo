import 'package:flutter/material.dart';

Widget searchBox(){
  return const Padding(
    padding: EdgeInsets.symmetric(horizontal: 16),
    child: TextField(
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.search),
            hintText: "Search a Product",
          ),
        ),
  );
}