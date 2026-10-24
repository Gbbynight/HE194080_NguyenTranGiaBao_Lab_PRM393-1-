import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../models/Courseviewmodel1.dart';
import 'CourseCardWidget.dart';
import 'CourseDetailWidget.dart';

class ProductListWidget extends ConsumerWidget {
  const ProductListWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Theo dõi trạng thái của danh sách sản phẩm từ ViewModel
    final productsAsyncValue = ref.watch(productViewModel1Provider);

    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              onChanged: (value) {
                // Gọi hàm tìm kiếm khi người dùng gõ phím
                ref.read(productViewModel1Provider.notifier).filterBySearch(value);
              },
              decoration: InputDecoration(
                hintText: 'Search courses...',
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey.withValues(alpha: 0.1),
                contentPadding: const EdgeInsets.symmetric(vertical: 0),
              ),
            ),
          ),
          Expanded(
            child: productsAsyncValue.when(
              data: (products) {
                if (products.isEmpty) {
                  return Center(
                    child: Text(
                      'No courses found',
                      style: TextStyle(color: Colors.grey[600], fontSize: 16),
                    ),
                  );
                }
                return ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductDetailWidget(product: products[index]),
                          ),
                        );
                      },
                      child: ProductCardWidget(product: products[index]),
                    );
                  },
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, stack) => Center(
                child: Text('Error: $error', style: const TextStyle(color: Colors.red)),
              ),
            ),
          ),
      ]),
    );
  }
}
