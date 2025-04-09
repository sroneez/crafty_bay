import 'package:crafty_bay/app/app_colors.dart';
import 'package:flutter/material.dart';

class IncrementDecrementCounterWidget extends StatefulWidget {
  const IncrementDecrementCounterWidget({super.key, required this.onChange});

  final Function(int) onChange;

  @override
  State<IncrementDecrementCounterWidget> createState() =>
      _IncrementDecrementCounterWidgetState();
}

class _IncrementDecrementCounterWidgetState
    extends State<IncrementDecrementCounterWidget> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 12,
      children: [
        GestureDetector(
          onTap: () {
            if(count>1) {
              count--;
              widget.onChange(count);
            }
            setState(() {});
          },
          child: Container(
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: AppColors.themeColor,
              borderRadius: BorderRadius.circular(4),
            ),
            child:  Icon(Icons.remove),

          ),
        ),
        Text(
          '$count',
          style: TextStyle(fontSize: 22),
        ),
        GestureDetector(
          onTap: () {
            if(count<20) {
              count++;
              widget.onChange(count);

            }
            setState(() {});
          },
          child: Container(
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: AppColors.themeColor,
              borderRadius: BorderRadius.circular(4),
            ),
            child:  Icon(Icons.add),

          ),
        ),
      ],
    );
  }
}
