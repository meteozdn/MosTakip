import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:takip_sistem_mos/services/services.dart';

class PushTests extends StatelessWidget {
  const PushTests({super.key});

  postData() async {
    var response = await http.post(Uri.parse(Services.companyUrl),
        body: {"image": "aaaaaa", "name": "13123", "country": "asdasd"});
    print(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        postData();
      }),
    );
  }
}
