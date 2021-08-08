import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as request;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  var _result = "-----";

  void _getPrice() async {

    var url = "https://blockchain.info/ticker";

    request.Response response;
    response = await request.get(url);

    Map<String, dynamic> price = jsonDecode(response.body);

    setState(() {
      _result = "R\$ "+price['BRL']['buy'].toString();
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 15),
              child: Image.asset("images/bitcoin.png"),
            ),
            Padding(
              padding: EdgeInsets.only(top: 30),
              child: Text(
                _result,
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 30),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Color(0xffff9400)),
                onPressed: () { _getPrice(); },
                child: Text(
                  "ATUALIZAR",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
