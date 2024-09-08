import 'package:baseapp/app/theme.dart';
import 'package:flutter/cupertino.dart';

class DatePickerListWidget extends StatelessWidget {
  final List<String> items;
  final ValueChanged<String> onChanged;
  final String currentValue;
  final FixedExtentScrollController controller;

  const DatePickerListWidget({
    super.key,
    required this.items,
    required this.currentValue,
    required this.onChanged,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: CupertinoPicker.builder(
        backgroundColor: CustomTheme.backgroundColor,
        itemExtent: 45,
        childCount: items.length,
        selectionOverlay: Container(
          height: 45,
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                color: CustomTheme.lightGray.withOpacity(0.4),
                width: 1.7,
              ),
              bottom: BorderSide(
                color: CustomTheme.lightGray.withOpacity(0.4),
                width: 1.7,
              ),
            ),
          ),
        ),
        scrollController: controller,
        diameterRatio: 1.1,
        squeeze: 1,
        itemBuilder: (context, index) {
          return Container(
            height: 45,
            alignment: Alignment.center,
            child: Text(
              items[index],
              style: CustomTheme.titleLarge.copyWith(
                fontWeight: FontWeight.w400,
              ),
            ),
          );
        },
        onSelectedItemChanged: (value) {
          onChanged(items[value]);
        },
      ),
    );
  }
}
