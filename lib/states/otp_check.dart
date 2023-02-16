// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';

import 'package:shinoprojdemo/states/main_home.dart';

class OtpCheck extends StatefulWidget {
  const OtpCheck({
    Key? key,
    required this.verificationId,
    required this.phoneNumber,
  }) : super(key: key);

  final String verificationId;
  final String phoneNumber;

  @override
  State<OtpCheck> createState() => _OtpCheckState();
}

class _OtpCheckState extends State<OtpCheck> {
  OtpFieldController otpFieldController = OtpFieldController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OTP check'),
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 100),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OTPTextField(
              controller: otpFieldController,
              length: 6,
              fieldWidth: 40,
              width: 250,
              onCompleted: (value) async {
                String otp = value;
                print('otp ---> $otp');

                await FirebaseAuth.instance
                    .signInWithCredential(PhoneAuthProvider.credential(
                        verificationId: widget.verificationId, smsCode: otp))
                    .then((value) {
                  print('##15feb Authen Success');
                  Get.offAll(MainHome(phoneNumber: widget.phoneNumber,));
                }).catchError((onError) {
                  print(
                      '##15feb code --> ${onError.code}, message --> ${onError.message}');
                  Get.snackbar(onError.code, onError.message);
                  otpFieldController.clear();
                });
              },
              fieldStyle: FieldStyle.box,
              otpFieldStyle:
                  OtpFieldStyle(backgroundColor: Colors.grey.shade300),
            ),
          ],
        ),
      ),
    );
  }
}
