import 'package:newsy/app/data/api/news_model.dart';
import 'package:newsy/common/constants/api_constants.dart';
import 'package:newsy/common/services/http/http_services.dart';

class AllNewsServices {
  static var httpClient = HttpServices.httpClient;

  static Future<AllNews?> fetchAllNews(String? keyword) async {
    final queryParams = {
      "q": keyword ?? "apple",
      "from": "2023-02-21",
      "to": "2023-02-21",
      "apiKey": ApiConstants.apiKey,
    };

    final uri = Uri.parse("https://newsapi.org/v2/everything")
        .replace(queryParameters: queryParams);

    var response = await httpClient.get(uri);

    AllNews? allNews;

    if (response.statusCode == 200) {
      var jsonString = response.body;
      allNews = allNewsFromJson(jsonString);
    } else {
      allNews = null;
    }

    return allNews;
  }
}
