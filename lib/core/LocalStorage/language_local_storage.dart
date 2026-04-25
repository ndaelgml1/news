import 'package:shared_preferences/shared_preferences.dart';

class LanguageStorage{
  static const String langKey = 'lang' ;
  static Future<void> savedLanguage(int index)async{
    final pref = await SharedPreferences.getInstance() ;
    await pref.setInt(langKey, index) ;
  }

  static Future<int> getLanguage () async {
    final pref = await SharedPreferences.getInstance() ;
                return pref.getInt(langKey)?? 0 ;

  }
}