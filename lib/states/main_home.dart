// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:shinoprojdemo/widgets/widget_icon_button.dart';

class MainHome extends StatelessWidget {
  const MainHome({
    Key? key,
    required this.phoneNumber,
  }) : super(key: key);

  final String phoneNumber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('phoneNumber --> $phoneNumber'),
        actions: [
          WidgetIconButton(
            iconData: Icons.exit_to_app,
            pressFunc: () async {
              await FirebaseAuth.instance.signOut().then((value) {
                Get.offAllNamed('/phoneNumber');
                Get.snackbar('Sign Out', 'Sign Out Success');
              });
            },
          )
        ],
      ),
    );
  }
}
