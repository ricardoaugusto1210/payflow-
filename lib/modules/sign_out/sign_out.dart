import 'dart:async';

import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';
import 'package:payflow/modules/login/login_controller.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';

class SignOut extends StatefulWidget {
  const SignOut({Key? key}) : super(key: key);

  @override
  _SignOutState createState() => _SignOutState();
}

class _SignOutState extends State<SignOut> {
  final controller = LoginController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: AnimatedCard(
          direction: AnimatedCardDirection.top,
          child: AlertDialog(
            title: Text('Sair do PayFlow?'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Cancelar',
                  style: TextStyles.buttonBoldHeading,
                ),
              ),
              TextButton(
                onPressed: () async {
                  await controller.googleSignOut(context);
                },
                child: Text(
                  'Sair',
                  style: TextStyles.buttonBoldPrimary,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
