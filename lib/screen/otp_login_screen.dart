
import 'package:auth_project/colour/colors.dart';
import 'package:auth_project/component/base_scaffold_widget.dart';
import 'package:auth_project/component/common.dart';
import 'package:country_picker/country_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nb_utils/nb_utils.dart';



class OTPLoginScreen extends StatefulWidget {
  const OTPLoginScreen({Key? key}) : super(key: key);

  @override
  State<OTPLoginScreen> createState() => _OTPLoginScreenState();
}

class _OTPLoginScreenState extends State<OTPLoginScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController numberController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  FocusNode _mobileNumberFocus = FocusNode();

  /// **Directly defining the default country**



  Country selectedCountry = Country(
    phoneCode: '91',
    countryCode: 'IN',
    e164Sc: 91,
    geographic: true,
    level: 1,
    name: 'India',
    example: '9123456789',
    displayName: 'India (IN) [+91]',
    displayNameNoCountryCode: 'India (IN)',
    e164Key: '91-IN-0',
    fullExampleWithPlusSign: '+919123456789',
  );



  bool isCodeSent = false;
  String? verificationId;
  FirebaseAuth _auth = FirebaseAuth.instance;


  Future<void> sendOTP() async {
    String phoneNumber = "+${selectedCountry.phoneCode}${numberController.text.trim()}";

    if (numberController.text.trim().isEmpty) {
      toast("⚠️ Please enter your mobile number.");
      return;
    }

    debugPrint("Entered Phone Number: $phoneNumber");

    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        timeout: const Duration(seconds: 60),
        verificationCompleted: (PhoneAuthCredential credential) async {
          await _auth.signInWithCredential(credential);
          toast("✅ Phone number automatically verified!");
        },
        verificationFailed: (FirebaseAuthException e) {
          toast("❌ Verification Failed: ${e.message}");
        },
        codeSent: (String verificationId, int? resendToken) {
          setState(() {
            this.verificationId = verificationId;
            isCodeSent = true;
          });
          toast("📩 OTP Sent to $phoneNumber");
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          this.verificationId = verificationId;
        },
      );
    } catch (e) {
      toast("⚠️ Error sending OTP: $e");
    }
  }

  Future<void> verifyOTP(String smsCode) async {
    if (verificationId == null) {
      toast("⚠️ Verification ID is null, please request OTP again.");
      return;
    }

    if (smsCode.isEmpty || smsCode.length < 6) {
      toast("⚠️ Please enter a valid 6-digit OTP.");
      return;
    }

    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId!,
        smsCode: smsCode,
      );

      UserCredential userCredential = await _auth.signInWithCredential(credential);
      if (userCredential.user != null) {
        toast("✅ Phone Verification Successful! Logged in as ${userCredential.user!.phoneNumber}");
        debugPrint("User Logged In: ${userCredential.user!.phoneNumber}");
      }
    } catch (e) {
      toast("❌ Invalid OTP: $e");
    }
  }




  // Future<void> verifyOTP(String smsCode) async {
  //   if (verificationId != null) {
  //     try {
  //       PhoneAuthCredential credential = PhoneAuthProvider.credential(
  //         verificationId: verificationId!,
  //         smsCode: smsCode,
  //       );
  //
  //       UserCredential userCredential = await _auth.signInWithCredential(credential);
  //       if (userCredential.user != null) {
  //         toast("Phone Verification Successful! Logged in as ${userCredential.user!.phoneNumber}");
  //       }
  //     } catch (e) {
  //       toast("Invalid OTP: $e");
  //     }
  //   } else {
  //     toast("Verification ID is null, try sending OTP again.");
  //   }
  // }
  @override
  void initState() {
    super.initState();
  }

  Future<void> changeCountry() async {
    showCountryPicker(
      context: context,
      countryListTheme: CountryListThemeData(
        textStyle: secondaryTextStyle(color: textSecondaryColorGlobal),
        searchTextStyle: primaryTextStyle(),
        inputDecoration: InputDecoration(
          labelText: 'Search',
          prefixIcon: const Icon(Icons.search),
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

  Widget _buildMainWidget() {
    if (isCodeSent) {
      return Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            32.height,
            OTPTextField(

              pinLength: 6,
              textStyle: primaryTextStyle(),
              decoration: inputDecoration(context).copyWith(
                counter: Offstage(),
              ),
              onChanged: (pin) {
                otpController.text = pin;
              },
            ).fit(),
            30.height,
            AppButton(
              onTap: () {

                verifyOTP(otpController.text);

                print(otpController.text);
              },
              text: 'Confirm',
              color: primaryColor,
              textColor: Colors.white,
              width: context.width(),
            ),
          ],
        ),
      );
    } else {
      return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Form(
            key: formKey,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 48.0,
                  decoration: BoxDecoration(
                    color: context.cardColor,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Center(
                    child: Row(
                      children: [
                        Text(
                          "+${selectedCountry.phoneCode}",
                          style: primaryTextStyle(size: 12),
                        ),
                        Icon(
                          Icons.arrow_drop_down,
                          color: primaryColor,
                        )
                      ],
                    ).paddingOnly(left: 8),
                  ),
                ).onTap(() => changeCountry()).fit(fit: BoxFit.cover),
                10.width,
                AppTextField(
                  controller: numberController,
                  focus: _mobileNumberFocus,
                  textFieldType: TextFieldType.PHONE,
                  decoration: inputDecoration(context).copyWith(
                    hintText: 'Example: ${selectedCountry.example}',
                    hintStyle: secondaryTextStyle(),
                  ),
                  autoFocus: true,
                ).expand(),
              ],
            ),
          ),
          30.height,
          AppButton(
            onTap: () {
              setState(() {
                isCodeSent = true;
                sendOTP();
              });
            },
            text: 'Send OTP',
            color: primaryColor,
            textColor: Colors.white,
            width: context.width(),
          ),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => hideKeyboard(context),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(isCodeSent ? 'Confirm OTP' : 'Enter Phone Number', style: boldTextStyle(size: 20)),
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: Navigator.of(context).canPop() ? BackWidget(iconColor: context.iconColor) : null,
          scrolledUnderElevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle(statusBarIconBrightness: Brightness.dark, statusBarColor: context.scaffoldBackgroundColor),
        ),
        body: Body(
          child: Container(
            padding: EdgeInsets.all(16),
            child: _buildMainWidget(),
          ),
        ),
      ),
    );
  }
}
