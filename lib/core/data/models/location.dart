import 'dart:convert';

interface class Location {
  const Location({
    required this.id,
    required this.name,
    required this.latitude,
    required this.longitude,
    required this.elevation,
    required this.featureCode,
    required this.countryCode,
    required this.timezone,
    required this.population,
    required this.postcodes,
    required this.countryId,
    required this.country,
  });

  final int id;
  final String name;
  final double latitude;
  final double longitude;
  final double elevation;
  final String featureCode;
  final String countryCode;
  final String timezone;
  final int population;
  final List<String> postcodes;
  final int countryId;
  final String country;

  factory Location.fromMap(Map<String, Object?> json) {
    if (json
        case {
          'id': final int id,
          'name': final String name,
          'latitude': final double latitude,
          'longitude': final double longitude,
          'elevation': final double elevation,
          'feature_code': final String featureCode,
          'country_code': final String countryCode,
          'timezone': final String timezone,
          'population': final int population,
          'postcodes': final List<Object?> postcodes,
          'country_id': final int countryId,
          'country': final String country,
        } when postcodes.every((postCode) => postCode is String)) {
      return Location(
        id: id,
        name: name,
        latitude: latitude,
        longitude: longitude,
        elevation: elevation,
        featureCode: featureCode,
        countryCode: countryCode,
        timezone: timezone,
        population: population,
        postcodes: [for (final postCode in postcodes) postCode.toString()],
        countryId: countryId,
        country: country,
      );
    }
    throw const FormatException('Invalid json format');
  }

  Map<String, Object?> toMap() => <String, Object?>{
        'id': id,
        'name': name,
        'latitude': latitude,
        'longitude': longitude,
        'elevation': elevation,
        'feature_code': featureCode,
        'country_code': countryCode,
        'timezone': timezone,
        'population': population,
        'postcodes': postcodes,
        'country_id': countryId,
        'country': country,
      };

  String toJson() => json.encode(toMap());

  factory Location.fromJson(String source) =>
      Location.fromMap(jsonDecode(source) as Map<String, Object?>);

  @override
  String toString() => 'Location(id: $id, name: $name)';
}
