import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

List<Effect<dynamic>>? effectsAnimateColumn = [
  const FadeEffect(
    duration: Duration(milliseconds: 500),
  ),
  const SlideEffect(
    end: Offset.zero,
    duration: Duration(milliseconds: 500),
    curve: Curves.ease,
    begin: Offset(0, 0.30),
  ),
];

Duration intervalAnimateColumn = 200.ms;
