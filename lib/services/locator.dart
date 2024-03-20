import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void setupLocator() {
  // locator.registerLazySingleton(() => Dio());
  // locator.registerLazySingleton<WeatherRepository>(() => WeatherRepositoryImpl(locator()));
  // locator.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(FirebaseAuth.instance));
  // locator.registerFactory(() => WeatherBloc(locator()));
  // locator.registerFactory(() => AuthBloc(locator()));
  // GetIt.instance.registerLazySingleton<Dio>(() => Dio());
  // GetIt.instance.registerLazySingleton<ApiService>(() => ApiService(GetIt.instance<Dio>()));
}