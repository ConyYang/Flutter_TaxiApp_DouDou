import 'package:flutter/material.dart';
import 'package:singtaxi/constanst.dart';
import 'provider/card_cvv_provider.dart';
import 'provider/card_name_provider.dart';
import 'provider/card_valid_provider.dart';
import 'provider/state_provider.dart';
import 'package:provider/provider.dart';
import 'provider/card_number_provider.dart';

class InputViewPager extends StatelessWidget {
  final pageController;

  InputViewPager({this.pageController});

  final titleMap = {
    0: 'Card Number',
    1: 'Cardholder Name',
    2: 'Valid Thru',
    3: 'Security Code(CVC)'
  };

  List<FocusNode> focusNodes = [
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
  ];

  @override
  Widget build(BuildContext context) {
    Provider.of<StateProvider>(context).addListener(() {
      int index = Provider.of<StateProvider>(context).getCurrentState().index;
      FocusScope.of(context).requestFocus(focusNodes[index]);
    });

    return Container(
        height: 110,
        child: PageView.builder(
            physics: NeverScrollableScrollPhysics(),
            controller: pageController,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: InputForm(
                    focusNode: focusNodes[index],
                    title: titleMap[index],
                    index: index,
                    pageController: pageController),
              );
            },
            itemCount: titleMap.length));
  }
}

class InputForm extends StatefulWidget {
  final String title;
  final int index;
  final PageController pageController;
  final FocusNode focusNode;

  InputForm(
      {@required this.title, this.index, this.pageController, this.focusNode});

  @override
  _InputFormState createState() => _InputFormState();
}

class _InputFormState extends State<InputForm> {
  var opacicy = 0.3;

  int maxLength;
  TextInputType textInputType;
  TextEditingController textController =  TextEditingController();


  void onChange() {
    setState(() {
      if (widget.index == widget.pageController.page.round()) {
        opacicy = 1;
      } else {
        opacicy = 0.3;
      }
    });
  }

  @override
  void initState() {
    super.initState();

    if (widget.index == 0) {
      opacicy = 1;
      
    }

    widget.pageController.addListener(onChange);

    if (widget.index == InputState.number.index) {
      maxLength = 16;
      textInputType = TextInputType.number;
    } else if (widget.index == InputState.name.index) {
      maxLength = 20;
      textInputType = TextInputType.text;
    } else if (widget.index == InputState.validate.index) {
      maxLength = 4;
      textInputType = TextInputType.number;
    } else if (widget.index == InputState.CVV.index) {
      maxLength = 3;
      textInputType = TextInputType.number;
    }
  }

  @override
  void dispose() {
    widget.pageController.removeListener(onChange);

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: opacicy,
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              widget.title,
              style: TextStyle(fontSize: 15, color: Colors.black38),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              autofocus: widget.index == 0,
              controller: textController,
              focusNode: widget.focusNode,
              keyboardType: textInputType,
              maxLength: maxLength,
              onChanged: (newValue) {
                if (widget.index == InputState.number.index) {
                  Provider.of<CardNumberProvider>(context).setNumber(newValue);
                } else if (widget.index == InputState.name.index) {
                  Provider.of<CardNameProvider>(context).setName(newValue);
                } else if (widget.index == InputState.validate.index) {
                  Provider.of<CardValidProvider>(context).setValid(newValue);
                } else if (widget.index == InputState.CVV.index) {
                  Provider.of<CardCVVProvider>(context).setCVV(newValue);
                }
              },
              decoration: InputDecoration(
                // counter: Offstage(),
                counter: SizedBox(
                  height: 0,
                ),

                contentPadding:
                    const EdgeInsets.symmetric(vertical: 2.0, horizontal: 10),
                border: OutlineInputBorder(
                    borderSide: BorderSide(width: 0.5, color: Colors.black38),
                    borderRadius: BorderRadius.circular(5)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 0.5, color: Colors.black38),
                    borderRadius: BorderRadius.circular(5)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
