import 'package:app_one/principal_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'air/ui/animations/widgets/animations_screen.dart';
import 'air/ui/details/air_details_screen.dart';
import 'air/ui/home/air_home_screen.dart';
import 'crypto_app/domain/bloc/bloc/coins_bloc.dart';
import 'food_app/ui/map/map_screen.dart';
import 'time_app/domain/blocs/clime/clime_bloc.dart';
import 'time_app/domain/blocs/gps/gps_bloc.dart';
import 'time_app/domain/blocs/location/location_bloc.dart';

void main() {
  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (context) => CoinsBloc()),
    BlocProvider(create: (context) => ClimeBloc()),
    BlocProvider(create: (context) => GpsBloc()),
    BlocProvider(create: (context) => LocationBloc()),
  ], child: const MyApp()));
}

@override
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const PrincipalScreen(),
      //home: const AnimationScreen(),
      theme: ThemeData(
        useMaterial3: true,
      ),
    );
  }
}


    //color: Color(0xFFD8CEF1),