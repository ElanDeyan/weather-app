import 'package:myapp/core/data/models/location.dart';

abstract interface class INetworkClient {
  /// https://geocoding-api.open-meteo.com/v1/search?name=Berlin&count=10&language=en&format=json
  Future<List<Location>> getLocations({
    required String name,
    int count = 10,
    String language = 'en',
    String format = 'json',
  });
}
