import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Enum for Text Field
enum TextFieldType {
  EMAIL,
  PASSWORD,
  NAME,
  MULTILINE,
  OTHER,
  PHONE,
  URL,
  NUMBER,
  USERNAME, EMAIL_ENHANCED
}

class AppTextField extends StatefulWidget {
  final TextEditingController? controller;
  final TextFieldType textFieldType;

  final InputDecoration? decoration;
  final FocusNode? focus;
  final FormFieldValidator<String>? validator;
  final bool isValidationRequired;
  final TextCapitalization? textCapitalization;
  final TextInputAction? textInputAction;
  final Function(String)? onFieldSubmitted;
  final Function(String)? onChanged;
  final FocusNode? nextFocus;
  final TextStyle? textStyle;
  final TextAlign textAlign;
  final int? maxLines;
  final int? minLines;
  final bool? enabled;
  final bool autoFocus;
  final bool readOnly;
  final bool? enableSuggestions;
  final int? maxLength;
  final Color? cursorColor;
  final Widget? suffix;
  final Color? suffixIconColor;
  final TextInputType? keyboardType;
  final Iterable<String>? autoFillHints;
  final EdgeInsets? scrollPadding;
  final double? cursorWidth;
  final double? cursorHeight;
  final Function()? onTap;
  final InputCounterWidgetBuilder? buildCounter;
  final List<TextInputFormatter>? inputFormatters;
  final TextAlignVertical? textAlignVertical;
  final bool expands;
  final bool? showCursor;
  final TextSelectionControls? selectionControls;
  final StrutStyle? strutStyle;
  final String obscuringCharacter;
  final String? initialValue;
  final Brightness? keyboardAppearance;
  final Widget? suffixPasswordVisibleWidget;
  final Widget? suffixPasswordInvisibleWidget;

  final String? title;
  final TextStyle? titleTextStyle;
  final int spacingBetweenTitleAndTextFormField;

  final bool? obscureText;

  final Function(PointerDownEvent)? onTapOutside;

  const AppTextField({
    this.controller,
    required this.textFieldType,
    this.decoration,
    this.focus,
    this.validator,
    this.isValidationRequired = true,
    this.textCapitalization,
    this.textInputAction,
    this.onFieldSubmitted,
    this.nextFocus,
    this.textStyle,
    this.textAlign = TextAlign.start,
    this.maxLines,
    this.minLines,
    this.enabled,
    this.onChanged,
    this.cursorColor,
    this.suffix,
    this.suffixIconColor,
    this.enableSuggestions,
    this.autoFocus = false,
    this.readOnly = false,
    this.maxLength,
    this.keyboardType,
    this.autoFillHints,
    this.scrollPadding,
    this.onTap,
    this.cursorWidth,
    this.cursorHeight,
    this.inputFormatters,
    this.textAlignVertical,
    this.expands = false,
    this.showCursor,
    this.selectionControls,
    this.strutStyle,
    this.obscuringCharacter = '•',
    this.initialValue,
    this.keyboardAppearance,
    this.suffixPasswordVisibleWidget,
    this.suffixPasswordInvisibleWidget,
    this.title,
    this.titleTextStyle,
    this.spacingBetweenTitleAndTextFormField = 4,
    this.obscureText,
    this.onTapOutside,
    super.key, this.buildCounter,
  });

  @override
  _AppTextFieldState createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool isPasswordVisible = false;

  @override
  void initState() {
    super.initState();
    if (widget.obscureText != null) {
      isPasswordVisible = widget.obscureText!;
    }
  }

  FormFieldValidator<String>? applyValidation() {
    if (widget.isValidationRequired) {
      return widget.validator ??
          (widget.textFieldType == TextFieldType.EMAIL
              ? (s) {
            if (s == null || s.trim().isEmpty) return "Field is required";
            if (!RegExp(r"^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$")
                .hasMatch(s.trim())) return "Invalid email";
            return null;
          }
              : null);
    }
    return null;
  }

  TextCapitalization applyTextCapitalization() {
    if (widget.textCapitalization != null) {
      return widget.textCapitalization!;
    } else if (widget.textFieldType == TextFieldType.NAME) {
      return TextCapitalization.words;
    } else {
      return TextCapitalization.none;
    }
  }

  TextInputAction? applyTextInputAction() {
    if (widget.textInputAction != null) {
      return widget.textInputAction;
    } else if (widget.textFieldType == TextFieldType.MULTILINE) {
      return TextInputAction.newline;
    } else if (widget.nextFocus != null) {
      return TextInputAction.next;
    } else {
      return TextInputAction.done;
    }
  }

  TextInputType? applyTextInputType() {
    switch (widget.textFieldType) {
      case TextFieldType.EMAIL:
        return TextInputType.emailAddress;
      case TextFieldType.MULTILINE:
        return TextInputType.multiline;
      case TextFieldType.PASSWORD:
        return TextInputType.visiblePassword;
      case TextFieldType.PHONE:
      case TextFieldType.NUMBER:
        return TextInputType.number;
      case TextFieldType.URL:
        return TextInputType.url;
      default:
        return TextInputType.text;
    }
  }

  void onPasswordVisibilityChange(bool val) {
    setState(() {
      isPasswordVisible = val;
    });
  }

  Widget? suffixIcon() {
    if (widget.textFieldType == TextFieldType.PASSWORD) {
      return IconButton(
        icon: Icon(isPasswordVisible ? Icons.visibility : Icons.visibility_off,
            color: widget.suffixIconColor ?? Theme.of(context).iconTheme.color),
        onPressed: () => onPasswordVisibilityChange(!isPasswordVisible),
      );
    }
    return widget.suffix;
  }

  Widget textFormFieldWidget() {
    return TextFormField(

      controller: widget.controller,
      obscureText:
      widget.textFieldType == TextFieldType.PASSWORD && !isPasswordVisible,
      validator: applyValidation(),
      textCapitalization: applyTextCapitalization(),
      textInputAction: applyTextInputAction(),
      keyboardType: applyTextInputType(),
      decoration: (widget.decoration ?? const InputDecoration()).copyWith(
        suffixIcon: suffixIcon(),
        fillColor: Colors.grey[200], // Set the inner background color
        filled: true, // Enable filling the background color
      ),

      focusNode: widget.focus,
      style: widget.textStyle ?? Theme.of(context).textTheme.bodyMedium,
      textAlign: widget.textAlign,
      maxLines: widget.textFieldType == TextFieldType.MULTILINE ? null : 1,
      minLines: widget.textFieldType == TextFieldType.MULTILINE ? 2 : 1,
      autofocus: widget.autoFocus,
      enabled: widget.enabled,
      onChanged: widget.onChanged,
      cursorColor: widget.cursorColor ?? Theme.of(context).primaryColor,
      readOnly: widget.readOnly,
      maxLength: widget.maxLength,
      enableSuggestions: widget.enableSuggestions ?? true,
      onTap: widget.onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return widget.title != null
        ? Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.title!,
            style: widget.titleTextStyle ??
                Theme.of(context).textTheme.bodyLarge),
        SizedBox(height: widget.spacingBetweenTitleAndTextFormField.toDouble()),
        textFormFieldWidget(),
      ],
    )
        : textFormFieldWidget();
  }
}
