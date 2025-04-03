import 'package:auth_project/colour/colors.dart';
import 'package:auth_project/component/base_scaffold_widget.dart';
import 'package:auth_project/component/common.dart';
import 'package:auth_project/component/selected_item_widget.dart';
import 'package:auth_project/screen/sign_in_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:country_picker/country_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:nb_utils/nb_utils.dart';


class SignUpScreen extends StatefulWidget {
  SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Country selectedCountry = Country.parse("US");

  TextEditingController fNameCont = TextEditingController();
  TextEditingController lNameCont = TextEditingController();
  TextEditingController emailCont = TextEditingController();
  TextEditingController userNameCont = TextEditingController();
  TextEditingController mobileCont = TextEditingController();
  TextEditingController passwordCont = TextEditingController();

  FocusNode fNameFocus = FocusNode();
  FocusNode lNameFocus = FocusNode();
  FocusNode emailFocus = FocusNode();
  FocusNode userNameFocus = FocusNode();
  FocusNode mobileFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();

  bool isAcceptedTc = false;
  bool isFirstTimeValidation = true;

  @override
  void initState() {
    super.initState();
  }

  Future<void> changeCountry() async {
    showCountryPicker(
      context: context,
      countryListTheme: CountryListThemeData(
        textStyle: secondaryTextStyle(color: Colors.black54),
        searchTextStyle: primaryTextStyle(),
        inputDecoration: InputDecoration(
          labelText: "Search",
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(),
        ),
      ),
      showPhoneCode: true,
      onSelect: (Country country) {
        setState(() {
          selectedCountry = country;
        });
      },
    );
  }


