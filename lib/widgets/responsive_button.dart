import 'package:flutter/material.dart';
import 'package:travel_app/widgets/app_text.dart';
import '../misc/colors.dart';

class ResponsiveButton extends StatelessWidget {
  final bool isResponsive;
  final double? width;
  final VoidCallback onTap;

  const ResponsiveButton({
    required this.onTap,
    Key? key,
    this.width = 120,
    this.isResponsive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: isResponsive ? double.maxFinite : width,
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.mainColor,
          ),
          child: Row(
            mainAxisAlignment: isResponsive
                ? MainAxisAlignment.spaceBetween
                : MainAxisAlignment.center,
            children: [
              if (isResponsive)
                const Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: AppText("Замовити зараз", color: Colors.white),
                ),
              Image.asset("assets/images/button-one.png"),
            ],
          ),
        ),
      ),
    );
  }
}
