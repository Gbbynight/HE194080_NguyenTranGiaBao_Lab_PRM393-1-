import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../ui/widgets/CourseWidget.dart';

part 'Course_reposistories.g.dart';

@riverpod
ProductReposistories productReposistories(Ref ref) {
  return ProductReposistories();
}

class ProductReposistories {
  List<Product> products = [];

  ProductReposistories() {
    products = [
      Product(
        id: '1',
        name: 'Flutter Development',
        imageAsset: 'assets/images/iphone15.jpg',
        originalPrice: 120,
        rating: 4.8,
        reviews: 120,
        description: 'Build beautiful cross platform apps',
        category: 'Mobile Development',
        isPinned: true,
      ),
      Product(
        id: '2',
        name: 'AI Fundamentals',
        imageAsset: 'assets/images/samsung.jpg',
        originalPrice: 150,
        rating: 4.6,
        reviews: 98,
        description: 'Introduction to artificial inteiligence',
        category: 'Artificial Intelligence',
        isPinned: false,
      ),
      Product(
        id: '3',
        name: 'Advanced Web Development',
        imageAsset: 'assets/images/macbook.jpg',
        originalPrice: 100,
        rating: 4.9,
        reviews: 210,
        description: 'Learn modern web technologies like React and Node',
        category: 'Web Development',
        isPinned: true,
      ),
      Product(
        id: '4',
        name: 'UI/UX Masterclass',
        imageAsset: 'assets/images/samsung.jpg',
        originalPrice: 90,
        rating: 4.4,
        reviews: 45,
        description: 'Design beautiful interfaces',
        category: 'UI/UX Design',
        isPinned: false,
      ),
    ];
  }

  // Lấy toàn bộ danh sách sản phẩm
  List<Product> getProducts() {
    return products;
  }

  // Lấy chi tiết 1 sản phẩm theo tên
  Product? getProductByName(String name) {
    try {
      return products.firstWhere((p) => p.name == name);
    } catch (e) {
      return null;
    }
  }

  // Thêm sản phẩm mới
  void addProduct(Product product) {
    products.add(product);
  }
}
