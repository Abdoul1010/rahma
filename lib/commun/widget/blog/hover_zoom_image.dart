import 'package:flutter/material.dart';

class HoverZoomImageWithButton extends StatefulWidget {
  final String imageUrl;
  final VoidCallback onTap;

  const HoverZoomImageWithButton({
    super.key,
    required this.imageUrl,
    required this.onTap,
  });

  @override
  State<HoverZoomImageWithButton> createState() => _HoverZoomImageWithButtonState();
}

class _HoverZoomImageWithButtonState extends State<HoverZoomImageWithButton> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: Stack(
        alignment: Alignment.center,
        children: [
          AnimatedScale(
            scale: _hovering ? 1.05 : 1.0,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                widget.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          AnimatedOpacity(
            opacity: _hovering ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 300),
            child: IconButton(onPressed: widget.onTap, icon: Icon(Icons.open_in_new, size: 28, color: Colors.green,),),
            /*GestureDetector(
              onTap: widget.onTap,
              child: Container(
                width: 48,
                height: 48,
                decoration: const BoxDecoration(
                  //color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.open_in_new, size: 28, color: Colors.green),
              ),
            ),*/
          ),
        ],
      ),
    );
  }
}
