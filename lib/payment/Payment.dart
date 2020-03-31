import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'back_card_view.dart';
import 'front_card_view.dart';
import 'input_view_pager.dart';
import 'my_appbar.dart';
import 'round_button.dart';
import 'package:singtaxi/constanst.dart';
import 'provider/state_provider.dart';
import 'package:provider/provider.dart';

class Payment extends StatefulWidget {
  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  PageController pageController;

  GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();

  @override
  void initState() {
    super.initState();
    pageController = PageController(
      viewportFraction: 0.92,
      initialPage: 0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Payment"),
        backgroundColor: Colors.brown[600],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: MyAppbar(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: FlipCard(
                flipOnTouch: false,
                key: cardKey,
                front: FrondCardView(),
                back: BackCardView(),
              ),
            ),
            InputViewPager(
              pageController: pageController,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(top : 10, right: 22),
                child: RoundButton(onTap: () {
                  pageController.nextPage(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeIn);

                  if (InputState.validate ==
                      Provider.of<StateProvider>(context, listen: false)
                          .getCurrentState()) {
                    cardKey.currentState.toggleCard();
                  }
                  Provider.of<StateProvider>(context, listen: false)
                      .moveNextState();
                }),
              ),
            ),
          ],
        ),

      ),
    );
  }
}