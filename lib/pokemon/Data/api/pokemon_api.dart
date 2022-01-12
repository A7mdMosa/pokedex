import 'dart:convert';

import 'package:http/http.dart' as http;

class PokemonApi {
  Future<List> getPokemonsUrls(int offset) async {
    final String url =
        'https://pokeapi.co/api/v2/pokemon?limit=18&offset=$offset';
    final response = await http.get(
      Uri.parse(url),
    );
    final Map<String, dynamic> responseData =
        json.decode(response.body) as Map<String, dynamic>;
    return responseData['results'];
  }

  Future<Map<String, dynamic>> getPokemonDetails(String pokemonUrl) async {
    final response = await http.get(
      Uri.parse(pokemonUrl),
    );
    final Map<String, dynamic> responseData =
        json.decode(response.body) as Map<String, dynamic>;

    return responseData;
  }
}
