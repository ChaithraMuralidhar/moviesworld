import 'package:flutter/material.dart';
import 'package:flutterkit/config/palette.dart';

Widget buildSearchField() {

  return TextField(
    style: TextStyle(color: Palette.navigationDrawerForeground),
    decoration: InputDecoration(
      contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      hintText: 'Search',
      hintStyle: TextStyle(color: Palette.navigationDrawerForeground),
      prefixIcon: Icon(Icons.search, color: Palette.navigationDrawerForeground),
      filled: true,
      fillColor: Palette.navigationSearchFillColor,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide(color: Palette.navigationDrawerForeground.withOpacity(0.7)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide(color: Palette.navigationDrawerForeground.withOpacity(0.7)),
      ),
    ),
  );
}
