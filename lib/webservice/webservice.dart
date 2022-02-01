
import 'dart:convert';
import 'package:githubactionsflutter/home/model/album.dart';
import 'package:githubactionsflutter/utils/constants.dart';
import 'package:http/http.dart' as http;

class Webservice {
  Future<Album> fetchAlbum(http.Client client) async {
    final response = await client
        .get(Uri.parse('${Constants.BASE_URL}albums/1'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return Album.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
}