import 'package:flutter/material.dart';

class Description extends StatelessWidget {

  final String body;

  Description(this.body);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(15, 5, 10, 2),
        child: Text(" * "+this.body,
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.normal

          ),
        ),
      ),
    );
  }
}
