import 'dart:ui';

import 'package:shared_preferences/shared_preferences.dart';

import '../presentation/resources/langauge_manager.dart';

const String PREFS_KEY_LANG = "PREFS_KEY_LANG";
const String PREFS_KEY_ONBOARDING_SCREEN_VIEWED =
    "PREFS_KEY_ONBOARDING_SCREEN_VIEWED";
const String PREFS_KEY_IS_USER_LOGGED_IN = "PREFS_KEY_IS_USER_LOGGED_IN";

class AppPreferences {
  final SharedPreferences _sharedPreferences;

  AppPreferences(this._sharedPreferences);

  Future<String> getAppLanguage() async {
    String? language = _sharedPreferences.getString(PREFS_KEY_LANG);
    if (language != null && language.isNotEmpty) {
      return language;
    } else {
      // return default lang
      return LanguageType.ENGLISH.getValue();
    }
  }
  Future<void> changeAppLanguage()async{
    String currLang=await getAppLanguage();
    if(currLang==LanguageType.ARABIC.getValue()) {
        //set eng
        _sharedPreferences.setString(PREFS_KEY_LANG,LanguageType.ENGLISH.getValue());
      }else{
      _sharedPreferences.setString(PREFS_KEY_LANG,LanguageType.ARABIC.getValue());
    }
  }
  Future<Locale> getLocale()async{
    String currLang=await getAppLanguage();
    if(currLang==LanguageType.ARABIC.getValue()) {
     return ARABIC_LOCAL;
    }else{
     return ENGLISH_LOCAL;
    }
  }

  // on boarding

  Future<void> setOnBoardingScreenViewed() async {
    _sharedPreferences.setBool(PREFS_KEY_ONBOARDING_SCREEN_VIEWED, true);
  }

  Future<bool> isOnBoardingScreenViewed() async {
    return _sharedPreferences.getBool(PREFS_KEY_ONBOARDING_SCREEN_VIEWED) ??
        false;
  }

  //login

  Future<void> setUserLoggedIn() async {
    _sharedPreferences.setBool(PREFS_KEY_IS_USER_LOGGED_IN, true);
  }

  Future<bool> isUserLoggedIn() async {
    return _sharedPreferences.getBool(PREFS_KEY_IS_USER_LOGGED_IN) ?? false;
  }
  Future<void> logout() async {
    _sharedPreferences.remove(PREFS_KEY_IS_USER_LOGGED_IN);
  }
}
