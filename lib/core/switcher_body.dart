import 'dart:ui';

import 'package:flutter/material.dart';

import 'switcher_button_transform.dart';

class SwitcherBody extends StatelessWidget {
  const SwitcherBody({
    Key? key,
    required this.value,
    required this.width,
    this.labelOff,
    this.labelOn,
    required this.height,
    required this.iconOn,
    required this.iconOff,
    required this.switcherRadius,
    required this.transitionColor,
    required this.switcherButtonSize,
    required this.switcherButtonColor,
    required this.switcherButtonRadius,
    required this.switcherButtonOffset,
    required this.switcherButtonPadding,
    required this.switcherButtonIconSize,
    required this.switcherButtonAngleTransform,
    this.buttonBackgroundColor,
    this.borderColor,
    this.iconWidgetOn,
    this.iconWidgetOff,
  }) : super(key: key);

  final double value;
  final double width;
  final double height;
  final Widget? labelOn;
  final Widget? labelOff;
  final IconData iconOn;
  final IconData iconOff;
  final Widget? iconWidgetOn;
  final Widget? iconWidgetOff;
  final double switcherRadius;
  final Color transitionColor;
  final Color? buttonBackgroundColor;
  final Color? borderColor;
  final double switcherButtonSize;
  final Color switcherButtonColor;
  final double switcherButtonRadius;
  final Offset switcherButtonOffset;
  final double switcherButtonPadding;
  final double switcherButtonIconSize;
  final double switcherButtonAngleTransform;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(switcherButtonPadding),
      width: width,
      height: height,
      decoration: BoxDecoration(
        border: borderColor != null ? Border.all(color: borderColor!) : null,
        color: buttonBackgroundColor ?? transitionColor,
        borderRadius: BorderRadius.circular(switcherRadius),
      ),
      child: Stack(
        alignment: Alignment.centerLeft,
        children: <Widget>[
          SwitcherButtonTransform(
            value: value,
            iconOn: iconOn,
            iconWidgetOn: iconWidgetOn,
            iconWidgetOff: iconWidgetOff,
            transitionColor: transitionColor,
            switcherButtonSize: switcherButtonSize,
            switcherButtonRadius: switcherButtonRadius,
            switcherButtonOffset: switcherButtonOffset,
            switcherButtonIconSize: switcherButtonIconSize,
            switcherButtonAngleTransform: switcherButtonAngleTransform,
            iconOff: iconOff,
            switcherButtonColor: switcherButtonColor,
          ),
          if (labelOn != null)
            Positioned(
              left: 0,
              child: Opacity(
                opacity: value.clamp(0.0, 1.0),
                child: labelOn,
              ),
            ),
          if (labelOff != null)
            Positioned(
              right: 0,
              child: Opacity(
                opacity: (1 - value).clamp(0.0, 1.0),
                child: Align(child: labelOff),
              ),
            )
        ],
      ),
    );
  }
}
