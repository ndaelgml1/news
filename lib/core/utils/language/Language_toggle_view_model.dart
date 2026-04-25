import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/core/utils/language/language_state.dart';
import 'package:news/core/widgets/toggle_model.dart';

class LanguageToggleViewModel extends StatelessWidget {
  const LanguageToggleViewModel({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageCubit, LanguageState>(
      builder: (context, state) {
        int selectedIndex = 0 ;
        if (state is LanguageInitial) {
          selectedIndex = state.index;
        } else if (state is LanguageChange) {
          selectedIndex = state.index;
        }
        return ToggleModel(
            labels: ["Eng" , "Ar"],
            selectedIndex: selectedIndex  ,
            onToggle: (index){
              BlocProvider.of<LanguageCubit>(context).changeLanguage(index!) ;
              context.setLocale(index == 0 ? const Locale("en") : const Locale("ar") );

            },

        );
      },
    );
  }
}





