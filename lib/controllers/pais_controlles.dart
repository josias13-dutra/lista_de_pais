import 'dart:convert';

import '../models/pais_models.dart';

class CountryController {
  final String _baseUrl = 'https://restcountries.com/v3.1/lang/portuguese';

  get http => null;


  Future<List<Country>> getCountries() async {
    final response = await http.get(Uri.parse(_baseUrl));

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return jsonData.map((country) => Country.fromJson(country)).toList();
    } else {
      throw Exception('Falha ao carregar os países');
    }
  }
}
