import 'package:newsy/app/data/api/news_model.dart';

import '../../constants/api_constants.dart';
import '../http/http_services.dart';

class CountryNewsServices {
  static var httpClient = HttpServices.httpClient;

  static Future<AllNews?> fetchCountryNews(String? countryCode) async {
    AllNews? allNews;

    if (countryCode == null) {
      return allNews;
    }

    final queryParams = {
      "country": countryCode,
      "apiKey": ApiConstants.apiKey,
    };

    final uri = Uri.parse("https://newsapi.org/v2/top-headlines")
        .replace(queryParameters: queryParams);

    var response = await httpClient.get(uri);

    if (response.statusCode == 200) {
      var jsonString = response.body;
      allNews = allNewsFromJson(jsonString);
    } else {
      allNews = null;
    }

    return allNews;
  }
}
