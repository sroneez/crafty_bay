import 'package:crafty_bay/app/app_colors.dart';
import 'package:flutter/material.dart';

class ColorPicker extends StatefulWidget {
  const ColorPicker({super.key, required this.color, required this.onChange});

  final List<String> color;
  final Function(String) onChange;

  @override
  State<ColorPicker> createState() => _ColorPickerState();
}

class _ColorPickerState extends State<ColorPicker> {
  String? selectedColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Color',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: 8,
        ),
        SizedBox(
          height: 40,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: widget.color.length,
            itemBuilder: (context, index) {
              String color = widget.color[index];
              return GestureDetector(
                onTap: () {
                  selectedColor = color;
                  setState(() {});
                },
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      color:
                          selectedColor == color ? AppColors.themeColor : null),
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  margin: EdgeInsets.only(right: 4),
                  alignment: Alignment.center,
                  child: Text(
                    color,
                    style: TextStyle(
                        color: selectedColor == color ? Colors.white : null),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
