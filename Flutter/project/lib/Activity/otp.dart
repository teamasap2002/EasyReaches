import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:otp_timer_button/otp_timer_button.dart';
import 'package:project/Activity/Home.dart';
import 'package:project/navigation_menu.dart';
import 'package:project/widgets/uihelper.dart';

class OTPScreen extends StatefulWidget {
  String verificationId;
  String phone;
  OTPScreen({super.key, required this.verificationId, required this.phone});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  int resentToken = 0;
  TextEditingController otpController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          margin: const EdgeInsets.all(20).r,
          padding: const EdgeInsets.all(10).r,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "OTP sent to Mobile Number",
                style: TextStyle(fontSize: 25.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 30.h,
              ),
              Text(
                "Enter OTP to verify your Mobile Number",
                style: TextStyle(
                    color: const Color.fromRGBO(108, 99, 255, 1),
                    fontSize: 25.sp,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 50.h,
              ),
              UiHelper.CustomTextField(otpController, "Enter Verification Code",
                  Icons.lock, true, const Color.fromRGBO(108, 99, 255, 1)),
              SizedBox(
                height: 50.h,
              ),
              UiHelper.CustomButton(() async {
                try {
                  PhoneAuthCredential credential =
                      await PhoneAuthProvider.credential(
                          verificationId: widget.verificationId,
                          smsCode: otpController.text.toString());
                  FirebaseAuth.instance
                      .signInWithCredential(credential)
                      .then((value) {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const NavigationMenu()));
                  });
                } catch (e) {
                  SnackBar(content: Text("Failed SignIn"));
                }
              }, "Verify", const Color.fromRGBO(108, 99, 255, 1), Colors.white),
              SizedBox(
                height: 10.h,
              ),
              Text(
                "Didn't recieve any code?",
                style: TextStyle(fontSize: 20.sp, color: Colors.grey),
              ),
              OtpTimerButton(
                  height: 40.h,
                  onPressed: () async {
                    FirebaseAuth.instance.verifyPhoneNumber(
                      verificationCompleted:
                          (PhoneAuthCredential credential) {},
                      verificationFailed: (FirebaseException e) {},
                      codeSent:
                          (String verificationId, int? forceResendingToken) {
                        verificationId = verificationId;
                        resentToken = forceResendingToken!;
                      },
                      codeAutoRetrievalTimeout: (String verificationId) {},
                      phoneNumber: widget.phone.toString(),
                    );
                  },
                  text: Text("Resend OTP ", style: TextStyle(fontSize: 20.sp)),
                  buttonType: ButtonType.text_button,
                  backgroundColor: const Color.fromRGBO(108, 99, 255, 1),
                  duration: 45),
            ],
          ),
        ),
      ),
    );
  }
}
