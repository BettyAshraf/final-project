class PlaceModel {
  final String name;
  final double lat;
  final double lon;
  final String formattedAddress;
  final List<String> categories;
  final String? imageUrl; // optional

  PlaceModel({
    required this.name,
    required this.lat,
    required this.lon,
    required this.formattedAddress,
    required this.categories,
    this.imageUrl,
  });

  factory PlaceModel.fromJson(Map<String, dynamic> json) {
    final props = json['properties'];
    final geom = json['geometry'];

    String? img;
    if (props['icon'] != null) {
      img = props['icon'];
    } else if (props['photos'] != null && (props['photos'] as List).isNotEmpty) {
      img = props['photos'][0]['url'];
    }

    return PlaceModel(
      name: props['name'] ?? '',
      lat: (geom['coordinates'][1] as num).toDouble(),
      lon: (geom['coordinates'][0] as num).toDouble(),
      formattedAddress: props['formatted'] ?? '',
      categories: List<String>.from(props['categories'] ?? []),
      imageUrl: img,
    );
  }
}
