import 'package:flutter/material.dart';
import 'package:urban_stay/utils/color.dart';
import 'package:urban_stay/utils/typography.dart';

class CustomButton1 extends StatelessWidget {
  final Widget child;
  final VoidCallback? onPressed;
  final bool disabled;
  final Gradient? gradient;
  final Color? textColor;
  final Size? maximumSize;
  final Color backgroundColor;
  final Color disabledColor;
  final Size? minimumSize;
  final Border? border;

  const CustomButton1({
    Key? key,
    required this.child,
    this.onPressed,
    this.disabled = false,
    this.gradient,
    this.textColor,
    this.maximumSize,
    this.minimumSize,
    this.backgroundColor = forest600,
    this.border,
    this.disabledColor = black200,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: border,
      ),
      child: Material(
        color: black00,
        borderRadius: BorderRadius.circular(10),
        child: InkWell(
          splashColor: forest600,
          borderRadius: BorderRadius.circular(10),
          onTap: onPressed != null
              ? () {
            /// Dismiss keyboard
            FocusManager.instance.primaryFocus?.unfocus();
            onPressed!();
          }
              : null,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: const BoxDecoration(color: Colors.transparent),
              child: DefaultTextStyle.merge(
                style: sM.copyWith(color: textColor),
                textAlign: TextAlign.center,
                child: Center(child: child),
              ),
            ),
          ),
        ),
      ),
    );
  }
}