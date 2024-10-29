import 'package:flutter/material.dart';

class NavigationButton extends StatefulWidget {
  const NavigationButton({
    super.key,
    required this.routeName,
    required this.onPressed(),
    required this.backgroundColor,
    required this.textColor,
  });

  final String routeName;
  final void Function() onPressed;
  final Color backgroundColor;
  final Color textColor;

  @override
  State<NavigationButton> createState() => _NavigationButtonState();
}

class _NavigationButtonState extends State<NavigationButton> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) => setState(() => _isHovering = true),
      onExit: (event) => setState(() => _isHovering = false),
      child: GestureDetector(
        onTap: widget.onPressed,
        child: Container(
          margin: const EdgeInsets.all(8),
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: _isHovering
                ? widget.backgroundColor.withOpacity(0.8)
                : widget.backgroundColor,
          ),
          child: SizedBox(
            // add background color
            height: 50,
            width: 200,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                widget.routeName,
                style: TextStyle(
                  color: widget.textColor,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
