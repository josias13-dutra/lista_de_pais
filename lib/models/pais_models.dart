class Country {
  final String name;
  final double latitude;
  final double longitude;
  final String image;
  final String mapLink;

  Country({
    required this.name,
    required this.latitude,
    required this.longitude,
    required this.image,
    required this.mapLink,
  });

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      name: json['name']['common'] ?? 'No name available',
      latitude: json['latlng'][0] ?? 0.0,
      longitude: json['latlng'][1] ?? 0.0,
      image: json['flags']['png'] ?? '',
      mapLink: 'https://www.google.com/maps/place/${json['latlng'][0]},${json['latlng'][1]}',
    );
  }
}