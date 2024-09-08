import 'package:baseapp/common/date_picker/date_picker_list_widget.dart';
import 'package:baseapp/common/date_picker/date_picker_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nepali_utils/nepali_utils.dart';

class NepaliDatePicker extends StatefulWidget {
  final NepaliDateTime currentDate;
  final ValueChanged<NepaliDateTime> onChanged;
  final NepaliDateTime? maxDate;
  final NepaliDateTime? minDate;

  const NepaliDatePicker({
    super.key,
    required this.currentDate,
    required this.onChanged,
    this.maxDate,
    this.minDate,
  });

  @override
  State<NepaliDatePicker> createState() => _NepaliDatePickerState();
}

class _NepaliDatePickerState extends State<NepaliDatePicker> {
  int currentYear = 2078;
  String currentMonth = DatePickerUtils.nepaliMonths.first;
  int currentDay = 1;

  late FixedExtentScrollController _yearController;

  late FixedExtentScrollController _monthController;

  late FixedExtentScrollController _dayController;

  List<String> _days = [];

  List<String> _months = [];

  _updateDays(int year, String month) {
    setState(() {
      _days = DatePickerUtils.nepaliDaysBetweenDates(
        currentYear: currentYear,
        currentMonth: currentMonth,
        maxDate: widget.maxDate,
        minDate: widget.minDate,
      );
      final index = _days.indexOf(currentDay.toString());
      if (index == -1) {
        currentDay = 1;
      }
      _dayController.jumpToItem(index == -1 ? 0 : index);
    });
  }

  _updateMonths(int year) {
    setState(() {
      _months = DatePickerUtils.nepaliMonthBetweenDates(
        currentYear: year,
        maxDate: widget.maxDate,
        minDate: widget.minDate,
      );
      final index = _months.indexWhere((e) => e == currentMonth);

      if (index == -1) {
        currentMonth = _months.first;
      }
      _monthController.jumpToItem(index == -1 ? 0 : index);
    });
  }

  onChanged(int year, String month, int day) {
    final int m = DatePickerUtils.nepaliMonths
        .indexWhere((e) => e.toLowerCase() == month.toLowerCase());
    widget.onChanged(NepaliDateTime(year, m + 1, day));
  }

  @override
  void initState() {
    super.initState();

    currentYear = widget.currentDate.year;
    currentMonth = DatePickerUtils.nepaliMonths[widget.currentDate.month - 1];
    currentDay = widget.currentDate.day;

    final int yearIndex = DatePickerUtils.nepaliYearsBetweenDates(
            maxDate: widget.maxDate, minDate: widget.minDate)
        .indexOf(currentYear.toString());
    _yearController = FixedExtentScrollController(
        initialItem: yearIndex == -1 ? 0 : yearIndex);

    _months = DatePickerUtils.nepaliMonthBetweenDates(
      currentYear: currentYear,
      maxDate: widget.maxDate,
      minDate: widget.minDate,
    );
    final int monthIndex = _months.indexOf(currentMonth);
    _monthController = FixedExtentScrollController(
        initialItem: monthIndex == -1 ? 0 : monthIndex);

    _days = DatePickerUtils.nepaliDaysBetweenDates(
      currentYear: currentYear,
      currentMonth: currentMonth,
      maxDate: widget.maxDate,
      minDate: widget.minDate,
    );

    final int dayIndex = _days.indexOf(currentDay.toString());
    _dayController =
        FixedExtentScrollController(initialItem: dayIndex == -1 ? 0 : dayIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: DatePickerListWidget(
            items: _months,
            currentValue: currentMonth,
            controller: _monthController,
            onChanged: (val) {
              currentMonth = val;
              _updateDays(currentYear, val);
              onChanged(currentYear, val, currentDay);
            },
          ),
        ),
        Expanded(
          child: DatePickerListWidget(
            items: _days,
            currentValue: currentDay.toString(),
            controller: _dayController,
            onChanged: (val) {
              currentDay = int.parse(val);
              onChanged(currentYear, currentMonth, currentDay);
            },
          ),
        ),
        Expanded(
          child: DatePickerListWidget(
            items: DatePickerUtils.nepaliYearsBetweenDates(
                maxDate: widget.maxDate, minDate: widget.minDate),
            currentValue: currentYear.toString(),
            controller: _yearController,
            onChanged: (val) {
              currentYear = int.parse(val);
              _updateMonths(currentYear);
              _updateDays(currentYear, currentMonth);
              onChanged(currentYear, currentMonth, currentDay);
            },
          ),
        ),
      ],
    );
  }
}
