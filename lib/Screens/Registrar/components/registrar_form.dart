import 'package:flutter/material.dart';
import 'package:movil_flutter_trab/Screens/Registrar/components/alert_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../Components/chech_ya_tienes_cuenta.dart';
import '../../../constans.dart';
import '../../Login/login_screen.dart';


late String _email;
late String _pass;

class RegistrarForm extends StatelessWidget {


  const RegistrarForm({
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
              _email = text;
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
                _pass = text;
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
          const SizedBox(height: defaultPadding / 2),
          ElevatedButton(
            onPressed: () async {

              try {
                await FirebaseAuth.instance
                    .createUserWithEmailAndPassword(email: _email, password: _pass)
                    .then((value) => {
                      showDialog (
                        context: context,
                        builder: (BuildContext context) => const AlertDialogRegistrar(
                          tittle: "Notificación",
                          description: "Usuario registrado con éxito.",
                        ),
                      ).then((value) => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return const LoginScreen();
                            },
                          ),
                        ),
                      }),
                    });
              }
              on FirebaseAuthException catch (e) {
                if (e.code == 'weak-password') {
                  print('La contraseña es muy débil');
                  showDialog(
                    context: context,
                    builder: (BuildContext context) => const AlertDialogRegistrar(
                      tittle: "Alerta",
                      description: "La contraseña ingresada es muy débil.",
                    ),
                  );
                } else if (e.code == 'email-already-in-use') {
                  print('Ya existe una cuenta registrada con el correo ingresado');
                  showDialog(
                      context: context,
                      builder: (BuildContext context) => const AlertDialogRegistrar(
                        tittle: "Alerta",
                        description: "Ya existe una cuenta con el correo ingresado.",
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
              }
              catch (e) {
                print("Error: $e");
              }

            },
            child: Text("Registrar".toUpperCase()),
          ),
          const SizedBox(height: defaultPadding),
          CheckYaTienesCuenta(
            login: false,
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const LoginScreen();
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