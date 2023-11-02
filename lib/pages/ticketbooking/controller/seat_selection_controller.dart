import 'dart:convert';
import 'dart:math';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../config/constant.dart';

class SeatSelectionController extends GetxController {
  static SeatSelectionController instance = Get.find();
  RxInt timeSelectedIndex = 0.obs;
  static int initialValue = -1;
  RxInt noOfSeats = initialValue.obs;
  RxInt seatType = initialValue.obs;
  RxBool isSeatSelection = false.obs;

  RxList selectedSeats = [].obs;
  RxList seatPrices = [].obs;
  RxDouble seatPrice = 0.0.obs;
  static const String _chars = '1234567890';
  final Random _rnd = Random();

  @override
  void onReady() {
    super.onReady();
    noOfSeats = initialValue.obs;
    seatType = initialValue.obs;
  }

  String getAsset() {
    int val = noOfSeats.value;
    if (val <= 2) {
      return "vespa.svg";
    } else if (val > 2 && val <= 4) {
      return "car.svg";
    } else if (val > 4 && val <= 8) {
      return "van.svg";
    }
    return "bus.svg";
  }

  updateNoOfSeats(int value) {
    noOfSeats = value.obs;
    update();
  }

  String getRandomString(int length) =>
      String.fromCharCodes(Iterable.generate(length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));








  @override
  void dispose() {

    super.dispose();
  }
}