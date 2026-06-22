import 'package:flutter/material.dart';

/// Plays a brief overshoot "pop" whenever [active] transitions to true.
///
/// Used to make completing a habit ring or task slot feel rewarding.
class PopWhen extends StatefulWidget {
  const PopWhen({super.key, required this.active, required this.child});

  final bool active;
  final Widget child;

  @override
  State<PopWhen> createState() => _PopWhenState();
}

class _PopWhenState extends State<PopWhen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 320),
  );

  late final Animation<double> _scale = TweenSequence<double>([
    TweenSequenceItem(tween: Tween(begin: 1.0, end: 1.32), weight: 40),
    TweenSequenceItem(
      tween: Tween(begin: 1.32, end: 1.0)
          .chain(CurveTween(curve: Curves.easeOutBack)),
      weight: 60,
    ),
  ]).animate(_controller);

  @override
  void didUpdateWidget(covariant PopWhen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.active && !oldWidget.active) {
      _controller.forward(from: 0);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(scale: _scale, child: widget.child);
  }
}
