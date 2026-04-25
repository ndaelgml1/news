import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/core/LocalStorage/language_local_storage.dart';

class LanguageCubit extends Cubit<LanguageState>{
  LanguageCubit(): super(LanguageInitial(0)) {
    LoadSavedLanguage() ;
  }

  Future<void> LoadSavedLanguage () async{
    final savedIndex = await LanguageStorage.getLanguage();
    emit(LanguageInitial(savedIndex)) ;
  }

 Future<void>  changeLanguage (int newIndex ) async {
   await LanguageStorage.savedLanguage(newIndex);
   emit(LanguageChange(newIndex)) ;
  }

}
abstract class LanguageState{}
class LanguageInitial extends LanguageState{
  int index ;
  LanguageInitial(this.index);
}
class LanguageChange extends LanguageState {
  int index ;
  LanguageChange(this.index) ;
}
class LanguageError extends LanguageState {
  LanguageError(this.message) ;
  String message ;
}

































//import 'dart:ui';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// class Language extends Cubit<LanguageState>{
//   Language():super(LanguageState(Locale("en"))) ;
//   void changeLanguage (Locale newLocale) {
//     emit(LanguageState(newLocale)) ;
//   }
//
// }
//
// class LanguageState {
//  LanguageState(this.currentLocale);
//  final Locale currentLocale  ;
//
// }




