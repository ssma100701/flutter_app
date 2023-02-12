import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'coin_data.dart';
import 'dart:io' show Platform;
import 'tools/network.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedValue = 'USD';
  double coinRate = 0.0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCoinRate();
  }

  Future<dynamic> getCoinRate() async {
    Network network = Network();
    var res = await network.getData(selectedValue);
    if(res == '200') {
      print('error');
    } else{
      setState(() {
        coinRate = res['rate'];
      });
    }
  }

  Widget androidDropdownButton() {
    List<DropdownMenuItem> dropdownItems = [];

    for (var currency in currenciesList) {
      DropdownMenuItem dropdownItem = DropdownMenuItem(
        value: currency,
        child: Text(currency),
      );
      dropdownItems.add(dropdownItem);
    }

    return DropdownButton(
        value: selectedValue,
        items: dropdownItems,
        onChanged: (value) {
          setState(() {
            selectedValue = value;
            coinRate = 0.0;
          });
          getCoinRate();
        });
  }

  Widget iOSPickerButton() {
    List<Text> items = [];
    for (var currency in currenciesList) {
      items.add(Text(currency));
    }

    return CupertinoPicker(
      itemExtent: 32.0,
      onSelectedItemChanged: (selectedIndex) {
        setState(() {
          selectedValue = items[selectedIndex].data!;
          coinRate = 0.0;
        });
        getCoinRate();
      },
      children: items,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 BTC = ${coinRate==0.0? '?' : coinRate.toStringAsFixed(2)} $selectedValue',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: const EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: Platform.isIOS? iOSPickerButton() : androidDropdownButton(),
          ),
        ],
      ),
    );
  }
}
