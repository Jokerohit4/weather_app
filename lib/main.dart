
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:weather_app/application/bloc/auth/auth_bloc.dart';
import 'package:weather_app/application/bloc/auth/auth_state.dart';
import 'package:weather_app/application/bloc/network/network_bloc.dart';
import 'package:weather_app/application/bloc/network/network_state.dart';
import 'package:weather_app/application/bloc/weather/weather_bloc.dart';
import 'package:weather_app/infrastructure/auth/auth_repository_impl.dart';
import 'package:weather_app/infrastructure/weather/weather_repository_impl.dart';
import 'package:weather_app/services/router/app_routes.dart';
import 'package:weather_app/services/locator.dart';
import 'package:weather_app/utils/app_colors.dart';
import 'package:weather_app/services/router/app_routes.gr.dart' as i1;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Hive.initFlutter();
   setupLocator();

  // final routeObserver = MyRouteObserver();
  // final blocObserver = MyBlocObserver();
  // FirebaseAuth.instance
  //     .signOut();
  // // Register the custom BLoC observer
  // Bloc.observer = blocObserver;
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(authRepository: AuthRepositoryImpl(FirebaseAuth.instance)),
         // child: SignInScreen(),
        ),
        BlocProvider(
          create: (context) => NetworkBloc(Connectivity()),
        ),
        BlocProvider(
          create: (context) => WeatherBloc(weatherRepository: WeatherRepositoryImpl(Dio())),
          //child: WeatherScreen(),
        )
        // // Add more BlocProviders as needed
      ],
      child: ScreenUtilInit(
          designSize: const Size(360, 690),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return  MyApp();
          }),
    ),
  );
}

class MyApp extends StatefulWidget {
   MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
 // final MyRouteObserver routeObserver;
  final AppRouter appRouter  =AppRouter();
  String name ="";
  @override
  void initState() {
    super.initState();
    store();
  }

  store() async {
//
//     await box.put('name', 'David');
//
// // Read
//      name = box.get('name');
//      print(name);
  }



  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthLoadSuccess ) {
             // appRouter.replace(const HomeViewRoute());
             print("aaaaaaaaaaaaaaaaaa");
            } else {
              appRouter.replace(const i1.LoginView());
            }
          },
        ),
        BlocListener<NetworkBloc, NetworkState>(
          listener: (context, state) {
            if (state is NetworkOffline) {
              // Handle network failure state
              print("ffffffffffffffff");
            }
            else{
              print("dsdfsfms");
            }
          },
        ),
      ],
      child: MaterialApp.router(
        routerDelegate: appRouter.delegate(),
        routeInformationParser: appRouter.defaultRouteParser(),
        theme: ThemeData(
          scaffoldBackgroundColor: AppColors.whiteColor,
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            backgroundColor: Colors.black,
          ),
        ),
      ),
    );
  }
}