import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:movil_flutter_trab/Screens/Registrar/components/alert_dialog.dart';

import '../../../Components/chech_ya_tienes_cuenta.dart';
import '../../../constans.dart';
import '../../Registrar/registrar_screen.dart';

late String emailTxt;
late String passTxt;

class LoginForm extends StatelessWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextField(
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            cursorColor: ConstPrimaryColor,
            onSubmitted: (text) {
              emailTxt = text;
            },
            decoration: const InputDecoration(
              hintText: "Tu correo",
              prefixIcon: Padding(
                padding: EdgeInsets.all(defaultPadding),
                child: Icon(Icons.person),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextField(
              textInputAction: TextInputAction.done,
              obscureText: true,
              cursorColor: ConstPrimaryColor,
              onSubmitted: (text) {
                passTxt = text;
              },
              decoration: const InputDecoration(
                hintText: "Tu contraseña",
                prefixIcon: Padding(
                  padding: EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.lock),
                ),
              ),
            ),
          ),
          const SizedBox(height: defaultPadding),
          Hero(
            tag: "login_btn",
            child: ElevatedButton(
              onPressed: () async {

                try {
                  await FirebaseAuth.instance
                      .signInWithEmailAndPassword(email: emailTxt, password: passTxt)
                      .then((value) => {
                        print("Usuario encontrado"),
                        showDialog(
                        context: context,
                        builder: (BuildContext context) => const AlertDialogRegistrar(
                        tittle: "Notificación",
                        description: "Bienvenido",
                        ),
                        ),
                      });
                }
                on FirebaseAuthException catch (e) {
                  if (e.code == 'user-not-found') {
                    print('Usuario no existe');
                    showDialog(
                      context: context,
                      builder: (BuildContext context) => const AlertDialogRegistrar(
                        tittle: "Alerta",
                        description: "El correo ingresado no existe.",
                      ),
                    );
                  } else if (e.code == "unknown") {
                    print('Debe rellenar todos los campos del formulario.');
                    showDialog(
                      context: context,
                      builder: (BuildContext context) => const AlertDialogRegistrar(
                        tittle: "Alerta",
                        description: 'Rellene todos los campos del formulario.',
                      ),
                    );
                  }
                  else if (e.code == "wrong-password") {
                    print('Contraseña incorrecta.');
                    showDialog(
                      context: context,
                      builder: (BuildContext context) => const AlertDialogRegistrar(
                        tittle: "Alerta",
                        description: 'Contraseña incorrecta.',
                      ),
                    );
                  }
                }
                catch (e) {
                  print('Error: $e');
                }

              },
              child: Text(
                "Iniciar sesión".toUpperCase(),
              ),
            ),
          ),
          const SizedBox(height: defaultPadding),
          CheckYaTienesCuenta(
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const RegistrarScreen();
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
