import 'dart:convert';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

class NetworkHelper {
  const NetworkHelper();

  Future getWeatherForCity(String city) async {
    // Build API request
    final Uri uri = Uri.https(
      'api.openweathermap.org',
      'data/2.5/weather',
      {
        'appid': 'd61ff5b6abdadd7ef5b3c915b7b721bf',
        'q': city,
        'units': 'metric',
      },
    );
    print('Request $uri');

    http.Response response = await http.get(uri);
    if (response.statusCode != 200) {
      throw 'expected status code 200 but saw ${response.statusCode}';
    }
    Map data = jsonDecode(response.body);
    if (data.containsKey('error')) {
      throw 'data returned contained error ${data['error']}';
    }
    return data;
  }

  Future getWeatherForLocation(Position location) async {
    // Build API request
    final Uri uri = Uri.https(
      'api.openweathermap.org',
      'data/2.5/weather',
      {
        'appid': 'd61ff5b6abdadd7ef5b3c915b7b721bf',
        'lat': '${location.latitude}',
        'lon': '${location.longitude}',
        'units': 'metric',
      },
    );
    print('Request $uri');

    http.Response response = await http.get(uri);
    if (response.statusCode != 200) {
      throw 'expected status code 200 but saw ${response.statusCode}';
    }
    Map data = jsonDecode(response.body);
    if (data.containsKey('error')) {
      throw 'data returned contained error ${data['error']}';
    }
    return data;
  }
}
