import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/product.dart';
import '../models/cart_model.dart';
import 'cart_page.dart';

// --- 1. CLASS SEARCH DELEGATE (LOGIKA PENCARIAN) ---
class ProductSearch extends SearchDelegate<String> {
  final List<Product> products;

  ProductSearch(this.products);

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () => query = '',
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () => close(context, ''),
    );
  }

  @override
  Widget buildResults(BuildContext context) => _showSearchResults(context);

  @override
  Widget buildSuggestions(BuildContext context) => _showSearchResults(context);

  Widget _showSearchResults(BuildContext context) {
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
                SnackBar(
                  content: Text('${product.name} ditambahkan!'),
                  duration: const Duration(seconds: 1),
                ),
              );
            },
          ),
          onTap: () {
            close(context, product.name);
          },
        );
      },
    );
  }
}

// --- 2. CLASS HALAMAN UTAMA (DENGAN TOMBOL SEARCH) ---
class ProductListPage extends StatelessWidget {
  const ProductListPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy products (Tetap sesuai kode kamu)
    final products = [
      Product(
        id: '1',
        name: 'Laptop Gaming',
        price: 15000000,
        imageUrl: 'https://picsum.photos/seed/laptop/300',
        category: 'Electronics',
      ),
      Product(
        id: '2',
        name: 'Smartphone Pro',
        price: 8000000,
        imageUrl: 'https://picsum.photos/seed/phone/300',
        category: 'Electronics',
      ),
      Product(
        id: '3',
        name: 'Wireless Headphones',
        price: 1500000,
        imageUrl: 'https://picsum.photos/seed/headphone/300',
        category: 'Audio',
      ),
      Product(
        id: '4',
        name: 'Smart Watch',
        price: 3000000,
        imageUrl: 'https://picsum.photos/seed/watch/300',
        category: 'Wearables',
      ),
      Product(
        id: '5',
        name: 'Camera DSLR',
        price: 12000000,
        imageUrl: 'https://picsum.photos/seed/camera/300',
        category: 'Photography',
      ),
      Product(
        id: '6',
        name: 'Tablet Pro',
        price: 7000000,
        imageUrl: 'https://picsum.photos/seed/tablet/300',
        category: 'Electronics',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        actions: [
          // TOMBOL SEARCH BARU
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: ProductSearch(products),
              );
            },
          ),
          // CART BADGE (KODE ASLI KAMU)
          Consumer<CartModel>(
            builder: (context, cart, child) {
              return Stack(
                children: [
                  IconButton(
                    icon: const Icon(Icons.shopping_cart),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CartPage(),
                        ),
                      );
                    },
                  ),
                  if (cart.itemCount > 0)
                    Positioned(
                      right: 8,
                      top: 8,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                        constraints: const BoxConstraints(
                          minWidth: 16,
                          minHeight: 16,
                        ),
                        child: Text(
                          '${cart.itemCount}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                ],
              );
            },
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.7,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Card(
            clipBehavior: Clip.antiAlias,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Image.network(
                    product.imageUrl,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.grey[300],
                        child: const Icon(Icons.image, size: 50),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.name,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Rp ${product.price.toStringAsFixed(0)}',
                        style: TextStyle(
                          color: Colors.green[700],
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 8),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton.icon(
                          onPressed: () {
                            context.read<CartModel>().addItem(product);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                    '${product.name} ditambahkan ke cart!'),
                                duration: const Duration(seconds: 1),
                                behavior: SnackBarBehavior.floating,
                              ),
                            );
                          },
                          icon: const Icon(Icons.add_shopping_cart, size: 16),
                          label:
                              const Text('Add', style: TextStyle(fontSize: 12)),
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}