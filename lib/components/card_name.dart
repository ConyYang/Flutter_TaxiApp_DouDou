import 'package:flutter/material.dart';
import 'package:singtaxi/constanst.dart';
import 'provider/card_name_provider.dart';
import 'package:provider/provider.dart';

class CardName extends StatelessWidget {

  String defaultName = 'NAME SURNAME';

  @override
  Widget build(BuildContext context) {

    final String name = Provider.of<CardNameProvider>(context).cardName;


    return Text(
      name.isNotEmpty? name: defaultName,
      style: name.isNotEmpty ? kNametextStyle : kDefaultNameTextStyle
    );
  }
}