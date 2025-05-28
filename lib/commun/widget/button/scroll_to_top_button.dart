import 'package:flutter/material.dart';

class ScrollToTopButton extends StatelessWidget {
  final VoidCallback onPressed;
  final double progress;
  final bool visible;

  const ScrollToTopButton({
    super.key,
    required this.onPressed,
    required this.progress,
    required this.visible,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey,
      child: AnimatedSlide(
        offset: visible ? Offset.zero : const Offset(0, 1),
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 300),
          opacity: visible ? 1 : 0,
          child: Positioned(
            bottom: 100,
            right: 100,
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 56,
                  height: 56,
                  child: CircularProgressIndicator(
                    strokeWidth: 3,
                    value: progress.clamp(0.0, 1.0),
                    backgroundColor: Colors.grey.shade300,
                    valueColor: const AlwaysStoppedAnimation<Color>(Colors.blueAccent),
                  ),
                ),
                FloatingActionButton(
                  onPressed: onPressed,
                  //mini: true,
                  backgroundColor: Colors.red,
                  elevation: 4,
                  child: const Icon(Icons.arrow_upward, color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
