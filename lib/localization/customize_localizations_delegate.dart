import 'dart:async';
import 'package:flutter/material.dart';

import 'package:localization_theme_action/localization/customize_localizations.dart';

class CustomizeLocalizationsDelegate extends LocalizationsDelegate<CustomizeLocalizations> {
  CustomizeLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    ///支持中文和英语
    return ['en', 'zh'].contains(locale.languageCode);
  }

  @override
  bool shouldReload(LocalizationsDelegate<CustomizeLocalizations> old) {
    return false;
  }

  ///根据locale，创建一个对象用于提供当前locale下的文本显示
  @override
  Future<CustomizeLocalizations> load(Locale locale) {
    return CustomizeLocalizations.load(locale);
  }

  ///全局静态代理
  static CustomizeLocalizationsDelegate delegate = new CustomizeLocalizationsDelegate();
}
