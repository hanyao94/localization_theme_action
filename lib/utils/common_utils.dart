import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:localization_theme_action/redux/app_state.dart';
import 'package:localization_theme_action/redux/locale_redux.dart';
import 'package:localization_theme_action/redux/theme_redux.dart';
import 'package:localization_theme_action/style/app_style.dart';

/**
 * 通用方法
 */
class CommonUtils {
  /**
   * 切换语言
   */
  static changeLocale(Store<AppState> store, int index) {
    Locale locale = store.state.platformLocale;
    switch (index) {
      case 1:
        locale = Locale('zh', 'CH');
        break;
      case 2:
        locale = Locale('en', 'US');
        break;
    }
    store.dispatch(RefreshLocaleAction(locale));
  }

  /**
   * 自定义弹出选择框
   */
  static Future<Null> showCommitOptionDialog(
    BuildContext context,
    List<String> commitMaps,
    ValueChanged<int> onTap, {
    width = 250.0,
    height = 400.0,
    List<Color> colorList,
  }) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Center(
            child: Container(
              width: width,
              height: height,
              padding: EdgeInsets.all(4.0),
              margin: EdgeInsets.all(2.0),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(4.0))),
              child: ListView.builder(
                  itemCount: commitMaps.length,
                  itemBuilder: (context, index) {
                    return RaisedButton(
                        padding: EdgeInsets.only(left: 20.0, top: 10.0, right: 20.0, bottom: 10.0),
                        textColor: Colors.white,
                        color: colorList != null ? colorList[index] : Theme.of(context).primaryColor,
                        child: Flex(direction: Axis.horizontal, mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
                          new Text(commitMaps[index],
                              style: new TextStyle(fontSize: 14.0), maxLines: 2, overflow: TextOverflow.ellipsis)
                        ]),
                        onPressed: () {
                          Navigator.pop(context);
                          onTap(index);
                        });
                  }),
            ),
          );
        });
  }

  /**
   * 应用主题
   */
  static pushTheme(Store store, int index){
    ThemeData themeData;
    List<Color> colors = getThemeListColor();
    themeData = new ThemeData(primarySwatch: colors[index]);
    store.dispatch(RefreshThemeDataAction(themeData));
  }

  /**
   * 主题颜色
   */
  static List<Color> getThemeListColor(){
    return[
      AppColors.primarySwatch,
      Colors.lime,
      Colors.amber,
      Colors.deepOrange,
      Colors.brown,
      Colors.teal,
      Colors.blue
    ];
  }
}
