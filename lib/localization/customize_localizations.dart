import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

/// 自定义多语言实现
class CustomizeLocalizations {
  final Locale locale;

  CustomizeLocalizations(this.locale);

  /// 基于map 根据 locale.languageCode 解析对应翻译的json 得到的map值
  static Map<dynamic, dynamic> _localizedValues;

  /// 国际化转化方法，基于map
  String i18n(String key) {
    return _localizedValues[key] ?? '** $key not found';
  }

  /// 代理类 CustomizeLocalizationsDelegate load方法回调，
  /// 根据当前语言 locale.languageCode 解析json成对应的字符串再转化成map 给 _localizedValues
  static Future<CustomizeLocalizations> load(Locale locale) async {
    CustomizeLocalizations customizeLocalizations = new CustomizeLocalizations(locale);
    String jsonContent = await rootBundle.loadString("locale/i18n_${locale.languageCode}.json");
    _localizedValues = json.decode(jsonContent);
    return customizeLocalizations;
  }


  /// 静态方法全局调用，根据Localizations 加载当前的 CustomizeLocalizations
  static CustomizeLocalizations of(BuildContext context) {
    return Localizations.of(context, CustomizeLocalizations);
  }
}
