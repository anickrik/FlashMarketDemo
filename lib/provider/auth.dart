
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:flash_market/model/flash_market_model.dart';

class Auth with ChangeNotifier {

  Future<FlashMarketModel> fetchDataFromServer() async {
    final url =
    Uri.parse('https://beta.flashmarket.com.au/api/web/v2/get-home-list');
    final response = await http.post(
      url,
      headers: {
        // HttpHeaders.authorizationHeader: 'guGksV2kBS8cP3R0KCDNZyceUy5CCbWKlrIGKDiq4w0=',
        'x-api-token': 'B4121C817C7E61869FEB4DE25E6A6',
        'Authorization': 'Basic YmV0YWZtYXV0aDpua3M2Yjgxc2hkMDJrZw==',
        'headerToken': 'guGksV2kBS8cP3R0KCDNZyceUy5CCbWKlrIGKDiq4w0=',
      },
    );
    final responseJson = jsonDecode(response.body);
    // print(responseJson);

    if (response.statusCode == 200) {
      return FlashMarketModel.fromJson(responseJson);
    } else {
      throw Exception('Some Error Occurred');
    }
  }




}