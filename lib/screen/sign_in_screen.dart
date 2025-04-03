


import 'package:auth_project/colour/colors.dart';
import 'package:auth_project/component/base_scaffold_widget.dart';
import 'package:auth_project/component/common.dart';
import 'package:auth_project/screen/sign_up_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:nb_utils/nb_utils.dart';


import 'forgot_password_screen.dart';
import 'otp_login_screen.dart';



class SignInScreen extends StatefulWidget {
  final bool returnExpected;

  SignInScreen({this.returnExpected = false});

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController emailCont = TextEditingController();
  TextEditingController passwordCont = TextEditingController();

  FocusNode emailFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();

  bool isRemember = false;




  Future<void> signInWithEmail() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      try {
        UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailCont.text.trim(),
          password: passwordCont.text.trim(),
        );
        toast("Login successful");

        // Handle successful login (Navigate to Home screen or Dashboard)
        // Example: Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => HomeScreen()));
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => SignUpScreen()), // Replace with your destination screen
        );
      }on FirebaseAuthException catch (e) {
        String errorMessage = "Login failed"; // Default message

        switch (e.code) {
          case 'user-not-found':
            errorMessage = "No user found for this email.";
            break;
          case 'wrong-password':
            errorMessage = "Incorrect password.";
            break;
          case 'invalid-email':
            errorMessage = "Invalid email format.";
            break;
          case 'user-disabled':
            errorMessage = "This user account has been disabled.";
            break;
          case 'too-many-requests':
            errorMessage = "Too many failed attempts. Try again later.";
            break;
          case 'operation-not-allowed':
            errorMessage = "Email/password login is not enabled.";
            break;
          default:
            errorMessage = "${e.message}";
        }

        toast(errorMessage);
      }
    }
  }


  Future<User?> signInWithGoogle() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      if (googleUser == null) {
        return null; // User canceled sign-in
      }

      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      // Create a new credential
      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Sign in to Firebase
      UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => SignUpScreen()), // Replace with your destination screen
      );
      return userCredential.user;
    } catch (e) {
      print("Error during Google Sign-In: $e");
      return null;
    }
  }

  @override
  void dispose() {
    emailCont.dispose();
    passwordCont.dispose();
    emailFocus.dispose();
    passwordFocus.dispose();
    super.dispose();
  }

  Widget _buildTopWidget() {
    return Column(
      children: [
        Text("Welcome Back!", style: boldTextStyle(size: 20)).center(),
        16.height,
        Text("Sign in to continue", style: primaryTextStyle(size: 14), textAlign: TextAlign.center)
            .paddingSymmetric(horizontal: 32),
        32.height,
      ],
    );
  }

  Widget _buildRememberWidget() {
    return Column(
      children: [
        8.height,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Checkbox(
                  value: isRemember,
                  onChanged: (val) {
                    setState(() => isRemember = val!);
                  },
                  activeColor: primaryColor,
                ),
                Text("Remember Me", style: secondaryTextStyle()),
              ],
            ),
            TextButton(
              onPressed: () {
                // Forgot Password Logic
                showInDialog(
                  context,
                  contentPadding: EdgeInsets.zero,
                  dialogAnimation: DialogAnimation.SLIDE_TOP_BOTTOM,
                  builder: (_) => ForgotPasswordScreen(),
                );
              },
              child: Text(
                "Forgot Password?",
                style: boldTextStyle(color: primaryColor, fontStyle: FontStyle.italic),
                textAlign: TextAlign.right,
              ),
            ),
          ],
        ),
        24.height,
        AppButton(
          text: "Sign In",
          color: primaryColor,
          textColor: Colors.white,
          width: context.width(),
          onTap: () {
            setState(() {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
                signInWithEmail();
                // toast("Login successful");
              }
            });
          },
        ),
        16.height,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Don't have an account?", style: secondaryTextStyle()),
            TextButton(
              onPressed: () {
                // SignUpScreen().launch(context);
                hideKeyboard(context);
                SignUpScreen().launch(context);
              },
              child: Text(
                "Sign Up",
                style: boldTextStyle(color: primaryColor, decoration: TextDecoration.underline, fontStyle: FontStyle.italic),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSocialWidget() {
    return Column(
      children: [
        20.height,
        Row(
          children: [
            Expanded(child: Divider(color: Colors.grey, thickness: 1)),
            16.width,
            Text("Or continue with", style: secondaryTextStyle()),
            16.width,
            Expanded(child: Divider(color: Colors.grey, thickness: 1)),
          ],
        ),
        24.height,
        AppButton(

          text: "",
          color: Colors.white,
          shapeBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10), // Custom border radius
          ),
          width: context.width(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Image.asset('assets/google.png', height: 24, width: 24), // Ensure this asset is available
              GoogleLogoWidget(size: 16),
              16.width,
              Text("Sign in with Google", style: boldTextStyle(size: 14)),
            ],
          ),
          onTap: ()  async {
            // toast("Google Sign-In tapped");
            User? user = await signInWithGoogle();
            if (user != null) {
              toast("Signed in as ${user.displayName}");
            } else {
              toast("Google Sign-In failed");
            }
          },
        ),
        16.height,
        AppButton(
          shapeBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10), // Custom border radius
          ),
          text: "",
          color: Colors.white,
          width: context.width() - context.navigationBarHeight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.phone, size: 24, color: primaryColor),
              16.width,
              Text("Sign in with OTP", style: boldTextStyle(size: 14)),
            ],
          ),
          onTap: () {
            // toast("OTP Sign-In tapped");

            hideKeyboard(context);
            OTPLoginScreen().launch(context);

          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => hideKeyboard(context),
      child: Scaffold(
        backgroundColor: Colors.white,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: Container(
              margin: EdgeInsets.only(left: 6),
              decoration: BoxDecoration(
                color:Colors.transparent,
                shape: BoxShape.circle,
              ),
              child: BackWidget(iconColor: Colors.black)),
          scrolledUnderElevation: 0,

        ),

        body: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              100.height,
              // Align(
              //   alignment: Alignment.topLeft,
              //   child: IconButton(
              //     icon: Icon(Icons.arrow_back, color: Colors.black),
              //     onPressed: () => Navigator.pop(context),
              //   ),
              // ),
              16.height,
              _buildTopWidget(),
              Form(
                key: formKey,
                autovalidateMode: AutovalidateMode.disabled,
                child: Column(
                  children: [
                    AppTextField(
                      textFieldType: TextFieldType.EMAIL_ENHANCED,
                      controller: emailCont,
                      focus: emailFocus,
                      nextFocus: passwordFocus,
                      decoration: inputDecoration(context, labelText: "Email"),
                      suffix: Icon(Icons.email).paddingAll(14),
                      autoFillHints: [AutofillHints.email],
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return "Email is required";
                        } else if (!val.contains("@")) {
                          return "Enter a valid email";
                        }
                        return null;
                      },
                    ),
                    16.height,
                    AppTextField(
                      textFieldType: TextFieldType.PASSWORD,
                      controller: passwordCont,
                      focus: passwordFocus,
                      obscureText: true,
                      decoration: inputDecoration(context, labelText: "Password"),
                      suffixPasswordVisibleWidget: Icon(Icons.visibility).paddingAll(14),
                      suffixPasswordInvisibleWidget: Icon(Icons.visibility_off).paddingAll(14),
                      autoFillHints: [AutofillHints.password],
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return "Password is required";
                        } else if (val.length < 6 || val.length > 12) {
                          return "Password should be 6-12 characters long";
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
              _buildRememberWidget(),
              _buildSocialWidget(),
              30.height,
            ],
          ),
        ),
      ),
    );
  }
}
