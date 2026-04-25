import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/core/widgets/toggle_model.dart';
import 'theme_state.dart';

class ThemeToggleViewModel extends StatelessWidget {
  const ThemeToggleViewModel({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, int>(
      builder: (context, state) {
        return ToggleModel(
          labels: const ["Light", "Dark"],
          selectedIndex: state,
          onToggle: (index) {
              BlocProvider.of<ThemeCubit>(context).changeTheme(index!);

          },
        );
      },
    );
  }
}