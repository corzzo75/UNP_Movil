import 'package:flutter/material.dart';
import 'package:movil_flutter_trab/constans.dart';

class CheckYaTienesCuenta extends StatelessWidget {
  final bool login;
  final Function? press;
  const CheckYaTienesCuenta({
    Key? key,
    this.login = true,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          login ? "No tienes una cuenta ? " : "Ya tienes una cuenta ? ",
          style: const TextStyle(color: ConstPrimaryColor),
        ),
        GestureDetector(
          onTap: press as void Function()?,
          child: Text(
            login ? "Registrarse" : "Iniciar sesión",
            style: const TextStyle(
              color: ConstPrimaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}
