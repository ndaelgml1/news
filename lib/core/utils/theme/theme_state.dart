import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/core/LocalStorage/theme_storage.dart';

class ThemeCubit extends Cubit<int> {
  ThemeCubit() : super(0) {
    loadSavedTheme();
  }

  Future<void> loadSavedTheme() async {
    final savedIndex = await ThemeStorage.getTheme();
    emit(savedIndex);
  }

  Future<void> changeTheme(int index) async {
    await ThemeStorage.saveTheme(index);
    emit(index);
  }
}
