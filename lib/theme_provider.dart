import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier{

  bool _isDarkTheme =  false;



  void getValueFromPrefe() async{
    SharedPreferences prefs= await SharedPreferences.getInstance();
     _isDarkTheme= prefs.getBool("themeData") ?? false;
     notifyListeners();
  }

  bool getThemeValue() => _isDarkTheme;

  void setDarkTheme(bool value)async {
    SharedPreferences prefs= await SharedPreferences.getInstance();
     prefs.setBool("themeData", value);
    _isDarkTheme=value;
    notifyListeners();
  }

}