import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled/resource/styles/app_colors.dart';
import 'package:untitled/resource/styles/colors.dart';
import 'package:untitled/resource/styles/values.dart';
import 'package:untitled/src/core/validation/pattern.dart';

class CustomWidgets {
  static Widget textField(String title,
      {bool large_title = false,
      TextInputAction textInputAction = TextInputAction.done,
      bool isPassword = false,
      bool isRequired = true,
      bool isEnable = true,
      bool dirEnd = true,
      String isRequiredTitle = "",
      bool isNumber = false,
      TextInputType textInputType = TextInputType.text,
      String hintText = "",
      int? length,
      String pattern = anyPattern,
      String? hint,
      String? errorMessage,
      TextEditingController? textController,
      Equatable? event,
      String? icon,
      int lines = 1}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Visibility(
                child: SvgPicture.asset(
                  "assets/images/${icon}.svg",
                  color: darkGray,
                ),
                visible: icon != null,
              ),
              SizedBox(
                width: 4,
              ),
              Text(
                title,
                style: TextStyle(
                    fontSize: large_title ? title18 : smallTitle,
                    fontWeight: FontWeight.w100,
                    color: Colors.black),
              ),
              SizedBox(
                width: 20,
              ),
              if (!isRequired)
                Text(
                  isRequiredTitle,
                  style: TextStyle(
                      fontSize: smallTitle,
                      fontWeight: FontWeight.w100,
                      color: darkGray),
                )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
              enabled: isEnable ,
              textInputAction: textInputAction,
              cursorColor: black,
              // textDirection: dirEnd ? TextDirection.ltr : TextDirection.rtl,
              textAlign: dirEnd ? TextAlign.right : TextAlign.left,
              maxLines: lines,
              minLines: lines,
              controller: textController,
              maxLength: length,
              style: TextStyle(
                color: black,
                fontSize: 22,
              ),
              inputFormatters: [
                LengthLimitingTextInputFormatter(length),
              ],
              validator: (value) {
                if (value!.isEmpty) {
                  if (isRequired) return "\u26A0 $errorMessage";
                } else if (!RegExp(pattern).hasMatch(value)) {
                  return "\u26A0 $errorMessage";
                } else {
                  return null;
                }
              },
              autovalidateMode: AutovalidateMode.disabled,
              obscureText: isPassword,
              keyboardType: textInputType,
              onChanged: (text) {},
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: TextStyle(
                    fontSize: 12, color: AppColors.current.primaryTextColor),
                errorStyle: TextStyle(color: darkRed, fontSize: smallText),
                fillColor: Colors.white,
                filled: true,
                focusColor: white,
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.current.primaryTextColor,
                  ),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                disabledBorder:  OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.current.primaryTextColor,
                  ),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: AppColors.current.primaryColor, width: 2),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: darkRed, width: 2),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: darkRed, width: 2),
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ))
        ],
      ),
    );
  }

  static Widget selectedFiled(String title, String des, bool isArabic,
      {String? icon}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Visibility(
                child: SvgPicture.asset(
                  "assets/images/${icon}.svg",
                  color: darkGray,
                ),
                visible: icon != null,
              ),
              SizedBox(
                width: 4,
              ),
              Text(
                title,
                style: TextStyle(
                    fontSize: smallTitle,
                    fontWeight: FontWeight.w100,
                    color: black),
              ),
              SizedBox(
                width: 20,
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              color: lightGray,
            ),
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 14),
            child: Row(
              children: [
                Text(
                  des,
                  style: grayText12,
                ),
                Spacer(),
                Transform.rotate(
                    angle: isArabic ? 0 : 180 * pi / 180,
                    child: SvgPicture.asset(
                      "assets/images/arrow.svg",
                      color: darkGray,
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget setTextList(String fieldName, String fieldHint, String mText,
    SvgPicture mIcon, VoidCallback? onIconPressed, bool status, isArabic) {
  return GestureDetector(
    onTap: onIconPressed,
    child: Container(
      child: Padding(
          padding: EdgeInsets.only(top: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Visibility(
                child: Text(
                  fieldName,
                  style: TextStyle(
                      fontSize: smallTitle,
                      fontWeight: FontWeight.w100,
                      color: black),
                ),
                visible: status,
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 50,
                decoration: BoxDecoration(
                  color: lightGray,
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child: Padding(
                      padding: EdgeInsets.only(left: 14, right: 14),
                      child: Text(
                        mText.isNotEmpty ? mText : fieldHint,
                        style: grayText12,
                      ),
                    )),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: GestureDetector(
                        onTap: onIconPressed,
                        child: Transform.rotate(
                            angle: isArabic ? 0 : 180 * pi / 180, child: mIcon),
                      ),
                    )
                  ],
                ),
              )
            ],
          )),
    ),
  );
}
