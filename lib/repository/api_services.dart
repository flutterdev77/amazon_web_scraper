import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiService {
  final String apiKey = '31ce1d92144f03aa5f18e8a2b6efa9d3';

  Future<List<Map<String, dynamic>>> fetchTrendingProduct() async {
    try {
      const trendingProductsUrl = 'https://www.amazon.com/Best-Sellers/zgbs';

      final String url =
          'https://api.scraperapi.com?api_key=$apiKey&url=$trendingProductsUrl';
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        // Parse the response to extract trending products. This will depend on the structure of the Amazon page.
        // For the sake of this example, let's assume the response is a list of products.
        return List<Map<String, dynamic>>.from(json.decode(response.body));
      } else {
        throw Exception('Failed to load trending products');
      }
    } catch (error, _) {
      throw Exception();
    }
  }
}
