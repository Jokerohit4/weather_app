// location_event.dart
abstract class LocationEvent {}

class FetchCurrentLocation extends LocationEvent {}

class UpdateLocationWithSearch extends LocationEvent {
  final String placeId;

  UpdateLocationWithSearch(this.placeId);
}
