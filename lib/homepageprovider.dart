import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:untitled4/productmodels.dart';

class Homepageprovider with ChangeNotifier {
  List<Product> _product = [];
  bool _isLoading = true;
  String? _errorMessage;

  List<Product> get product => _product;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Homepageprovider() {
    fetchApi();
  }

  Future<void> fetchApi() async {
    var url = "https://dummyjson.com/products";
    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final Map<String, dynamic> json = jsonDecode(response.body);
        _product = (json['products'] as List)
            .map((data) => Product.fromJson(data))
            .toList();
        _isLoading = false;
      } else {
        _errorMessage = 'Failed to fetch data';
        _isLoading = false;
      }
    } catch (e) {
      _errorMessage = 'Error: $e';
      _isLoading = false;
    }

    notifyListeners();
  }
}
