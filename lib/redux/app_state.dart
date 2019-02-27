import 'package:flutter/material.dart';
import 'locale_redux.dart';
import 'theme_redux.dart';

class AppState {
  /// 主题数据
  ThemeData themeData;

  ///语言
  Locale locale;

  ///当前手机平台默认语言
  Locale platformLocale;

  ///构造方法
  AppState({this.themeData, this.locale});
}

///创建 Reducer
///源码中 Reducer 是一个方法 typedef State Reducer<State>(State state, dynamic action);
///我们自定义了 appReducer 用于创建 store
AppState appReducer(AppState state, action) {
  return AppState(

      ///通过 ThemeDataReducer 将AppState 内的 themeData 和 action 关联在一起
      themeData: ThemeDataReducer(state.themeData, action),

      ///通过 LocaleReducer 将 将AppState 内的 locale 和 action 关联在一起
      locale: LocaleReducer(state.locale, action));
}
