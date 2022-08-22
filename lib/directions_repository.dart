import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_gmaps/.env.dart';
import 'package:flutter_gmaps/directions_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DirectionsRepository {
  static const String _baseUrl =
      'https://maps.googleapis.com/maps/api/directions/json?';

  // final Dio dio;
  Dio dio;

  DirectionsRepository({Dio dio}) : dio = dio ?? Dio();

  Future<Directions> getDirections({
    @required LatLng origin,
    @required LatLng destination,
  }) async {
    
      final response = await dio.get(
        _baseUrl,
        queryParameters: {
          'origin': '${origin.latitude},${origin.longitude}',
          'destination': '${destination.latitude},${destination.longitude}',
          'key': googleAPIKey,
        },
      );

      // Check if response is successful
      if (response.statusCode == 200) {
        return Directions.fromMap(response.data);
      }
      return null;
    
  }
}
