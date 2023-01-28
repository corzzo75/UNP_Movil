import 'package:flutter/material.dart';
import 'package:movil_flutter_trab/constans.dart';
import 'package:movil_flutter_trab/responsive.dart';
import '../../Components/background.dart';
import 'components/registrar_image.dart';
import 'components/registrar_form.dart';

class RegistrarScreen extends StatelessWidget {
  const RegistrarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Background(
      child: SingleChildScrollView(
        child: Responsive(
          mobile: const MobileRegistrarScreen(),
          desktop: Row(
            children: [
              const Expanded(
                child: RegistrarImage(),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    SizedBox(
                      width: 450,
                      child: RegistrarForm(),
                    ),
                    SizedBox(height: defaultPadding / 2),
                    // SocalSignUp()
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MobileRegistrarScreen extends StatelessWidget {
  const MobileRegistrarScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const RegistrarImage(),
        Row(
          children: const [
            Spacer(),
            Expanded(
              flex: 8,
              child: RegistrarForm(),
            ),
            Spacer(),
          ],
        ),
        // const SocalSignUp()
      ],
    );
  }
}
