import 'package:flutter/material.dart';

class Product {
  final String? id;
  final String name;
  final String imageAsset;
  final double originalPrice;
  final double rating;
  final int reviews;
  final String description;
  final String category;
  final bool isPinned;

  Product({
    this.id,
    required this.name,
    required this.imageAsset,
    required this.originalPrice,
    this.rating = 0.0,
    this.reviews = 0,
    this.description = "",
    this.category = "All",
    this.isPinned = false,
  });

  // Chuyển đối tượng Product (Course) thành Map để lưu vào SQLite
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'imageAsset': imageAsset,
      'originalPrice': originalPrice,
      'rating': rating,
      'reviews': reviews,
      'description': description,
      'category': category,
      'isPinned': isPinned ? 1 : 0, // SQLite không có kiểu boolean, lưu 1/0
    };
  }

  // Khởi tạo đối tượng Product (Course) từ Map (Dữ liệu từ SQLite)
  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id']?.toString(),
      name: map['name'] ?? '',
      imageAsset: map['imageAsset'] ?? '',
      originalPrice: map['originalPrice']?.toDouble() ?? 0.0,
      rating: map['rating']?.toDouble() ?? 0.0,
      reviews: map['reviews']?.toInt() ?? 0,
      description: map['description'] ?? '',
      category: map['category'] ?? 'All',
      isPinned: map['isPinned'] == 1,
    );
  }
}
