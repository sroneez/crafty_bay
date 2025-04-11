import 'package:crafty_bay/features/products/ui/screens/create_product_review_screen.dart';
import 'package:flutter/material.dart';

class ProductReviewScreen extends StatefulWidget {
  const ProductReviewScreen({super.key});

  static const String name = '/review-screen';

  @override
  State<ProductReviewScreen> createState() => _ProductReviewScreenState();
}

class _ProductReviewScreenState extends State<ProductReviewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reviews'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 15,
                itemBuilder: (context, index) {
                  return ListTile(
                    contentPadding: EdgeInsets.all(8),
                    leading: Icon(Icons.person),
                    title: Text(
                      'Rabbil Hasan',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    subtitleTextStyle: TextStyle(color: Colors.grey),
                    subtitle: Text(
                        '''If you’re looking for an all-rounder shoe that blends performance and comfort with a clean look, the Pegasus 40 delivers. Not cheap, but worth it.'''),
                  );
                },
              ),
            ),
            Text(
              'Reviews(100)',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 24,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, CreateProductReviewScreen.name);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
