import 'package:flutter/material.dart';
import 'package:flutterkit/config/palette.dart';

Widget buildMenuItem({
  required String menuTitle,
  required IconData icon,
  VoidCallback? onTap
}) {
  return ListTile(
    leading: Icon(icon, color: Palette.navigationDrawerForeground),
    title: Text(menuTitle, style: TextStyle(color: Palette.navigationDrawerForeground)),
    hoverColor: Palette.navigationDrawerHover,
    onTap: onTap,
  );
}