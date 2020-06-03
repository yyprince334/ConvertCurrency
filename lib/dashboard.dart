import 'package:convertcurrency/currency_list.dart';
import 'package:convertcurrency/currencyservice.dart';
import 'package:convertcurrency/red_input.dart';
import 'package:convertcurrency/white_input.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class DashboardPage extends StatefulWidget {

  final currencyVal;
  final convertedCurrency;
  final currencyOne;
  final currencyTwo;
  final isWhite;

  DashboardPage({this.currencyVal,

    this.convertedCurrency,
    this.currencyOne,
    this.currencyTwo,
    this.isWhite

  });

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
          ),
          Container(
            height: MediaQuery.of(context).size.height / 2,
            width: MediaQuery.of(context).size.width,
            color: Color(0xFFEC5759),
          ),
          Container(
            child: Center(
              child: Column(
                children: <Widget>[
                  SizedBox(height: 105),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(CupertinoPageRoute(
                        builder: (context)=> CurrencyList()
                      ));
                    },
                    child: Text(
                      CurrencyService().getCurrencyString(widget.currencyOne),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32.0,
                        fontFamily: "Quicksand"
                      ),
                    )
                  ),
                  SizedBox(height: 40.0),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context)=> InputRedPage(
                            origCurrency: widget.currencyOne,
                            convCurrency: widget.currencyTwo,
                          )
                      ));
                    },
                    child: Text(
                      widget.currencyVal.toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 80.0,
                        fontFamily: "Quicksand",
                        fontWeight: FontWeight.bold
                      ),
                    )
                  ),
                  SizedBox(height: 40.0),
                  Text(widget.currencyOne,
                  style: TextStyle(
                    color: Color(0xFFFFB6B6),
                    fontSize: 17.0,
                    fontFamily: 'Quicksand',
                    fontWeight: FontWeight.bold
                  ),
                  ),
                  SizedBox(height:45.0),
                  Container(
                    height: 125.0,
                    width: 125.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(62.5),
                      color: Colors.white,
                      border: Border.all(
                        color: Color(0xFFEC5759),
                        style: BorderStyle.solid,
                        width: 5.0
                      )
                    ),
                    child: Center(
                      child: widget.isWhite ?
                      Icon(
                            Icons.arrow_upward,
                            size: 60.0,
                            color: Color(0xFFEC5759),
                      ):
                      Icon(
                        Icons.arrow_downward,
                        size: 60.0,
                        color: Color(0xFFEC5759),
                      ),
                    ),
                  ),
                  SizedBox(height: 40.0),
                  Text(
                    widget.currencyTwo,
                    style: TextStyle(
                      color: Color(0xFFFFB6B6),
                      fontSize: 17.0,
                      fontFamily: 'Quicksand',
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(height: 40.0),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context)=> InputWhitePage(
                          origCurrency: widget.currencyOne,
                          convCurrency: widget.currencyTwo,
                        )
                      ));
                    },
                      child: Text(
                        widget.convertedCurrency.toString(),
                        style: TextStyle(
                            color: Color(0xFFEC5759),
                            fontSize: 80.0,
                            fontFamily: "Quicksand",
                            fontWeight: FontWeight.bold
                        ),
                      ),
                  ),
                  SizedBox(height:40),
                  InkWell(
                      onTap: () {
                        Navigator.of(context).push(CupertinoPageRoute(
                            builder: (context)=> CurrencyList()
                        ));
                      },
                      child: Text(
                        CurrencyService().getCurrencyString(widget.currencyTwo),
                        style: TextStyle(
                            color: Color(0xFFEC5759),
                            fontSize: 32.0,
                            fontFamily: 'Quicksand'
                        ),
                      ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}