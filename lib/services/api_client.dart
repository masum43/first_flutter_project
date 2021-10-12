import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiClient{
  static String authority = "api.getgeoapi.com";
  static String apiKey = "de7ea50d01b72d81e190dc772e7c74cab67b5e75";

  final Uri currencyUrl = Uri.http(authority, "v2/currency/list", {"api_key": apiKey});
  


  Future<List<String>?> getCurrencies() async {
    http.Response res = await http.get(currencyUrl);
    List<String>? currencies;
    if(res.statusCode == 200) {
      var body = jsonDecode(res.body);
      var list = body["currencies"];
      currencies = (list.keys).toList();
    }
    print('status_code: ${res.statusCode.toString()}');
    // return currencies??<String>[];
    return currencies;
  }

  Future<String>? getConvertResult(String from, String to, String amount) async {
    Map<String, String> parameters = Map<String, String>();
    parameters['from'] = from;
    parameters['to'] = to;
    parameters['amount'] = amount;
    parameters['api_key'] = apiKey;

    final Uri convertUrl = Uri.http(authority, "v2/currency/convert", parameters);
    http.Response res = await http.get(convertUrl);
    String rateForAmount = "";
    print('status_code_convert: ${res.statusCode.toString()}');
    print('status_code_convert: $from');
    print('status_code_convert: $to');
    print('status_code_convert: $amount');
    if(res.statusCode == 200) {
      var body = jsonDecode(res.body);
      var obj = body["rates"];
      var GBP = obj[to];
      rateForAmount = GBP["rate_for_amount"];
    }
    return rateForAmount;
  }
}
