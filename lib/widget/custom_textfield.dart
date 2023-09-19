import 'package:cryp_wallet/config/colors.dart';
import 'package:cryp_wallet/config/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class CustomTextField extends StatelessWidget {
  final String text;
  final TextEditingController textEditingController;
  final Widget? sufix;
  final TextInputType? keyboardType;
  final bool obscureText;
  final bool error;
  final Widget? prefix;
  final String? errorMessage;
  final Color? borderColor;
  final String? Function(String?)? validator;
  final Function(String)? onChange;
  final List<TextInputFormatter>? inputFormatters;
  const CustomTextField({
    super.key,
    required this.text,
    required this.textEditingController,
    this.sufix,
    this.prefix,
    this.keyboardType,
    this.obscureText = false,
    this.error = false,
    this.errorMessage,
    this.borderColor,
    this.validator,
    this.onChange,
    this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      child: TextFormField(
        controller: textEditingController,
        keyboardType: keyboardType,
        style: pSemiBold18.copyWith(
          fontSize: 16,
        ),
        onChanged: (string) {
          if (onChange == null) {
            return;
          }
          onChange!(string);
        },
        minLines: 1,
        maxLines: null,
        obscureText: obscureText,
        cursorColor: ConstColors.primary,
        validator: validator,
        inputFormatters: inputFormatters,
        decoration: InputDecoration(
          errorText: error ? errorMessage ?? '$text not valid!' : null,
          suffixIcon: sufix,
          prefixIcon: prefix,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
              color: borderColor ?? ConstColors.grey.withOpacity(0.3),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(
              color: ConstColors.primary,
            ),
          ),
          hintText: text,
          hintStyle: pRegular14.copyWith(
            fontSize: 16,
            color: ConstColors.lightText,
          ),
        ),
      ),
    );
  }
}

class CustomTextFieldWithPrefix extends StatelessWidget {
  final String text;
  final TextEditingController textEditingController;
  final Widget prefix;
  const CustomTextFieldWithPrefix(
      {super.key,
      required this.text,
      required this.textEditingController,
      required this.prefix});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 64,
      width: Get.width,
      child: TextFormField(
        controller: textEditingController,
        style: pSemiBold18.copyWith(
          fontSize: 16,
        ),
        decoration: InputDecoration(
          prefixIcon: prefix,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
              color: ConstColors.grey.withOpacity(0.3),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(
              color: ConstColors.primary,
            ),
          ),
          hintText: text,
          hintStyle: pRegular14.copyWith(
            fontSize: 16,
            color: ConstColors.lightText,
          ),
        ),
      ),
    );
  }
}

class CustomTextFieldWithPrefixSufix extends StatelessWidget {
  final String text;
  final TextEditingController textEditingController;
  final Widget prefix;
  final Widget sufix;
  final String label;
  final TextInputType? textInputType;
  const CustomTextFieldWithPrefixSufix({
    super.key,
    required this.text,
    required this.textEditingController,
    required this.prefix,
    required this.sufix,
    required this.label,
    this.textInputType,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      width: Get.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: ConstColors.white,
      ),
      child: TextFormField(
        controller: textEditingController,
        style: pSemiBold18.copyWith(
          fontSize: 14,
        ),
        keyboardType: textInputType,
        decoration: InputDecoration(
          prefixIcon: prefix,
          suffixIcon: sufix,
          border: InputBorder.none,
          hintText: text,
          hintStyle: pRegular14.copyWith(
            fontSize: 14,
            color: ConstColors.lightText,
            height: 1.6,
          ),
          labelText: text,
          labelStyle: pRegular14.copyWith(
            fontSize: 14,
            color: ConstColors.lightText,
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
        ),
      ),
    );
  }
}

class CustomTextFieldWithBorder extends StatelessWidget {
  final String text;
  final TextEditingController textEditingController;
  final Widget prefix;
  final Widget sufix;

  const CustomTextFieldWithBorder({
    super.key,
    required this.text,
    required this.textEditingController,
    required this.prefix,
    required this.sufix,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      width: Get.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28),
          border: Border.all(
            color: ConstColors.primary,
          )),
      child: TextFormField(
        controller: textEditingController,
        style: pSemiBold18.copyWith(
          fontSize: 16,
        ),
        decoration: InputDecoration(
          prefixIcon: prefix,
          suffixIcon: sufix,
          border: InputBorder.none,
          hintText: text,
          hintStyle: pRegular14.copyWith(
            fontSize: 16,
            height: 1.6,
          ),
        ),
      ),
    );
  }
}

class CustomTextFieldBorder extends StatelessWidget {
  final String text;
  final TextEditingController textEditingController;

  const CustomTextFieldBorder({
    super.key,
    required this.text,
    required this.textEditingController,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      width: Get.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        border: Border.all(
          color: ConstColors.primary,
        ),
      ),
      child: TextFormField(
        controller: textEditingController,
        style: pSemiBold18.copyWith(
          fontSize: 16,
        ),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(left: 14, right: 14),
          border: InputBorder.none,
          hintText: text,
          hintStyle: pRegular14.copyWith(
            fontSize: 16,
            height: 1.6,
          ),
        ),
      ),
    );
  }
}
