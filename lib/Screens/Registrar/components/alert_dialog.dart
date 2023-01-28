import 'package:flutter/material.dart';

class AlertDialogRegistrar extends StatelessWidget {
  final String tittle;
  final String description;

  const AlertDialogRegistrar({
    Key? key,
    required this.tittle,
    required this.description,
  }) :  super (key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(tittle),
      content: Text(description),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context, 'OK'),
          child: const Text('Aceptar'),
        ),
      ],
    );
  }
}
