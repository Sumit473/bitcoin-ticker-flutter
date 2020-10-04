import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'coin_data.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = currenciesList[0];

  List<DropdownMenuItem> getDropdownItems() {
    List< DropdownMenuItem<String>> dropdownItems = [];
    for (String currency in currenciesList){
      var newItem = DropdownMenuItem(
        value: currency,
        child: Text(
            currency,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      );

      dropdownItems.add(newItem);
    }
    return dropdownItems;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 BTC = ? USD',
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
            padding: EdgeInsets.only(top: 30.0, bottom: 30.0),
            color: Colors.lightBlue,
            child: DropdownButton(
              items: getDropdownItems(),
              value: selectedCurrency,
              onChanged: (value) {
                setState(() {
                  selectedCurrency = value;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}

// CupertinoPicker(
// backgroundColor: Colors.lightBlue,
// itemExtent: 32.0,
// onSelectedItemChanged: (selectedIndex) {
// print(selectedIndex);
// },
// children: getPickerItems(),
// ),

// List<Text> getPickerItems() {
//   List<Text> pickerItems = [];
//
//   for (String currency in currenciesList) {
//     pickerItems.add(
//       Text(
//         currency,
//         style: TextStyle(
//           color: Colors.white,
//         ),
//       ),
//     );
//   }
//   return pickerItems;
// }