// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes, avoid_renaming_method_parameters, constant_identifier_names

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> _en_EN = {
  "logIn": {
    "gmail": "Gmail Adress",
    "password": "Enter password"
  }
};
static const Map<String,dynamic> _tr_TR = {
  "logIn": {
    "gmail": "Gmail Adresi",
    "password": "Şifre Giriniz"
  }
};
static const Map<String, Map<String,dynamic>> mapLocales = {"en_EN": _en_EN, "tr_TR": _tr_TR};
}
