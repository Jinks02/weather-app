import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  NetworkHelper(this.apiUrl);
  final String apiUrl;

  Future getApiData() async {
    http.Response response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      String data = response.body;

      return jsonDecode(data);
    } 
    
    else {
      print(response.statusCode);
    }
  }
}
