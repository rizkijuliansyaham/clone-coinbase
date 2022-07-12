import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../models/coin.dart';

class CoinPage extends StatefulWidget {
  final Coin coin;
  const CoinPage({required this.coin, Key? key}) : super(key: key);

  @override
  State<CoinPage> createState() => _CoinPageState();
}

class _CoinPageState extends State<CoinPage> {
  late double _coinPrice;

  @override
  void initState() {
    super.initState();
    _coinPrice = widget.coin.price;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          widget.coin.fullName,
          style: const TextStyle(color: Colors.black),
        ),
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: [
            Text(
              "${widget.coin.fullName} price",
              style: TextStyle(color: Colors.grey.shade700, fontSize: 14),
            ),
            Text(
              "\$${_coinPrice.toStringAsFixed(2)}",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 28,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 50,
            ),

            // Nanti grafik disini
          ],
        ),
      )),
    );
  }
}
