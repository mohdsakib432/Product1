import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Product Model
class Product {
  final int id;
  final String title;
  final String description;
  final double price;
  final String thumbnail;
  final String category;
  final double rating;
  final List<Map<String, dynamic>> reviews;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.thumbnail,
    required this.category,
    required this.rating,
    required this.reviews,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      price: json['price'].toDouble(),
      thumbnail: json['thumbnail'],
      category: json['category'],
      rating: json['rating'].toDouble(),
      reviews: List<Map<String, dynamic>>.from(json['reviews']),
    );
  }
}