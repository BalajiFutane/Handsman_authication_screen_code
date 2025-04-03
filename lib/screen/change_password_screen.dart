

import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../colour/colors.dart';
import '../component/base_scaffold_widget.dart';
import '../component/common.dart';



class ChangePasswordScreen extends StatefulWidget {
  @override
  ChangePasswordScreenState createState() => ChangePasswordScreenState();
}

class ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController oldPasswordCont = TextEditingController();
  TextEditingController newPasswordCont = TextEditingController();
  TextEditingController reenterPasswordCont = TextEditingController();

  FocusNode oldPasswordFocus = FocusNode();
  FocusNode newPasswordFocus = FocusNode();
  FocusNode reenterPasswordFocus = FocusNode();

  @override
  void dispose() {
    oldPasswordCont.dispose();
    newPasswordCont.dispose();
    reenterPasswordCont.dispose();
    oldPasswordFocus.dispose();
    newPasswordFocus.dispose();
    reenterPasswordFocus.dispose();
    super.dispose();
  }

  void validateAndProceed() {
    if (formKey.currentState!.validate()) {
      toast("Password changed successfully");
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appnavcolor: primaryColor,
      appBarTitle: "Change Password",
      child: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Enter your new password below", style: secondaryTextStyle()),
              24.height,
              AppTextField(
                textFieldType: TextFieldType.PASSWORD,
                controller: oldPasswordCont,
                focus: oldPasswordFocus,
                nextFocus: newPasswordFocus,
                obscureText: true,
                // suffixPasswordVisibleWidget: ic_show.iconImage(size: 10).paddingAll(14),
                // suffixPasswordInvisibleWidget: ic_hide.iconImage(size: 10).paddingAll(14),
                decoration: inputDecoration(context, labelText: "Current Password"),
                isValidationRequired: true,
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return "Current password is required";
                  } else if (val.length < 8 || val.length > 12) {
                    return "Password should be between 8-12 characters";
                  }
                  return null;
                },
              ),
              16.height,
              AppTextField(

                textFieldType: TextFieldType.PASSWORD,
                controller: newPasswordCont,
                focus: newPasswordFocus,
                nextFocus: reenterPasswordFocus,
                obscureText: true,

                // suffixPasswordVisibleWidget: ic_show.iconImage(size: 10).paddingAll(14),
                // suffixPasswordInvisibleWidget: ic_hide.iconImage(size: 10).paddingAll(14),
                decoration: inputDecoration(context, labelText: "New Password"),
                isValidationRequired: true,
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return "New password is required";
                  } else if (val.length < 8 || val.length > 12) {
                    return "Password should be between 8-12 characters";
                  }
                  return null;
                },
              ),
              16.height,
              AppTextField(
                textFieldType: TextFieldType.PASSWORD,
                controller: reenterPasswordCont,
                focus: reenterPasswordFocus,
                obscureText: true,
                // suffixPasswordVisibleWidget: ic_show.iconImage(size: 10).paddingAll(14),
                // suffixPasswordInvisibleWidget: ic_hide.iconImage(size: 10).paddingAll(14),
                decoration: inputDecoration(context, labelText: "Re-enter Password"),
                isValidationRequired: true,
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return "Re-enter password is required";
                  } else if (val.length < 8 || val.length > 12) {
                    return "Password should be between 8-12 characters";
                  } else if (newPasswordCont.text != val) {
                    return "Passwords do not match";
                  }
                  return null;
                },
              ),
              24.height,
              AppButton(
                text: "Confirm",
                color: primaryColor,
                textColor: Colors.white,
                width: context.width() - context.navigationBarHeight,
                onTap: validateAndProceed,
              ),
              24.height,
            ],
          ),
        ),
      ),
    );
  }
}
