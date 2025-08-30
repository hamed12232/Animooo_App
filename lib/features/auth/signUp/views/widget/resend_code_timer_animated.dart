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
  State<ResendCodeTimerAnimated> createState() =>
      _ResendCodeTimerAnimatedState();
}

class _ResendCodeTimerAnimatedState extends State<ResendCodeTimerAnimated>
    with SingleTickerProviderStateMixin {
  late AnimationController _c;

  @override
  void initState() {
    super.initState();
    _c = AnimationController(vsync: this, duration: widget.startFrom)
      ..forward();
  }

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  String _format() {
    final progress = _c.value; // بين 0 و 1
    final elapsed = widget.startFrom * progress;
    final left = widget.startFrom - elapsed;
    final clamped = left.isNegative ? Duration.zero : left;

    final m = clamped.inMinutes.remainder(60).toString().padLeft(2, '0');
    final s = clamped.inSeconds.remainder(60).toString().padLeft(2, '0');
    return '$m:$s';
  }

  void _resend() {
    if (_c.isAnimating) return; // يمنع الدوبلكيت
    widget.onResend();
    _c.reset();
    _c.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _c,
      builder: (context, _) {
        final done = _c.isCompleted;
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (!done)
              Text(
                'Resend Code In ${_format()}',
                style: const TextStyle(color: Colors.grey),
              )
            else
              TextButton(
                onPressed: _resend,
                child: const Text(
                  'Resend Code',
                  style: TextStyle(color: AppColors.kprimaryColor),
                ),
              ),
          ],
        );
      },
    );
  }
}
