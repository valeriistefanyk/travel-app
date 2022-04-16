import 'package:flutter/material.dart';
import 'package:travel_app/widgets/app_text.dart';

class AppButtons extends StatelessWidget {
  final Color color;
  final String? text;
  final IconData? icon;
  final bool isIcon;
  final Color backgroundColor;
  final double size;
  final Color? borderColor;
  final VoidCallback onTap;

  const AppButtons({
    this.text = "",
    this.icon,
    this.isIcon = false,
    required this.onTap,
    required this.color,
    required this.backgroundColor,
    this.borderColor,
    this.size = 50,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: borderColor ?? backgroundColor,
            width: 1.0,
          ),
        ),
        child: Center(
            child: isIcon
                ? Icon(
                    icon,
                    color: color,
                  )
                : AppLargeText(
                    text!,
                    color: color,
                    size: 20,
                  )),
      ),
    );
  }
}
