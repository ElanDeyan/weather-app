import 'package:dio/dio.dart';
import 'package:myapp/core/constants.dart';
import 'package:myapp/core/data/models/location.dart';
import 'package:myapp/core/network/i_network_client.dart';

final class DioClient implements INetworkClient {

  const DioClient(this._client);

  final Dio _client;

  @override
  Future<List<Location>> getLocations({
    required String name,
    int count = 10,
    String language = 'en',
    String format = 'json',
  }) async {
    final response = await _client.get<Map<String, Object?>>(
      geocodingBaseUrl,
      queryParameters: {
        'name': name,
        'count': count,
        'language': language,
        'format': format,
      },
    );
    if (response.data! case {"results": final List<Object?> results}) {
      return [for (final result in results) Location.fromMap(result! as Map<String, Object?>)];
    } else {
      throw Exception(response.data);
    }
  }
}