  Future<void> signUpUser() async {
    try {
      // Check if the mobile number is already used
      bool mobileExists = await checkIfMobileExists(mobileCont.text.trim());
      if (mobileExists) {
        toast("Mobile number is already in use.");
        return;
      }

      // Register user with Firebase Authentication
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
          email: emailCont.text.trim(),
          password: passwordCont.text.trim());

      // Get the user ID
      String uid = userCredential.user!.uid;

      // Save user data to Firestore
      await saveUserData(uid);

      toast( "Sign up successful!");

      // Navigate to Sign In screen
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => SignInScreen()));

    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        toast("Email is already in use.");
      } else if (e.code == 'weak-password') {
        toast( "Password is too weak.");
      } else {
        toast(e.message.toString());
      }
    } catch (e) {
      toast( "An error occurred: $e");
    }
  }


  Future<void> saveUserData(String uid) async {
    await FirebaseFirestore.instance.collection("users").doc(uid).set({
      "uid": uid,
      "firstName": fNameCont.text.trim(),
      "lastName": lNameCont.text.trim(),
      "username": userNameCont.text.trim(),
      "email": emailCont.text.trim(),
      "mobile": mobileCont.text.trim(),
      "countryCode": selectedCountry.phoneCode,
      "createdAt": FieldValue.serverTimestamp(),
    });
  }

  Future<bool> checkIfMobileExists(String mobile) async {
    final result = await FirebaseFirestore.instance
        .collection("users")
        .where("mobile", isEqualTo: mobile)
        .get();

    return result.docs.isNotEmpty;
  }


  Widget _buildTopWidget() {
    return Column(
      children: [
        50.height,
        CircleAvatar(
          radius: 40,
          backgroundColor: Colors.blue,
          child: Icon(Icons.person, color: Colors.white, size: 40),
        ),
        16.height,
        Text("Hello User", style: boldTextStyle(size: 22)).center(),
        16.height,
        Text("Sign up to continue", style: secondaryTextStyle(size: 14), textAlign: TextAlign.center).center().paddingSymmetric(horizontal: 32),
      ],
    );
  }

  Widget _buildFormWidget() {
    return Column(
      children: [
        32.height,
        AppTextField(
          textFieldType: TextFieldType.NAME,
          controller: fNameCont,
          focus: fNameFocus,
          nextFocus: lNameFocus,
          errorThisFieldRequired: "First Name is required",
          decoration: inputDecoration(context, labelText: "First Name"),
        ),
        16.height,
        AppTextField(
          textFieldType: TextFieldType.NAME,
          controller: lNameCont,
          focus: lNameFocus,
          nextFocus: userNameFocus,
          errorThisFieldRequired: "Last Name is required",
          decoration: inputDecoration(context, labelText: "Last Name"),
        ),
        16.height,
        AppTextField(
          textFieldType: TextFieldType.USERNAME,
          controller: userNameCont,
          focus: userNameFocus,
          nextFocus: emailFocus,
          errorThisFieldRequired: "Username is required",
          decoration: inputDecoration(context, labelText: "Username"),
        ),
        16.height,
        AppTextField(
          textFieldType: TextFieldType.EMAIL_ENHANCED,
          controller: emailCont,
          focus: emailFocus,
          errorThisFieldRequired: "Email is required",
          nextFocus: mobileFocus,
          decoration: inputDecoration(context, labelText: "Email"),
        ),
        16.height,
        Row(
          children: [
            Container(
              height: 48.0,
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(12.0),
              ),
              padding: EdgeInsets.symmetric(horizontal: 8),
              // decoration: BoxDecoration(color: Colors.grey[200], borderRadius: BorderRadius.circular(12)),
              child: Row(
                // children: [
                //   Text("+${selectedCountry.phoneCode}", style: primaryTextStyle(size: 12)),
                //   Icon(Icons.arrow_drop_down, color: Colors.grey),
                // ],
                children: [
                  Text(
                    "+${selectedCountry.phoneCode}",
                    style: primaryTextStyle(size: 12),
                  ),
                  Icon(
                    Icons.arrow_drop_down,
                    color: textSecondaryColorGlobal,
                  ),
                ],

              ),

            ).onTap(() => changeCountry()),
            10.width,
            AppTextField(
              textFieldType: TextFieldType.PHONE,
              controller: mobileCont,
              focus: mobileFocus,
              errorThisFieldRequired: "Contact Number is required",
              nextFocus: passwordFocus,
              decoration: inputDecoration(context, labelText: "Contact Number"),
              // maxLength: 15,
              suffix: Image.asset('assets/icon/ic_calling.png', height: 10, width: 10).paddingAll(14),

            ).expand(),

          ],
        ),
        16.height,
        AppTextField(
          textFieldType: TextFieldType.PASSWORD,
          controller: passwordCont,
          focus: passwordFocus,
          obscureText: true,
          errorThisFieldRequired: "Password is required",
          decoration: inputDecoration(context, labelText: "Password"),
        ),
        20.height,
        _buildTcAcceptWidget(),
        25.height,
        AppButton(
          text: "Sign Up",
          color: primaryColor,
          textColor: Colors.white,
          width: context.width() - context.navigationBarHeight,
          onTap: () async {
            if (formKey.currentState!.validate()) {
              if (!isAcceptedTc) {
                toast("Please accept Terms and Conditions");
                return;
              }

              await signUpUser();
            }
          },
        ),
      ],
    );
  }

  Widget _buildTcAcceptWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        // Checkbox(
        //   value: isAcceptedTc,
        //   onChanged: (value) {
        //     setState(() {
        //       isAcceptedTc = value!;
        //     });
        //   },
        // ),

        SelectedItemWidget(isSelected: isAcceptedTc).onTap(() async {
          isAcceptedTc = !isAcceptedTc;
          setState(() {});
        }),
        16.width,
        Expanded(
          child: RichText(
            text: TextSpan(
              style: secondaryTextStyle(),
              children: [
                TextSpan(text: "I agree to the "),
                TextSpan(
                  text: "Terms of Service",
                  style: boldTextStyle(color: Colors.blue,size: 15),
                  recognizer: TapGestureRecognizer()..onTap = () => toast("Terms of Service"),
                ),
                TextSpan(text: " & "),
                TextSpan(
                  text: "Privacy Policy",
                  style: boldTextStyle(color: Colors.blue,size: 15),
                  recognizer: TapGestureRecognizer()..onTap = () => toast("Privacy Policy"),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }



  Widget _buildFooterWidget(BuildContext context) {
    return Column(
      children: [
        16.height,
        RichText(
          text: TextSpan(
            style: secondaryTextStyle(),
            children: [
              TextSpan(text: "Already have an account? "),
              TextSpan(
                text: "Sign In",
                style: boldTextStyle(color: Colors.blue),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignInScreen()), // Navigate to Sign In
                    );
                  },
              ),
            ],
          ),
        ),
        30.height,
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
          child: Form(
            key: formKey,
            child: Column(
              children: [
                _buildTopWidget(),
                _buildFormWidget(),
                _buildFooterWidget(context),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
