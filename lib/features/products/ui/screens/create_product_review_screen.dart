import 'package:crafty_bay/app/app_colors.dart';
import 'package:flutter/material.dart';

class CreateProductReviewScreen extends StatefulWidget {
  const CreateProductReviewScreen({super.key});

  static const String name = '/create-product-review';

  @override
  State<CreateProductReviewScreen> createState() =>
      _CreateProductReviewScreenState();
}

class _CreateProductReviewScreenState extends State<CreateProductReviewScreen> {
  final TextEditingController _firstNameTEController = TextEditingController();
  final TextEditingController _lastNameTEController = TextEditingController();
  final TextEditingController _reviewTEController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Review'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextFormField(
              controller: _firstNameTEController,
              style: TextStyle(fontSize: 14),
              decoration: InputDecoration(
                hintText: 'First Name',
                hintStyle: TextStyle(color: Colors.grey),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: BorderSide(color: AppColors.themeColor)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: BorderSide(color: AppColors.themeColor)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: BorderSide(color: AppColors.themeColor)),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            TextFormField(
              controller: _lastNameTEController,
              style: TextStyle(fontSize: 14),
              decoration: InputDecoration(
                hintText: 'last Name',
                hintStyle: TextStyle(color: Colors.grey),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: BorderSide(color: AppColors.themeColor)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: BorderSide(color: AppColors.themeColor)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: BorderSide(color: AppColors.themeColor)),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            TextFormField(
              controller: _reviewTEController,
              style: TextStyle(fontSize: 14),
              maxLines: 8,
              textAlign: TextAlign.start,
              decoration: InputDecoration(
                hintText: 'Write Review',
                contentPadding: EdgeInsets.all(16),
                hintStyle: TextStyle(color: Colors.grey),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: BorderSide(color: AppColors.themeColor)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: BorderSide(color: AppColors.themeColor)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: BorderSide(color: AppColors.themeColor)),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _firstNameTEController.dispose();
    _lastNameTEController.dispose();
    _reviewTEController.dispose();
  }
}
