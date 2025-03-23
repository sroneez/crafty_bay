import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  SectionHeader({
    super.key,
    required this.title,
    required this.onTap,
  });

  String title;
  VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w500
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Text('See all'),
        )
      ],
    );
  }
}