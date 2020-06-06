import 'package:http/http.dart' as http;
import 'dart:convert';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];
const coinAPIURL = 'https://rest.coinapi.io/v1/exchangerate';
const apiKey = 'F8105108-8ECC-425E-A427-8F8B8228485D';
Map<String, double> result = {};

class CoinData {
  Future<Map> getCoinData(String selectedCurrency) async {
    for (String crypto in cryptoList) {
      http.Response response = await http
          .get('$coinAPIURL/$crypto/$selectedCurrency?apiKey=$apiKey');
      if (response.statusCode == 200) {
        var coinData = jsonDecode(response.body);
        result[crypto] = coinData['rate'];
      } else {
        print(response.statusCode);
        print(response.body);
        throw 'Problem set with network errors: ${response.statusCode}';
      }
    }
    print(result);
    return result;
  }
}
