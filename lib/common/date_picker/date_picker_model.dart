import 'package:nepali_utils/nepali_utils.dart';

enum DateType { ad, bs }

class DatePicker {
  DateType choosenType;
  DateTime dateInAD;
  NepaliDateTime dateInBS;

  DatePicker({
    required this.choosenType,
    required this.dateInAD,
    required this.dateInBS,
  });
}
