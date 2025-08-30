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
 with SingleTickerProviderStateMixin // to make vsync 
 {
  late AnimationController _c; // The animation controller for the timer

  @override
  void initState() {
    super.initState();
    _c = AnimationController(vsync: this, duration: widget.startFrom)..forward();
  }

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  /// Format a duration as a string in the form mm:ss, where mm is the
  /// number of minutes and ss is the number of seconds. If the duration is
  /// negative, it is clamped to 0. If the duration is greater than the
  /// startFrom duration, it is clamped to the startFrom duration. The
  /// mm and ss components are zero-padded to a minimum of 2 digits.
  String _format(Duration d) {
    final left = widget.startFrom - d;
    final clamped = left.isNegative ? Duration.zero : left;
    final m = clamped.inMinutes.remainder(60).toString().padLeft(2, '0');//بيضيف صفر قدام الرقم لو أقل من 10
    final s = clamped.inSeconds.remainder(60).toString().padLeft(2, '0');
    return '$m:$s';
  }

  void _resend() {
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
            if (!done)// if the timer is not done
              Text(
                'Resend Code In ${_format(_c.lastElapsedDuration // the last elapsed duration
                 ?? Duration.zero)}',
                style: const TextStyle(color: Colors.grey),
              )
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
