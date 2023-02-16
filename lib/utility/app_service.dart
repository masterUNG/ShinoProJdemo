import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:shinoprojdemo/states/otp_check.dart';

class AppService {
  Future<void> processSendSMS({required String phoneNumber}) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      timeout: const Duration(seconds: 90),
      verificationCompleted: (phoneAuthCredential) {},
      verificationFailed: (error) {},
      codeSent: (verificationId, forceResendingToken) {
        print('##15feb verificationId ---> $verificationId');
        Get.to(OtpCheck(verificationId: verificationId, phoneNumber: phoneNumber,));
      },
      codeAutoRetrievalTimeout: (verificationId) {
        print('##15feb Time Out');
        Get.back();
        Get.snackbar('Time Out', 'Please Try Again Time Out');
      },
    );
  }
}
