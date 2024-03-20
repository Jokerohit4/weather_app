import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:weather_app/application/bloc/location/location%20_event.dart';
import 'package:weather_app/application/bloc/location/location_bloc.dart';
import 'package:weather_app/application/bloc/location/location_state.dart';


class LocationScreen extends StatelessWidget {
  const LocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LocationBloc>(
      create: (context) => LocationBloc()..add(FetchCurrentLocation()),
      child: Scaffold(
        appBar: AppBar(title: const Text('Location Selector')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              BlocBuilder<LocationBloc, LocationState>(
                builder: (context, state) {
                  if (state is LocationLoaded) {
                    return Text(state.locationDescription);
                  } else if (state is LocationError) {
                    return Text(state.message);
                  }
                  return const CircularProgressIndicator();
                },
              ),
              ElevatedButton(
                onPressed: () async {
                  Prediction? p = await PlacesAutocomplete.show(
                    context: context,
                    apiKey: kGoogleApiKey,
                    mode: Mode.overlay,
                    types: [],
                    strictbounds: false,
                    language: "en",
                    components: [Component(Component.country, "us")],
                  );

                  if (p != null) {
                    BlocProvider.of<LocationBloc>(context).add(UpdateLocationWithSearch(p.placeId!));
                  }
                },
                child: const Text('Search Location'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
