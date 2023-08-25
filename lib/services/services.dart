import 'dart:convert';
import 'package:http/http.dart' as http;

class Services {
  static const String employeesUrl =
      "https://64e3ac1abac46e480e791292.mockapi.io/Employee";

  static const String companyUrl =
      "https://64e3d188bac46e480e7938a3.mockapi.io/Company";

  static const String tasksUrl =
      "https://64e3ac1abac46e480e791292.mockapi.io/Tasks";

  static getData(String url) async {
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    return json;
  }
}
