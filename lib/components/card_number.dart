import 'package:flutter/material.dart';
import 'provider/card_number_provider.dart';
import 'package:provider/provider.dart';

import '../constanst.dart';

class CardNumber extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Provider.of<CardNumberProvider>(context).cardNumber;

    String number = Provider.of<CardNumberProvider>(context).cardNumber;
    String defaultNumber = '';

    for (int i = 1; i <= 16 - number.length; i++) {
      defaultNumber = 'x' + defaultNumber;
      if (i % 4 == 0 && i != 16) {
        defaultNumber = '  ' + defaultNumber;
      }
    }
    String cardNumber = '';

    for (int i = 1; i <= number.length; i++) {
      cardNumber = cardNumber + number[i - 1];
      if (i % 4 == 0 && i != number.length) {
        cardNumber = cardNumber + '  ';
      }
    }

    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 5),
        child: Row(
          children: <Widget>[
            Text(
              cardNumber,
              style: kCardNumberTextStyle,
            ),
            Text(
              defaultNumber,
              style: kCardDefaultTextStyle,
            )
          ],
        ),
      ),
    );
  }
}
