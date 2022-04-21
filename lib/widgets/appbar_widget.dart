import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  final Widget rightAction;
  final Color iconColor;
  final IconData leftIcon;
  final VoidCallback leftIconPressed;

  const AppBarWidget({
    required this.rightAction,
    required this.leftIconPressed,
    this.leftIcon = Icons.menu,
    Key? key,
    this.iconColor = Colors.black54,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: leftIconPressed,
            icon: Icon(leftIcon, size: 30, color: iconColor),
          ),
          rightAction,
        ],
      ),
    );
  }
}
