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
    return ToggleSwitch(
      totalSwitches: labels.length,
      labels: labels,
      initialLabelIndex: selectedIndex,
      onToggle: onToggle,

      changeOnTap: true,
      isVertical: isVertical,

      minWidth: 70.w,
      minHeight: 35.h,

      radiusStyle: true,
      cornerRadius: 20.r,
      borderWidth: 1.5.r,
      fontSize: 20.sp,

      activeBgColor: [Theme.of(context).colorScheme.surface],
      activeFgColor: Theme.of(context).colorScheme.onSurface,
      inactiveBgColor: Theme.of(context).colorScheme.onSurface,
      inactiveFgColor: Theme.of(context).colorScheme.outline,

      activeBorders: List.generate(
          labels.length,
          (_)=> Border.all(
            color: Theme.of(context).colorScheme.scrim,
            width: 2.5.w
          )
      ),

    );
  }
}
