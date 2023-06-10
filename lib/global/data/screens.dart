import 'package:app_one/architecture_app/ui/home/arquitect_home_screen.dart';
import 'package:app_one/bank_app/ui/home/bank_home_screen.dart';
import 'package:app_one/coffee_app/ui/splash/splash_screen.dart';
import 'package:app_one/crypto_app/ui/home/home_crypto_screen.dart';
import 'package:app_one/social_app/ui/home/home_screen.dart';
import 'package:app_one/time_app/ui/home/home_screen_time.dart';

import '../../air/ui/animations/widgets/animations_screen.dart';
import '../../air/ui/home/air_home_screen.dart';
import '../../air/ui/seats/seats_screen.dart';
import '../../food_app/ui/home/food_home_screen.dart';
import '../../hamburger_app/ui/home/hamburger_screen.dart';
import '../../motorcycle_app/ui/home/home_screen_motorcycle.dart';
import '../../plant_app/ui/home/plant_home_screen.dart';
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
  CardScreen(screenName: 'BankScreen', screen: BankHomeScreen()),
  CardScreen(screenName: 'FoodScreen', screen: FoodHomeScreen()),
  CardScreen(screenName: 'PlantScreen', screen: PlantHomeScreen()),
  CardScreen(screenName: 'BurgerScreen', screen: BurgerHomeScreen()),
  CardScreen(screenName: 'FlyScreen', screen: AirHomeScreen())
];
