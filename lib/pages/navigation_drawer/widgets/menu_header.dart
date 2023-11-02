import 'package:flutter/material.dart';
import 'package:flutterkit/config/palette.dart';

Widget buildMenuHeader({
  required String imageURL,
  required String name,
  required String email,
  VoidCallback? onTap
}){
  return InkWell(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.fromLTRB(0, 60, 0, 20),
      child: Row(
        children: <Widget>[
          CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(imageURL),
          ),
          SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(name,
                style: TextStyle(
                color: Palette.navigationDrawerForeground,
                fontSize: 16
              ),
              ),
              SizedBox(height: 5),
              Text(email,
                style: TextStyle(
                    color: Palette.navigationDrawerForeground,
                    fontSize: 12
                ),
              ),
            ],
          )
        ],
      ),
    ),
  );
}