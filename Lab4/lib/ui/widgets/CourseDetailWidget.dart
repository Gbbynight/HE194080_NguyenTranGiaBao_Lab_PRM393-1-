import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'CourseWidget.dart';

class ProductDetailWidget extends ConsumerWidget {
  final Product? product;

  const ProductDetailWidget({super.key, this.product});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Nếu không truyền data vào, mặc định hiển thị iPhone 15 theo thiết kế
    final displayProduct = product ?? Product(
      id: '1',
      name: 'Flutter Development',
      imageAsset: 'assets/images/iphone15.jpg',
      originalPrice: 1099,
      rating: 4.8,
      reviews: 120,
      description: 'Build beautiful cross-platform app',
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Product Detail', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Quay lại màn hình trước đó
            Navigator.pop(context);
          },
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Stack(
                children: [
                  Container(
                    width: 250,
                    height: 250,
                    decoration: BoxDecoration(
                      color: Colors.blue.withOpacity(0.05),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(24),
                      child: Image.asset(displayProduct.imageAsset, fit: BoxFit.cover),
                    ),
                  ),
                  if (displayProduct.isPinned)
                    Positioned(
                      top: 16,
                      left: 16,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.push_pin, color: Colors.white, size: 24),
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            Text(
              displayProduct.name,
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            // Description (Ngay trên giá tiền)
            Text(
              displayProduct.description,
              style: const TextStyle(fontSize: 16, height: 1.5, color: Colors.black87),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                // Giá tiền
                Text(
                  '\$${displayProduct.originalPrice.toInt()}',
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
                const Spacer(),
                // Sao, Rating và Reviews (Ngay cạnh giá tiền)
                const Icon(Icons.star, color: Colors.orange, size: 24),
                const SizedBox(width: 8),
                Text(
                  '${displayProduct.rating}',
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                const SizedBox(width: 8),
                Text(
                  '(${displayProduct.reviews} reviews)',
                  style: const TextStyle(color: Colors.grey, fontSize: 16),
                ),
              ],
            ),
            const SizedBox(height: 40),
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton.icon(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('${displayProduct.name} added to cart!'),
                      duration: const Duration(seconds: 1),
                    ),
                  );
                },
                icon: const Icon(Icons.shopping_cart),
                label: const Text('Add to Cart'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 2,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
