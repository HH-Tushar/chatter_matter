import 'package:flutter/material.dart';

class HoverPopup extends StatefulWidget {
  final Widget child;
  final Widget popup;
  // How far above the widget the popup appears

  const HoverPopup({super.key, required this.child, required this.popup});

  @override
  State<HoverPopup> createState() => _HoverPopupState();
}

class _HoverPopupState extends State<HoverPopup> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHover = true),
      onExit: (_) => setState(() => isHover = false),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          widget.child,

          /// Popup
          if (isHover)
            Positioned(
              // left: 0,
              right: 35,
              top: -115,
              child: Material(
               
                color: Colors.transparent,
                child: Container(
                  height: 115,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: widget.popup,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
