import 'package:amazon_web_scraper/repository/api_services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final apiServiceProvider = Provider.autoDispose<ApiService>(
  (ref) => ApiService(),
);
