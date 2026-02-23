import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/product.dart';
import '../models/cart_model.dart';

class ProductSearch extends SearchDelegate<String> {
  final List<Product> products;

  ProductSearch(this.products);

  @override
  List<Widget>? buildActions(BuildContext context) {
    // Tombol untuk menghapus teks pencarian
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // Tombol kembali
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return _showSearchResults();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return _showSearchResults();
  }

  Widget _showSearchResults() {
    final suggestions = products.where((p) {
      return p.name.toLowerCase().contains(query.toLowerCase());
    }).toList();

    if (suggestions.isEmpty) {
      return const Center(child: Text('Produk tidak ditemukan'));
    }

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final product = suggestions[index];
        return ListTile(
          leading: Image.network(product.imageUrl, width: 50, fit: BoxFit.cover),
          title: Text(product.name),
          subtitle: Text('Rp ${product.price.toStringAsFixed(0)}'),
          trailing: IconButton(
            icon: const Icon(Icons.add_shopping_cart),
            onPressed: () {
              context.read<CartModel>().addItem(product);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('${product.name} ditambahkan!'), duration: const Duration(seconds: 1)),
              );
            },
          ),
          onTap: () {
            // Logika saat item diklik (bisa ke detail page jika ada)
            close(context, product.name);
          },
        );
      },
    );
  }
}