import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;
import '../../models/coin_response.dart';
import '../../models/coins_response.dart';

part 'coins_event.dart';
part 'coins_state.dart';

class CoinsBloc extends Bloc<CoinsEvent, CoinsState> {
  CoinsBloc() : super(const CoinsState()) {
    on<SetDataCoins>((event, emit) {
      emit(state.copyWith(isCoins: event.isCoins, coins: event.coins));
    });

    on<SetDataCoin>((event, emit) {
      emit(state.copyWith(isDataCoin: event.isDataCoin, coin: event.coin));
    });
  }

  void getCoinsData() async {
    final List<Coins> coinList = [];
    List<dynamic> values = [];
    final uriCoins = Uri.parse(
        'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false');
    final responseCoins = await http.get(uriCoins);
    if (responseCoins.statusCode == 200) {
      //print(responseCoins.body);
      values = json.decode(responseCoins.body);
      if (values.isNotEmpty) {
        for (int i = 0; i < values.length; i++) {
          if (values[i] != null) {
            Map<String, dynamic> map = values[i];
            Coins.fromMap(map);
            coinList.add(Coins.fromMap(map));
          }
        }

        add(SetDataCoins(isCoins: true, coins: coinList));
      }
    }
  }

  void getCoinData(String id) async {
    add(const SetDataCoin(isDataCoin: false, coin: []));
    final List<Coin> coin = [];
    List<dynamic> value = [];
    final uriCoin = Uri.parse('https://api.coingecko.com/api/v3/coins/$id');
    final responseCoin = await http.get(uriCoin);
    if (responseCoin.statusCode == 200) {
      //print(responseCoins.body);
      //   value = json.decode(responseCoin.body);

      Map<String, dynamic> map = json.decode(responseCoin.body);
      final coinData = Coin.fromMap(map);
      coin.add(coinData);
      print(coin.toString());

      add(SetDataCoin(isDataCoin: true, coin: coin));
    }
  }
}
