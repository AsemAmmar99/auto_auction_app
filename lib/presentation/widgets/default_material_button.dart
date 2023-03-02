import 'package:auto_auction_app/presentation/styles/colors.dart';
import 'package:flutter/material.dart';

class DefaultMaterialButton extends StatelessWidget {

  final double radius;
  final double? elevation;
  final double? height;
  final double? width;
  final EdgeInsets? padding;
  final EdgeInsets? internalPadding;
  final EdgeInsets? margin;
  final VoidCallback onPressed;
  final Color? splashColor;
  final Color? backgroundColor;
  final Widget child;

  const DefaultMaterialButton({
  Key? key,
  this.radius = 10,
  this.elevation,
  this.height = 50,
  this.width = double.infinity,
  this.padding,
  this.internalPadding,
  this.margin,
  required this.onPressed,
  this.splashColor,
  this.backgroundColor = lightSkyBlue,
  required this.child,
}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      margin: margin,
      width: width,
      height: height,
      child: MaterialButton(
          onPressed: onPressed,
          elevation: elevation,
          color: backgroundColor,
          splashColor: splashColor,
          padding: internalPadding,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius),
          ),
          child: child,
      ),
    );
  }
}
