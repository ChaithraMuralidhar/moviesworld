import 'package:flutter/material.dart';
import 'package:flutterkit/pages/ticketbooking/seat_selection_screen.dart';
import 'package:flutterkit/pages/ticketbooking/components/theatre_block.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controller/calender_controller.dart';
import '../controller/seat_selection_controller.dart';
import 'custom_calender.dart';
import 'dummy_data.dart';

class ListTheatres extends StatefulWidget {
  const ListTheatres({Key? key}) : super(key: key);

  @override
  State<ListTheatres> createState() =>_ListTheatresState();
}

class _ListTheatresState extends State<ListTheatres> {
  final DateFormat format = DateFormat("dd MMM");

  final now = DateTime.now();

  String selectedDate = DateFormat("dd MMM").format(DateTime.now());

  String selectedLanguage = "English";

  String selectedScreen = "3D";
  late CalendarController commonController;

  @override
  void initState() {
    commonController = Get.put(CalendarController());
    Get.put(SeatSelectionController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Get.delete<CalendarController>();
        print(commonController.selectedMovieDate.value);
        return Future.value(true);
      },
      child: Scaffold(
        backgroundColor: const Color(0xFFF5F5FA),
        bottomNavigationBar: BottomAppBar(
          elevation: 0,
          child: Container(
            width: double.maxFinite,
            height: AppBar().preferredSize.height,
            child: Row(
              children: [
                Expanded(
                  flex: 7,
                  child: StatefulBuilder(
                    builder: (_, setState) {
                      final todayDate = format.format(now);
                      final tomorrowDate = format.format(now.add(const Duration(days: 1)));
                      String text = "";

                      if (selectedDate == todayDate) {
                        text = "Today, ";
                      } else if (selectedDate == tomorrowDate) {
                        text = "Tomorrow, ";
                      } else {
                        text = DateFormat("EEE").format(commonController.selectedMovieDate.value) + ", ";
                      }

                      return ListTile(
                        onTap: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (_) => CustomCalendar(),
                              constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.35))
                              .then((value) => setState(() {
                            if (value != null) {
                              selectedDate = format.format(value);
                            }
                          }));
                        },
                        horizontalTitleGap: 0,
                        textColor: Colors.black,
                        leading: const Icon(
                          Icons.calendar_month,
                          color: Colors.black,
                        ),
                        title: Text(
                          "$text$selectedDate",
                          style: const TextStyle(fontSize: 14),
                        ),
                        trailing: const Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.black,
                        ),
                      );
                    },
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: StatefulBuilder(builder: (context, setState) {
                    return ListTile(
                      onTap: () {
                        // showModalBottomSheet(
                        //   context: context,
                        //   isScrollControlled: true,
                        //   builder: (_) => ScreenSelectionBlock(
                        //     onScreenSelect: (screen) {
                        //       CommonController.instance.updateScreen(screen);
                        //       setState(() => selectedScreen = screen);
                        //     },
                        //   ),
                        //   constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.25),
                        // );
                      },
                      horizontalTitleGap: 0,
                      textColor: Colors.black,
                      title: Text(
                        "$selectedLanguage, $selectedScreen",
                      ),
                      trailing: const Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.black,
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
        appBar: AppBar(
          elevation: 0,
          // title: Text(widget.model.title),
          // actions: [
          //   IconButton(
          //     onPressed: () {
          //       showSearch(
          //         context: context,
          //         delegate: TheatreSearchDelegate(widget.model),
          //       );
          //     },
          //     icon: SvgPicture.asset("assets/icons/search.svg"),
          //   ),
          // ],
        ),
        body: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: theatres.length,
          itemBuilder: (_, index) {
            return Container(
              padding: EdgeInsets.only(bottom: index != theatres.length - 1 ? 20 : 0),
              child: TheatreBlock(
                model: theatres[index],
                onTimeTap: () {
                  Get.to(() => SeatSelectionScreen(theatreModel: theatres[index]));
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
