import 'package:coin_tracker/models/coin_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = 'USD';

  List<CoinModel> coinsList = [
    CoinModel(icon: 'btc', name: 'Bitcoin', price: 16800),
    CoinModel(icon: 'eth', name: 'Ethereum', price: 1200),
    CoinModel(icon: 'ltc', name: 'Litecoin', price: 62.5),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
                flex: 5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('images/coin.png', width: 100),
                    const SizedBox(height: 16),
                    const Text(
                      'Coin Tracker',
                      style: TextStyle(fontSize: 28),
                    ),
                  ],
                )),
            Expanded(
              flex: 6,
              child: ListView.separated(
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          'images/${coinsList[index].icon}.png',
                          width: 60,
                        ),
                        const SizedBox(width: 12),
                        Column(
                          children: [
                            const Text('1', style: TextStyle(fontSize: 18)),
                            Text(
                              coinsList[index].name,
                              style: const TextStyle(color: Colors.white24),
                            ),
                          ],
                        )
                      ],
                    ),
                    trailing: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          NumberFormat("#,###.0")
                              .format(coinsList[index].price),
                          style: const TextStyle(fontSize: 18),
                        ),
                        Text(
                          selectedCurrency,
                          style: const TextStyle(color: Colors.white24),
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(),
                itemCount: coinsList.length,
              ),
            ),
            Container(
              color: Colors.grey,
              height: 150,
            ),
          ],
        ),
      ),
    );
  }
}
