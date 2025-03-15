
import 'package:flutter/material.dart';

void showCustomPopup(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.white,
        title: Text('Page Non Disponible'),
        content: Text('Cette page ne sera disponible que dans les prochaines mises à jour.'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Ferme le popup
            },
            child: Text('OK', style: TextStyle(color: Colors.black),),
          ),
        ],
      );
    },
  );
}
