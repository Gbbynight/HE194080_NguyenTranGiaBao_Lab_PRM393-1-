import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../ui/widgets/CourseWidget.dart';
import '../reporsistories/Course_reposistories.dart';

part 'Courseviewmodel1.g.dart';

@riverpod
class ProductViewModel1 extends _$ProductViewModel1 {
  @override
  FutureOr<List<Product>> build() async {
    // Gọi repository để lấy toàn bộ sản phẩm
    return ref.read(productReposistoriesProvider).getProducts();
  }

  // Tìm kiếm theo tên
  Future<void> filterBySearch(String query) async {
    if (query.isEmpty) {
      ref.invalidateSelf();
    } else {
      state = const AsyncValue.loading();
      await Future.delayed(const Duration(milliseconds: 300));
      
      final allProducts = ref.read(productReposistoriesProvider).getProducts();
      final filteredList = allProducts
          .where((p) => p.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
          
      state = AsyncValue.data(filteredList);
    }
  }

  // Tìm kiếm theo Category
  Future<void> filterByCategory(String category) async {
    state = const AsyncValue.loading();
    await Future.delayed(const Duration(milliseconds: 300));
    
    final allProducts = ref.read(productReposistoriesProvider).getProducts();
    List<Product> filteredList;
    
    if (category == 'All Courses') {
      filteredList = allProducts;
    } else if (category == 'Popular Courses') {
      filteredList = allProducts.where((p) => p.rating >= 4.5).toList();
    } else {
      filteredList = allProducts.where((p) => p.category == category).toList();
    }
        
    state = AsyncValue.data(filteredList);
  }
}
