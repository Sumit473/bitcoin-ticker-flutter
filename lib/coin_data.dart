import 'package:http/http.dart' as http;
import 'dart:convert';

List<String> currenciesList = [
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

const apiKey = '91781ECF-2F67-48C1-9101-93CB6CF9B482';
const coinAPIURL = 'https://rest.coinapi.io/v1/exchangerate';

class CoinData {
  Future getCoinData(String selectedCurrency) async {
    http.Response response = await http.get('$coinAPIURL/BTC/$selectedCurrency?apikey=$apiKey');

    if (response.statusCode == 200) {
      var decodedData = jsonDecode(response.body);
      var lastPrice = decodedData['rate'];
      return lastPrice;
    }
    else {
      print(response.statusCode);
      throw 'Problem with the get request';
    }
  }
}
