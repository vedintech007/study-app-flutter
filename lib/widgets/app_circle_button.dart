import 'package:flutter/material.dart';

class AppCircleButton extends StatelessWidget {
  const AppCircleButton({
    super.key,
    this.onTap,
    required this.child,
    this.color,
    this.width,
  });

  final VoidCallback? onTap;
  final Widget child;
  final Color? color;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: const CircleBorder(),
      child: InkWell(
        onTap: onTap,
        child: child,
      ),
    );
  }
}
