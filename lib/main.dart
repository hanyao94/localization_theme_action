import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:localization_theme_action/ui/welcom_page.dart';
import 'package:localization_theme_action/ui/home_page.dart';
import 'package:localization_theme_action/localization/customize_localizations_delegate.dart';
import 'package:localization_theme_action/redux/app_state.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  /// 创建Store，引用 GSYState 中的 AppState 实现 Reducer 方法
  /// initialState 初始化 State
  final store = Store<AppState>(appReducer,
      initialState: AppState(themeData: ThemeData(primarySwatch: Colors.orange), locale: Locale('zh', 'CH')));

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
        store: store,
        child: StoreBuilder<AppState>(builder: (context, store) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: store.state.themeData,
            locale: store.state.locale,
            localizationsDelegates: [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              CustomizeLocalizationsDelegate.delegate
            ],
            supportedLocales: [
              const Locale('zh', 'CH'),
              const Locale('en', 'US'),
            ],
            routes: {
              WelcomePage.sName: (context) {
                store.state.platformLocale = Localizations.localeOf(context);
                return WelcomePage();
              },
              HomePage.sName: (context) {
                return Localizations.override(context: context, locale: store.state.locale, child: HomePage());
              }
            },
          );
        }));
  }
}
