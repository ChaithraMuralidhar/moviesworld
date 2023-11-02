import 'package:flutter/material.dart';

class SubHeader extends StatelessWidget {

  final String title;

  SubHeader(this.title);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(this.title,
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
  }
}
