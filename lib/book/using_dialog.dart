import 'package:flutter/material.dart';
import 'multi_select_dialog.dart';

class UsingDialog extends StatefulWidget {
  @override
  _UsingDialogState createState() => _UsingDialogState();
}

class _UsingDialogState extends State<UsingDialog> {
  static final List<String> name = [
    "Huang",
    "Lim",
    "Luo",
    "Ong"
  ];

  final List<MultiSelectDialogItem<int>> items = List.generate(
    4,
    (index) => MultiSelectDialogItem(index + 1, 'Driver ${index + 1}: ${name[index]}'),
  );
  Set<int> selectedValues;

  void submit() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Driver(s) selected'),
          content: Container(
            color: Colors.grey[200],
            child: Wrap(
              spacing: 10.0,
              children: selectedValues.map((item) {
                return Chip(
                  backgroundColor: Colors.white,
                  label: Text('item $item',
                      style: TextStyle(
                          color: Colors.green[800],
                          fontWeight: FontWeight.bold,
                          fontSize: 17)),
                );
              }).toList(),
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('OK',
                  style: TextStyle(
                      color: Colors.orangeAccent,
                      fontWeight: FontWeight.bold,
                      fontSize: 20)),
              onPressed: () { Navigator.pushNamed(context, "/confirmBook");},
            ),
          ],
        );
      },
    );
  }

  void _showMultiSelect() async {
    selectedValues = await showDialog(
      context: context,
      builder: (context) {
        return MultiSelectDialog(
          title: 'Select Driver(s)',
          items: items,
          initialSelectedValues: selectedValues,
        );
      },
    );

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Driver'),
        backgroundColor: Colors.brown[600],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              onTap: _showMultiSelect,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20.0),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border.all(
                    color: Colors.black54,
                    width: 2.0,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        child: Wrap(
                          spacing: 10.0,
                          children: selectedValues == null ||
                                  selectedValues.length == 0
                              ? [Container()]
                              : selectedValues.map(
                                  (v) {
                                    return Chip(
                                      label: Text('Driver$v ${name[v - 1]}'),
                                      labelStyle:
                                          TextStyle(color: Colors.green[800], fontSize: 17),
                                      backgroundColor: Colors.white,
                                      elevation: 6,
                                      onDeleted: () {
                                        setState(() {
                                          selectedValues.remove(v);
                                        });
                                      },
                                    );
                                  },
                                ).toList(),
                        ),
                      ),
                      Container(
                        height: 60.0,
                        child: Icon(Icons.list),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            RaisedButton(
              child: Text('SUBMIT'),
              onPressed: selectedValues == null || selectedValues.length == 0
                  ? null
                  : submit,
            ),
          ],
        ),
      ),
    );
  }
}
