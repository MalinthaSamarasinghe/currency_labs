class ApiEndpoints {
  /// Test Server
  static const baseURL = 'https://api.exchangeratesapi.io/v1';
  static const apiKEY = 'your_api_key_here';
  // static const baseImageUrl = '';

  /// Staging Server
  // static const baseUrl = '';
  // static const apiKEY = '';
  // static const baseImageUrl = '';

  /// Live Server
  // static const baseUrl = '';
  // static const apiKEY = '';
  // static const baseImageUrl = '';

  /// API Endpoints
  /// Currency Module
  static String latestCurrency = "$baseURL/latest?access_key=$apiKEY";
}
