import 'package:baseapp/app/theme.dart';
import 'package:baseapp/common/date_picker/english_date_picker.dart';
import 'package:baseapp/common/date_picker/nepali_date_picker.dart';
import 'package:baseapp/common/utils/size_utils.dart';
import 'package:baseapp/common/widgets/bottom_sheet/bottom_sheet_wrapper.dart';
import 'package:baseapp/common/widgets/navigation/navigation.dart';
import 'package:flutter/material.dart';
import 'package:nepali_utils/nepali_utils.dart';
import 'date_picker_model.dart';

showDatePickerBottomSheet({
  required BuildContext context,
  required ValueChanged<DatePicker> onChanged,
  DateTime? maxDate,
  DateTime? minDate,
  required DateTime currentDate,
  final String? title,
}) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(36),
        topRight: Radius.circular(36),
      ),
    ),
    builder: (context) {
      return DatePickerBottomSheet(
        onChanged: onChanged,
        maxDate: maxDate,
        minDate: minDate,
        currentDate: currentDate,
        title: title,
      );
    },
  );
}

class DatePickerBottomSheet extends StatefulWidget {
  final ValueChanged<DatePicker> onChanged;
  final DateTime? maxDate;
  final DateTime? minDate;
  final DateTime currentDate;
  final String? title;

  const DatePickerBottomSheet({
    super.key,
    required this.onChanged,
    this.maxDate,
    this.minDate,
    required this.currentDate,
    this.title,
  });

  @override
  State<DatePickerBottomSheet> createState() => _DatePickerBottomSheetState();
}

class _DatePickerBottomSheetState extends State<DatePickerBottomSheet> {
  DateType currentMode = DateType.bs;

  ValueNotifier<DateTime> currentDate = ValueNotifier(DateTime.now());

  _buildSelectableButton({
    required Function()? onPressed,
    required String title,
    required bool isSelected,
  }) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8.hp, vertical: 4.hp),
        margin: EdgeInsets.symmetric(horizontal: 4.hp),
        child: Text(
          title,
          style: CustomTheme.titleLarge.copyWith(
            color: isSelected ? CustomTheme.primaryColor : (CustomTheme.gray),
            fontWeight: isSelected ? FontWeight.bold : FontWeight.w400,
          ),
        ),
      ),
    );
  }

  _buildButton({
    required Function()? onPressed,
    required String title,
  }) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        child: Text(
          title,
          style: CustomTheme.titleLarge.copyWith(
            color: CustomTheme.primaryColor,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    currentDate.value = widget.currentDate;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BottomSheetWrapper(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.title ?? "Select DOB",
                style: CustomTheme.titleLarge.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              Row(
                children: [
                  _buildSelectableButton(
                    onPressed: () {
                      setState(() {
                        currentMode = DateType.bs;
                      });
                    },
                    title: "BS",
                    isSelected: currentMode == DateType.bs,
                  ),
                  _buildSelectableButton(
                    onPressed: () {
                      setState(() {
                        currentMode = DateType.ad;
                      });
                    },
                    title: "AD",
                    isSelected: currentMode == DateType.ad,
                  ),
                ],
              )
            ],
          ),
          const SizedBox(height: 20),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            child: currentMode == DateType.ad
                ? EnglishDatePicker(
                    currentDate: currentDate.value,
                    onChanged: (date) {
                      currentDate.value = date;
                    },
                    maxDate: widget.maxDate,
                    minDate: widget.minDate,
                  )
                : NepaliDatePicker(
                    currentDate: currentDate.value.toNepaliDateTime(),
                    onChanged: (val) {
                      currentDate.value = val.toDateTime();
                    },
                    maxDate: widget.maxDate?.toNepaliDateTime(),
                    minDate: widget.minDate?.toNepaliDateTime(),
                  ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              _buildButton(
                onPressed: () {
                  NavigationService.pop();
                },
                title: "Cancel",
              ),
              _buildButton(
                onPressed: () {
                  widget.onChanged(DatePicker(
                      choosenType: currentMode,
                      dateInAD: currentDate.value,
                      dateInBS: currentDate.value.toNepaliDateTime()));
                  NavigationService.pop();
                },
                title: 'Save',
              ),
            ],
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
