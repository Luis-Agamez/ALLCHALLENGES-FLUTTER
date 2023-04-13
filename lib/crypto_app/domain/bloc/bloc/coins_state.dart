part of 'coins_bloc.dart';

class CoinsState extends Equatable {
  final bool isCoins;
  final bool isDataCoin;
  final List<Coins> coins;
  final List<Coin> coin;

  const CoinsState({
    this.isCoins = false,
    this.isDataCoin = false,
    this.coins = const [],
    this.coin = const [],
  });

  CoinsState copyWith({
    bool? isCoins,
    bool? isDataCoin,
    List<Coins>? coins,
    List<Coin>? coin,
  }) =>
      CoinsState(
          isCoins: isCoins ?? this.isCoins,
          isDataCoin: isDataCoin ?? this.isDataCoin,
          coins: coins ?? this.coins,
          coin: coin ?? this.coin);

  @override
  List<Object> get props => [isCoins, isDataCoin, coins, coin];
}
