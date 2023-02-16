import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:shinoprojdemo/states/otp_check.dart';
import 'package:shinoprojdemo/utility/app_service.dart';
import 'package:shinoprojdemo/widgets/widget_button.dart';
import 'package:shinoprojdemo/widgets/widget_form_phone.dart';

class PhoneNumber extends StatefulWidget {
  const PhoneNumber({super.key});

  @override
  State<PhoneNumber> createState() => _PhoneNumberState();
}

class _PhoneNumberState extends State<PhoneNumber> {
  // String phoneNumber = '+66 81 999 9999';
  String? phoneNumber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Phone Number'),
      ),
      body: Column(
        children: [
          WidgetFormPhone(
            inputFormatters: [MaskTextInputFormatter(mask: '### ### ####')],
            changeFunc: (p0) {
              phoneNumber = p0.trim();
            },
          ),
          WidgetButton(
            label: 'Send',
            pressFunc: () {
              if (phoneNumber?.isEmpty ?? true) {
                Get.snackbar('Empty ?', 'Please Fill Phone Number');
              } else if (phoneNumber!.length != 12) {
                Get.snackbar(
                    'Number UnComplete', 'Please Phone Complete xxx XXX XXXX');
              } else {
                phoneNumber = phoneNumber!.substring(1);
                phoneNumber = '+66 $phoneNumber';

                print('##15feb phoneNumber --> $phoneNumber');
                AppService().processSendSMS(phoneNumber: phoneNumber!);
              }
            },
          ),
        ],
      ),
    );
  }
}
