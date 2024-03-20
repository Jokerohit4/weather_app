
abstract class LocationState {}

class LocationInitial extends LocationState {}

class LocationLoaded extends LocationState {
  final String locationDescription;

  LocationLoaded(this.locationDescription);
}

class LocationError extends LocationState {
  final String message;

  LocationError(this.message);
}