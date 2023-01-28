import 'package:flutter/material.dart';

import '../../../constans.dart';
import '../../Login/login_screen.dart';
import '../../Registrar/registrar_screen.dart';

class LoguearRegistrarBtn extends StatelessWidget {
  const LoguearRegistrarBtn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Hero(
          tag: "login_btn",
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return LoginScreen();
                  },
                ),
              );
            },
            child: Text(
              "Iniciar Sesión".toUpperCase(),
            ),
          ),
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return RegistrarScreen();
                },
              ),
            );
          },
          style: ElevatedButton.styleFrom(
              primary: ConstPrimaryLightColor, elevation: 0),
          child: Text(
            "Registrarse".toUpperCase(),
            style: TextStyle(color: Colors.black),
          ),
        ),
      ],
    );
  }
}
