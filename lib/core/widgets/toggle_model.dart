import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toggle_switch/toggle_switch.dart';

class ToggleModel extends StatelessWidget {
  const ToggleModel({
    super.key,
    required this.labels,
    required this.onToggle,
    required this.selectedIndex,
    this.isVertical = false,
  });

  final List<String> labels;
  final int selectedIndex;
  final void Function(int?) onToggle;
  final bool isVertical;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: context.locale.languageCode == "en" ?Alignment.centerLeft : Alignment.centerRight,
      child: ToggleSwitch(
        totalSwitches: labels.length,
        labels: labels,
        initialLabelIndex: selectedIndex,
        onToggle: onToggle,

        changeOnTap: true,
        isVertical: isVertical,

        minWidth: 80.w,
        minHeight: 30.h,

        radiusStyle: true,
        cornerRadius: 10.r,
        borderWidth: 1.5.r,
        fontSize: 20.sp,
        borderColor: [Theme.of(context).colorScheme.onSurface,],


        activeBgColor: [Theme.of(context).colorScheme.outline],//gray
        activeFgColor: Theme.of(context).colorScheme.onSurface, //white
        inactiveBgColor: Theme.of(context).colorScheme.onSurface, //white
        inactiveFgColor: Theme.of(context).colorScheme.outline, // black


        activeBorders: List.generate(
            labels.length,
            (_)=> Border.all(
              color: Theme.of(context).colorScheme.outline,
              width: 1.5.w
            )
        ),

      ),
    );
  }
}
