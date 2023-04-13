import 'package:app_one/architecture_app/ui/home/arquitect_home_screen.dart';
import 'package:app_one/bank_app/ui/home/bank_home_screen.dart';
import 'package:app_one/coffee_app/ui/splash/splash_screen.dart';
import 'package:app_one/crypto_app/ui/home/home_crypto_screen.dart';
import 'package:app_one/social_app/ui/home/home_screen.dart';
import 'package:app_one/time_app/ui/home/home_screen_time.dart';

import '../../motorcycle_app/ui/home/home_screen_motorcycle.dart';
import '../../travel_app/ui/home/home_screen_travel.dart';
import '../ui/card_screen.dart';

List<CardScreen> screens = const [
  CardScreen(screenName: 'TravelScreen', screen: HomeScreenTravel()),
  CardScreen(screenName: 'MotorcycleScreen', screen: HomeScreenMotorcycle()),
  CardScreen(screenName: 'TimeScreen', screen: HomeScreenTime()),
  CardScreen(screenName: 'CryptoScreen', screen: HomeCryptoScreen()),
  CardScreen(screenName: 'SocialScreen', screen: HomeScreenSocialApp()),
  CardScreen(screenName: 'ArquitectureScreen', screen: ArquitectHomeScreen()),
  CardScreen(screenName: 'CoffeeScreen', screen: SplashScreen()),
  CardScreen(screenName: 'BankScreen', screen: BankHomeScreen())
];
