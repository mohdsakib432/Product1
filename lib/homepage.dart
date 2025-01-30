import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled4/homepageprovider.dart';
import 'package:untitled4/productmodels.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product"),
      ),
      body: Consumer<Homepageprovider>(
        builder: (context, homepageprovider, child) {
          if (homepageprovider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (homepageprovider.errorMessage != null) {
            return Center(child: Text(homepageprovider.errorMessage!));
          }

          final products = homepageprovider.product;

          if (products.isEmpty) {
            return const Center(child: Text("No products available"));
          }

          return ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              final Product product = products[index];
              return ListTile(
                leading: Image.network(
                  product.thumbnail,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
                title: Text(product.title),
                subtitle: Text(product.description),
                trailing: Text('\$${product.price.toStringAsFixed(2)}'),
                onTap: () {
                  // Optionally, handle item tap for more actions
                },
              );
            },
          );
        },
      ),
    );
  }
}
