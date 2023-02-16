import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shinoprojdemo/states/main_home.dart';
import 'package:shinoprojdemo/states/otp_check.dart';
import 'package:shinoprojdemo/states/phone_number.dart';

var getPages = <GetPage<dynamic>>[
  GetPage(
    name: '/phoneNumber',
    page: () => const PhoneNumber(),
  ),
 
];

String firteState = '/phoneNumber';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: getPages,
      initialRoute: firteState,
    );
  }
}
