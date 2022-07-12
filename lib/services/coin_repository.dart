import 'dart:convert';

import 'package:belajar_clone_coinbase/models/coin_data.dart';

import '../models/coin.dart';
import '../models/data_error.dart';
import 'package:http/http.dart' as http;

class CoinRepository {
  static const String _baseUrl = 'https://min-api.cryptocompare.com/';

  Future<List<Coin>> getCoins() async {
    const requestUrl =
        '${_baseUrl}data/top/totalvolfull?limit=25&tsym=USD&page=0';

    try {
      final response = await http.Client().get(Uri.parse(requestUrl));
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body) as Map<String, dynamic>;
        final data = json['Data'] as List<dynamic>;
        print(data);
        return data.map((e) {
          return Coin.fromMap(e);
        }).toList();
      } else {
        throw Exception('Failed to load currencies');
      }
    } catch (err) {
      throw DataError(message: err.toString());
    }
  }

  static Future<List<CoinData>> getCoinHourlyData(String ticker) async {
    final requestUrl =
        '${_baseUrl}data/v2/histohour?fsym=$ticker&tsym=USD&limit=25';

    try {
      final response = await http.Client().get(Uri.parse(requestUrl));
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body) as Map<String, dynamic>;
        final data = json['Data']['Data'] as List<dynamic>;

        return data.map((e) {
          return CoinData.fromMap(e);
        }).toList();
      } else {
        throw Exception('Failed untuk mengambil karensi');
      }
    } catch (err) {
      throw DataError(message: err.toString());
    }
  }
}
