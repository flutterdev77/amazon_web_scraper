import 'package:amazon_web_scraper/provider/api_service_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductScreen extends ConsumerStatefulWidget {
  const ProductScreen({super.key});

  @override
  ConsumerState<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends ConsumerState<ProductScreen> {
  List<Map<String, dynamic>>? products;
  bool isSearching = false;

  @override
  Widget build(BuildContext context) {
    final apiService = ref.watch(apiServiceProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Amazon Trending Product'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () async {
                final result =
                    await ref.read(apiServiceProvider).fetchTrendingProduct();
                if (result.isNotEmpty) {
                  setState(() {
                    isSearching = true;
                    products = result;
                    isSearching = false;
                  });
                }
              },
              child: Text('Fetch Trending Product'),
            ),
            if (isSearching) const CircularProgressIndicator(),
            if (products != null) ...[
              Expanded(
                child: ListView.builder(
                  itemCount: products!.length,
                  itemBuilder: (context, index) {
                    final product = products![index];
                    return ListTile(
                      title: Text(product['title']),
                      subtitle: Text(product['price']),
                      // Add more fields as needed
                    );
                  },
                ),
              ),
            ]
          ],
        ),
      ),
    );
  }
}
