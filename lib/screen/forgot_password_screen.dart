import 'package:auth_project/colour/colors.dart';
import 'package:auth_project/component/common.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';





class ForgotPasswordScreen extends StatefulWidget {
  @override
  ForgotPasswordScreenState createState() => ForgotPasswordScreenState();
}

class ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  TextEditingController emailCont = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();



  Future<void> sendPasswordResetEmail() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: emailCont.text.trim());

      toast("Password reset link sent! Check your email.");
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        toast("No account found with this email.");
      } else {
        toast(e.message.toString());
      }
    } catch (e) {
      toast("An error occurred: $e");
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      key: formKey,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// **Header Section**
            Container(
              padding: EdgeInsets.all(16),
              width: context.width(),
              decoration: boxDecorationDefault(
                color: context.primaryColor,
                borderRadius: radiusOnly(topRight: defaultRadius, topLeft: defaultRadius),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Forgot Password", style: boldTextStyle(color: Colors.white)),
                  IconButton(
                    onPressed: () {
                      finish(context);
                    },
                    icon: Icon(Icons.clear, color: Colors.white, size: 20),
                  )
                ],
              ),
            ),

            /// **Form Section**
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Email Address", style: boldTextStyle()),
                6.height,
                Text("Enter your registered email to receive a password reset link.", style: secondaryTextStyle()),
                24.height,



                /// **Email Input Field**

                AppTextField(
                  textFieldType: TextFieldType.EMAIL_ENHANCED,
                  controller: emailCont,
                  autoFocus: true,
                  decoration: inputDecoration(context, labelText: "Enter Email"),
                ),



                16.height,

                /// **Reset Password Button**
                AppButton(
                  text: "Reset Password",
                  color: primaryColor,
                  textColor: Colors.white,
                  width: context.width() - context.navigationBarHeight,
                  onTap: () async {
                    // toast("Reset link sent (UI Only)");
                    if (formKey.currentState!.validate()) {
                      await sendPasswordResetEmail();
                    }

                  },
                ),
              ],
            ).paddingAll(16),
          ],
        ),
      ),
    );
  }
}
