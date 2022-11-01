import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_api/Model/MyModel.dart';

class ApiService {
  final endPointUrl = "newsapi.org";
  final client = http.Client();

  Future<MyModel> getArticle() async {
    final queryParameters = {
      'country': 'us',
      'category': 'technology',
      'apiKey': 'c61d113871d54dc5a37a9486399f0959'
    };

    final uri = Uri.https(endPointUrl, '/v2/top-headlines', queryParameters);

    final response = await client.get(uri);

    Map<String, dynamic> json = jsonDecode(response.body);
    MyModel model = MyModel.fromJson(json);
    // print(model);
    return model;
  }
}
