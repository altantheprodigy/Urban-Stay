import 'package:flutter/material.dart';
import 'package:urban_stay/utils/color.dart';
import 'package:urban_stay/utils/typography.dart';

class CustomButton extends StatelessWidget {
  final Widget child;
  final VoidCallback? onPressed;
  final bool disabled;
  final Gradient? gradient;
  final Color textColor;
  final Color textColorDisabled;
  final Size? maximumSize;
  final Color backgroundColor;
  final Color disabledColor;
  final Size? minimumSize;
  final Border? border;

  const CustomButton({
    Key? key,
    required this.child,
    this.onPressed,
    this.disabled = false,
    this.gradient,
    this.textColor = black00,
    this.textColorDisabled = black400,
    this.maximumSize,
    this.minimumSize,
    this.backgroundColor = forest600,
    this.border,
    this.disabledColor = black200,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(999),
        border: border,
      ),
      child: Material(
        color: onPressed != null ? backgroundColor : disabledColor,
        borderRadius: BorderRadius.circular(999),
        child: InkWell(
          splashColor: forest600,
          borderRadius: BorderRadius.circular(999),
          onTap: onPressed != null
              ? () {
            /// Dismiss keyboard
            FocusManager.instance.primaryFocus?.unfocus();
            onPressed!();
          }
              : null,
          child: Container(
            decoration: const BoxDecoration(color: Colors.transparent),
            child: DefaultTextStyle.merge(
              style: sM.copyWith(color: onPressed != null ? textColor : textColorDisabled),
              textAlign: TextAlign.center,
              child: Center(child: child),
            ),
          ),
        ),
      ),
    );
  }
}