import 'package:flutter/material.dart';

class MyDialog extends StatefulWidget {
  MyDialog({Key key}) : super(key: key);

  @override
  MyDialogState createState() => MyDialogState();
}

enum DialogAction { yes, no }

class MyDialogState extends State<MyDialog> {
  String inputValue = "";

  void alertResult(DialogAction action) {
    print("Tu seleccion es $action");
  }

  void showAlert(String value) {
    AlertDialog dialog = AlertDialog(
      content: Text(value),
      actions: <Widget>[
        FlatButton(
          child: Text("SI"),
          onPressed: () {
            alertResult(DialogAction.yes);
          },
        ),
        FlatButton(
          child: Text("NO"),
          onPressed: () {
            alertResult(DialogAction.no);
          },
        )
      ],
    );
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return dialog;
        });
  }

  void onChanged(String value) {
    setState(() {
      inputValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Demo Alert Dialog"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            TextField(
              //placeholder
              decoration: InputDecoration(hintText: "Ingrese el texto aqui"),
              onChanged: onChanged,
            ),
            RaisedButton(
                child: Text("Ver Alerta"),
                onPressed: () {
                  showAlert(inputValue);
                })
          ],
        ),
      ),
    );
  }
}
