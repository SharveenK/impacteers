import 'package:http/http.dart' as http;

const String baseUrl = 'https://reqres.in/';

class ApiProvider {
  Future<String> get(String url) async {
    http.Response response = await http.get(Uri.parse(baseUrl + url));
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw UnimplementedError();
    }
  }
}
