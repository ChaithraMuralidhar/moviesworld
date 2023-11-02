import 'package:flutter/material.dart';
import 'package:flutterkit/pages/ticketbooking/ticket_confirmation.dart';
import 'package:get/get.dart';

import 'components/dummy_data.dart';
import 'components/no_of_seats.dart';
import 'components/seat_layout.dart';
import 'components/seat_type.dart';
import 'components/theatre_block.dart';
import 'controller/seat_selection_controller.dart';
import 'model/theatre_model.dart';

class SeatSelectionScreen extends StatefulWidget {
  final TheatreModel theatreModel;
  // final MovieModel movieModel;
  const SeatSelectionScreen({
    Key? key,
    required this.theatreModel,
    // required this.movieModel,
  }) : super(key: key);

  @override
  State<SeatSelectionScreen> createState() => _SeatSelectionScreenState();
}

class _SeatSelectionScreenState extends State<SeatSelectionScreen> {
  noOfSeatSelection() {
    return Expanded(
      child: Container(
        color: Colors.white,
        height: double.maxFinite,
        width: double.maxFinite,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 15),
                child: Text(
                  "How Many Seats?",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),

              NoOfSeats(onTap: SeatSelectionController.instance.noOfSeats),
              const SizedBox(
                height: 10,
              ),
              SeatType(
                onTap: SeatSelectionController.instance.seatType,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget bottomBar({required Function(bool) toggle}) {
    return BottomAppBar(
      child: SizedBox(
        height: AppBar().preferredSize.height,
        child: ElevatedButton(
          onPressed: () {
            //print(SeatSelectionController.instance.isSeatSelection.value);

            if (SeatSelectionController.instance.isSeatSelection.value) {
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>TicketConfirmation()));
            } else {

              toggle(true);
            }
          },
          style: ElevatedButton.styleFrom(
            elevation: 0,
            // primary: MyTheme.splash,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.zero,
            ),
          ),
          child: Obx(
                () => Center(
              child: Text(
                SeatSelectionController.instance.isSeatSelection.value
                    ? "Pay ${SeatSelectionController.instance.seatPrice.value}"
                    : "Select Seats",
                style: const TextStyle(fontSize: 18),
              ),
            ),
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget myAppBar({required Function(bool) toggle}) {
    return AppBar(
      elevation: 0,
      // title: Text(widget.movieModel.title),
      actions: [
        TextButton(
          onPressed: () {
            toggle(false);
            SeatSelectionController.instance.selectedSeats = [].obs;
            SeatSelectionController.instance.seatPrice = 0.0.obs;
            SeatSelectionController.instance.seatPrices = [].obs;
          },
          child: Obx(
                () => Text(
              "${SeatSelectionController.instance.noOfSeats < 0 ? 0 : SeatSelectionController.instance.noOfSeats} Seats",
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottomBar(toggle: SeatSelectionController.instance.isSeatSelection),
      backgroundColor: const Color(0xFFF5F5FA),
      appBar: myAppBar(toggle: SeatSelectionController.instance.isSeatSelection),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TheatreBlock(
            model: widget.theatreModel,
            onTimeTap: SeatSelectionController.instance.timeSelectedIndex,
            isBooking: true,
          ),
          const SizedBox(
            height: 15,
          ),
          Obx(() => SeatSelectionController.instance.isSeatSelection.value
              ? SeatLayout(model: seatLayout)
              : noOfSeatSelection()),
        ],
      ),
    );
  }
}