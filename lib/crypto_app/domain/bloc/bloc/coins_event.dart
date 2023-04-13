part of 'coins_bloc.dart';

abstract class CoinsEvent extends Equatable {
  const CoinsEvent();

  @override
  List<Object> get props => [];
}

class SetDataCoins extends CoinsEvent {
  final bool isCoins;
  final List<Coins> coins;

  const SetDataCoins({required this.isCoins, required this.coins});
}

class SetDataCoin extends CoinsEvent {
  final bool isDataCoin;
  final List<Coin> coin;

  const SetDataCoin({required this.isDataCoin, required this.coin});
}
