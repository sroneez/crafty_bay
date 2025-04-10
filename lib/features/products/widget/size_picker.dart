import 'package:crafty_bay/app/app_colors.dart';
import 'package:flutter/material.dart';

class SizePicker extends StatefulWidget {
  const SizePicker({super.key, required this.size, required this.onChange});

  final List<String> size;
  final Function(String) onChange;

  @override
  State<SizePicker> createState() => _SizePickerState();
}

class _SizePickerState extends State<SizePicker> {
  String? selectedSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Size',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: 8,
        ),
        SizedBox(
          height: 40,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: widget.size.length,
            itemBuilder: (context, index) {
              String size = widget.size[index];
              return GestureDetector(
                onTap: () {
                  selectedSize = size;
                  setState(() {});
                },
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      color:
                          selectedSize == size ? AppColors.themeColor : null),
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  margin: EdgeInsets.only(right: 4),
                  alignment: Alignment.center,
                  child: Text(
                    size,
                    style: TextStyle(
                        color: selectedSize == size ? Colors.white : null),
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
