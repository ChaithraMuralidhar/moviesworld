import 'package:flutter/material.dart';

class Header extends StatelessWidget {

  final String title;

  Header(this.title);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
        child: Text(this.title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
  }
}
