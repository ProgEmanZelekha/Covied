// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(count) =>
      "{count, plural, =0{What’s your gender ? Male,Female} =1{What’s your age ? More than or equal 60,Less than 60} =2{Do you have a cough ? Yes,No} =3{Do you have a fever ? Yes,No} =4{Do you have a sore throat ? Yes,No} =5{Do you have a shortness of breath ? Yes,No} =6{Do you have a headache ? Yes,No} =7{Have you contacted a person who was confirmed to be infected with covid-19 ? Yes,No} other{${count} wombats}}";

  static String m1(count) =>
      "${Intl.plural(count, zero: 'no wombats', one: '1 wombat', other: '${count} wombats')}";

  static String m2(gender) =>
      "${Intl.gender(gender, female: 'she', male: 'he', other: 'they')}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "about_us": MessageLookupByLibrary.simpleMessage("About Us"),
        "already_have_account":
            MessageLookupByLibrary.simpleMessage("already have account"),
        "change_language":
            MessageLookupByLibrary.simpleMessage("Change Language"),
        "change_pass": MessageLookupByLibrary.simpleMessage("Change Password"),
        "change_them": MessageLookupByLibrary.simpleMessage("Change Them"),
        "confirm_password":
            MessageLookupByLibrary.simpleMessage("Confirm Password"),
        "contact_us": MessageLookupByLibrary.simpleMessage("Contact Us"),
        "edit": MessageLookupByLibrary.simpleMessage("Edit profile"),
        "email": MessageLookupByLibrary.simpleMessage("Email"),
        "email_found": MessageLookupByLibrary.simpleMessage(
            "The account already exists for that email."),
        "email_not_found":
            MessageLookupByLibrary.simpleMessage("Your Email Not Found."),
        "enter_code_plz":
            MessageLookupByLibrary.simpleMessage("Enter Code Please"),
        "enter_confirm_password":
            MessageLookupByLibrary.simpleMessage("Enter confirm Password"),
        "enter_email": MessageLookupByLibrary.simpleMessage("Enter Email"),
        "enter_name": MessageLookupByLibrary.simpleMessage("enter name"),
        "enter_password":
            MessageLookupByLibrary.simpleMessage("Enter Password"),
        "enter_verify_code": MessageLookupByLibrary.simpleMessage(
            "Enter verification code we send to email"),
        "forget_password":
            MessageLookupByLibrary.simpleMessage("forget password"),
        "have_account":
            MessageLookupByLibrary.simpleMessage("don\'t have an account?"),
        "hello": MessageLookupByLibrary.simpleMessage("Hello,"),
        "home": MessageLookupByLibrary.simpleMessage("Home"),
        "home_select_1": MessageLookupByLibrary.simpleMessage(
            "predict if you have covid-19 or not"),
        "home_select_2": MessageLookupByLibrary.simpleMessage(
            "Know the Basic medicines for Corona"),
        "home_select_3":
            MessageLookupByLibrary.simpleMessage("How to avoid covid-19?"),
        "home_title":
            MessageLookupByLibrary.simpleMessage("what you want to do today?"),
        "login": MessageLookupByLibrary.simpleMessage("login"),
        "login_now": MessageLookupByLibrary.simpleMessage("login now!"),
        "logout": MessageLookupByLibrary.simpleMessage("Log out"),
        "nQuestion": m0,
        "nWombats": m1,
        "name": MessageLookupByLibrary.simpleMessage("name"),
        "name_updated":
            MessageLookupByLibrary.simpleMessage("Your Name Is Updated."),
        "old_paa": MessageLookupByLibrary.simpleMessage("old password"),
        "pass_updated":
            MessageLookupByLibrary.simpleMessage("Your Password Is Updated."),
        "password": MessageLookupByLibrary.simpleMessage("Password"),
        "password_error": MessageLookupByLibrary.simpleMessage(
            "The password provided is too weak."),
        "personal_info":
            MessageLookupByLibrary.simpleMessage("Personal information"),
        "profile": MessageLookupByLibrary.simpleMessage("Profile"),
        "pronoun": m2,
        "receive_code":
            MessageLookupByLibrary.simpleMessage("Don\'t receive code"),
        "register_susses": MessageLookupByLibrary.simpleMessage(
            "Your Account Done , Check Your Email To Active Account"),
        "register_verify": MessageLookupByLibrary.simpleMessage(
            "Please Verify Your Email From Link Send To You."),
        "remember_me": MessageLookupByLibrary.simpleMessage("remember me"),
        "resend": MessageLookupByLibrary.simpleMessage("Resend"),
        "resend_code_in":
            MessageLookupByLibrary.simpleMessage("Resend code in"),
        "save": MessageLookupByLibrary.simpleMessage("Save Changes"),
        "send": MessageLookupByLibrary.simpleMessage("Send"),
        "setting": MessageLookupByLibrary.simpleMessage("Settings"),
        "sign_up": MessageLookupByLibrary.simpleMessage("sign up"),
        "sign_up_now": MessageLookupByLibrary.simpleMessage("sign up now!"),
        "test": MessageLookupByLibrary.simpleMessage("Test"),
        "test_select_1":
            MessageLookupByLibrary.simpleMessage("By some questions"),
        "test_select_2":
            MessageLookupByLibrary.simpleMessage("By insert X-ray picture"),
        "test_select_3": MessageLookupByLibrary.simpleMessage(
            "\nBy both some questions & insert X-ray photo\n"),
        "test_title": MessageLookupByLibrary.simpleMessage(
            "By any way you want to get predict if you have covid-19 or not"),
        "verify": MessageLookupByLibrary.simpleMessage("verify"),
        "verify_email":
            MessageLookupByLibrary.simpleMessage("Verify your email"),
        "wrong_password":
            MessageLookupByLibrary.simpleMessage("Your Password is Wrong .")
      };
}
