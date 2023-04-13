import 'package:rive/rive.dart';

class RiveAsset {
  final String src, artboard, stateMachineName, title;
  late SMIBool? input;

  RiveAsset(
      {required this.src,
      required this.artboard,
      required this.stateMachineName,
      required this.title,
      this.input});

  set setInput(SMIBool status) {
    input = status;
  }
}

List<RiveAsset> bottomNavs = [
  RiveAsset(
      src: 'assets/RiveAssets/icons.riv',
      artboard: 'HOME',
      stateMachineName: "HOME_interactivity",
      title: 'Home'),
  RiveAsset(
      src: 'assets/RiveAssets/icons.riv',
      artboard: 'SEARCH',
      stateMachineName: "SEARCH_Interactivity",
      title: 'Search'),
  RiveAsset(
      src: 'assets/RiveAssets/icons.riv',
      artboard: 'TIMER',
      stateMachineName: "TIMER_Interactivity",
      title: 'Timer'),
  RiveAsset(
      src: 'assets/RiveAssets/icons.riv',
      artboard: 'USER',
      stateMachineName: "USER_Interactivity",
      title: 'Profile')
];
