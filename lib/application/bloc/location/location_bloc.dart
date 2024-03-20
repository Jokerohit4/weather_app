// location_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:weather_app/application/bloc/location/location%20_event.dart';
import 'location_state.dart';

const kGoogleApiKey = "YOUR_GOOGLE_API_KEY"; // Replace with your API key

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  final GoogleMapsPlaces _places = GoogleMapsPlaces(apiKey: kGoogleApiKey);

  LocationBloc() : super(LocationInitial()) {
    on<FetchCurrentLocation>((event, emit) async {
      try {
        Position position = await Geolocator.getCurrentPosition();
        emit(LocationLoaded('Lat: ${position.latitude}, Long: ${position.longitude}'));
      } catch (e) {
        emit(LocationError('Failed to get current location'));
      }
    });

    on<UpdateLocationWithSearch>((event, emit) async {
      try {
        PlacesDetailsResponse detail = await _places.getDetailsByPlaceId(event.placeId);
        final lat = detail.result.geometry!.location.lat;
        final lng = detail.result.geometry!.location.lng;
        emit(LocationLoaded('Selected: ${detail.result.name}, Lat: $lat, Long: $lng'));
      } catch (e) {
        emit(LocationError('Failed to update location from search'));
      }
    });
  }
}
