class Coordinates {
  String id;
  String deviceName;
  double latitude;
  double longitude;

  Coordinates({
    this.id,
    this.deviceName,
    this.latitude,
    this.longitude,
  });

  factory Coordinates.fromJson(Map<String, dynamic> json) {
    return Coordinates(
      id: json['wplace_id'] as String, // diğer serviste id var mıydı? evet
      deviceName: json['wplace_name'] as String,
      latitude: double.parse(json['lat_location']),
      longitude: double.parse(json['lng_location']),
    );
  }
}
