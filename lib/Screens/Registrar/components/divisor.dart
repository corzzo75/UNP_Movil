import 'package:flutter/material.dart';
import 'package:movil_flutter_trab/constans.dart';

class Divisor extends StatelessWidget {
  const Divisor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: size.height * 0.02),
      width: size.width * 0.8,
      child: Row(
        children: <Widget>[
          buildDivisor(),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              "O",
              style: TextStyle(
                color: ConstPrimaryColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          buildDivisor(),
        ],
      ),
    );
  }

  Expanded buildDivisor() {
    return const Expanded(
      child: Divider(
        color: Color(0xFFD9D9D9),
        height: 1.5,
      ),
    );
  }
}
