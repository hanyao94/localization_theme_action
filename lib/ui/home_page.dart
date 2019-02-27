import 'package:flutter/material.dart';
import 'package:localization_theme_action/localization/customize_localizations.dart';
import 'package:localization_theme_action/utils/common_utils.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:localization_theme_action/redux/app_state.dart';

class HomePage extends StatelessWidget {
  static final String sName = "home";

  @override
  Widget build(BuildContext context) {
    return StoreBuilder<AppState>(builder: (context, store) {
      return Scaffold(
        appBar: AppBar(title: Text('Home'),),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(CustomizeLocalizations.of(context).i18n('Flutter 示例')),
              RaisedButton(
                child: Text(CustomizeLocalizations.of(context).i18n("选择日期")),
                onPressed: () {
                  showDatePicker(
                      context: context, initialDate: DateTime.now(), firstDate: DateTime(999), lastDate: DateTime(9999));
                },
              ),
              RaisedButton(
                child: Text(CustomizeLocalizations.of(context).i18n("选择语言")),
                onPressed: () {
                  List<String> list = [
                    CustomizeLocalizations.of(context).i18n('默认'),
                    CustomizeLocalizations.of(context).i18n('中文'),
                    CustomizeLocalizations.of(context).i18n('英文')
                  ];
                  CommonUtils.showCommitOptionDialog(context, list, (index) {
                    CommonUtils.changeLocale(store, index);
                  }, height: 150.0);
                },
              ),
              RaisedButton(
                child: Text(CustomizeLocalizations.of(context).i18n("选择主题")),
                onPressed: () {
                  List<String> list = [
                    CustomizeLocalizations.of(context).i18n('默认主题'),
                    CustomizeLocalizations.of(context).i18n('主题1'),
                    CustomizeLocalizations.of(context).i18n('主题2'),
                    CustomizeLocalizations.of(context).i18n('主题3'),
                    CustomizeLocalizations.of(context).i18n('主题4'),
                    CustomizeLocalizations.of(context).i18n('主题5'),
                    CustomizeLocalizations.of(context).i18n('主题6'),
                  ];
                  CommonUtils.showCommitOptionDialog(context, list, (index) {
                    CommonUtils.pushTheme(store, index);
                  }, colorList: CommonUtils.getThemeListColor(),height: 350.0);
                },
              ),
            ],
          ),
        ),
      );
    });
  }
}
