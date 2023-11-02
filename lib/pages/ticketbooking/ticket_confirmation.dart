
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../config/palette.dart';
import '../navigation_drawer/view/drawer.dart';

class TicketConfirmation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: NavigationDrawer(),
      appBar: AppBar(
          title: Text("ticket confirmation"),
          backgroundColor: Palette.navigationBar
      ),
      body: Container(
        height: MediaQuery
            .of(context)
            .size
            .height,
        width: MediaQuery
            .of(context)
            .size
            .width,
        child: Stack(
          children: [
            SimpleDialog(
              contentPadding: EdgeInsets.all(20),
              title:const Text('Ticket Confirmed'),
              backgroundColor: Colors.grey[200],
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                      Radius.circular(16.0))),

            ),
          ],

        ),


      ),
    );
  }
}