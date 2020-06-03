import 'package:convertcurrency/dashboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CurrencyList extends StatefulWidget {
  @override
  _CurrencyListState createState() => _CurrencyListState();
}
  class _CurrencyListState extends State<CurrencyList> {
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Color(0xFFEC5759),
        appBar: AppBar(
          backgroundColor: Color(0xFFEC5759),
          elevation: 0.0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white) ,
            onPressed: (){
              Navigator.of(context).pop();
            },
          ),
        ),
        body: ListView(
          children: <Widget>[
            getListItem('1.   Russian Ruble (RUB)', 'RUB'),
            getListItem('2.   Indian Rupee (INR)', 'INR'),
            getListItem('3.   Japanese Yen (JPY)', 'JPY'),
            getListItem('4.   Pound Sterling (GBP)', 'GBP'),
          ],
        ),
      );
    }

    Widget getListItem(String currencyName, String  currency){

      return InkWell(
        onTap: (){
          Navigator.of(context).pushReplacement(CupertinoPageRoute(
            builder: (context) => DashboardPage(currencyVal: 0.0,isWhite: false, convertedCurrency: 0.0, currencyOne: 'USD',currencyTwo: currency)
          ));
        },
        child: Padding(
          padding: EdgeInsets.only(left: 25.0,bottom: 20.0),
          child: Text(
            currencyName,
            style: TextStyle(
              fontFamily: 'Quicksand',
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
              color: Colors.white
            ),
          ),
        ),
      );
    }
  }