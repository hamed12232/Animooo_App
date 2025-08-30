import 'package:animoo_app/core/style/app_colors.dart';
import 'package:flutter/material.dart';

class ResendCodeTimerAnimated extends StatefulWidget {
  const ResendCodeTimerAnimated({
    super.key,
    this.startFrom = const Duration(seconds: 60),
    required this.onResend,
  });

  final Duration startFrom;
  final VoidCallback onResend;

  @override
  State<ResendCodeTimerAnimated> createState() => _ResendCodeTimerAnimatedState();
}

class _ResendCodeTimerAnimatedState extends State<ResendCodeTimerAnimated>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool _isCompleted = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.startFrom)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          setState(() => _isCompleted = true);
        }
      })
      ..forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _resend() {
    if (_controller.isAnimating) return;
    widget.onResend();
    setState(() => _isCompleted = false);
    _controller.reset();
    _controller.forward();
  }

  String _getTimeLeft() {
    final progress = _controller.value;
    final elapsed = widget.startFrom * progress;
    final left = widget.startFrom - elapsed;
    final clamped = left.isNegative ? Duration.zero : left;
    final m = clamped.inMinutes.remainder(60).toString().padLeft(2, '0');
    final s = clamped.inSeconds.remainder(60).toString().padLeft(2, '0');
    return '$m:$s';
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (!_isCompleted)
              Text('Resend Code In ${_getTimeLeft()}', style: const TextStyle(color: Colors.grey))
            else
              TextButton(
                onPressed: _resend,
                child: const Text('Resend Code', style: TextStyle(color: AppColors.kprimaryColor)),
              ),
          ],
        );
      },
    );
  }
}
