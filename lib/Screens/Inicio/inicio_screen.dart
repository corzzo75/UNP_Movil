import 'package:flutter/material.dart';

import '../../components/background.dart';
import '../../responsive.dart';
import 'components/logear_registrar_btn.dart';
import 'components/inicio_image.dart';

class InicioScreen extends StatelessWidget {
  const InicioScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Background(
      child: SingleChildScrollView(
        child: SafeArea(
          child: Responsive(
            desktop: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Expanded(
                  child: InicioImage(),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      SizedBox(
                        width: 450,
                        child: LoguearRegistrarBtn(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            mobile: const MobileInicioScreen(),
          ),
        ),
      ),
    );
  }
}

class MobileInicioScreen extends StatelessWidget {
  const MobileInicioScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const InicioImage(),
        Row(
          children: const [
            Spacer(),
            Expanded(
              flex: 8,
              child: LoguearRegistrarBtn(),
            ),
            Spacer(),
          ],
        ),
      ],
    );
  }
}