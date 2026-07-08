import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

/// Growth Guardian mascot — renders one of the five brand-approved mascots
/// from the asset bundle. A subtle halo can be painted behind the image.
class GuardianMascot extends StatelessWidget {
  const GuardianMascot({
    super.key,
    this.size = 80,
    this.expression = GuardianExpression.calm,
    this.withHalo = false,
    this.variant = GuardianMascotVariant.koalaBasic,
  });

  final double size;
  final GuardianExpression expression;
  final bool withHalo;
  final GuardianMascotVariant variant;

  String get _assetPath => switch (variant) {
        GuardianMascotVariant.potStitch => 'assets/mascot/pot_stitch.png',
        GuardianMascotVariant.koalaBasic => 'assets/mascot/koala_basic.png',
        GuardianMascotVariant.koalaAdventure =>
          'assets/mascot/koala_adventure.png',
        GuardianMascotVariant.forestFlower =>
          'assets/mascot/forest_flower.png',
        GuardianMascotVariant.forestWatering =>
          'assets/mascot/forest_watering.png',
      };

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          if (withHalo)
            Container(
              width: size,
              height: size,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    AppColors.primaryContainer.withValues(alpha: 0.55),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          // Cover the whole area so the image always fills the circle, even
          // when the asset has transparent padding. The parent should wrap
          // us in a clipBehavior: Clip.antiAlias circle when it needs a hard
          // round mask.
          Image.asset(
            _assetPath,
            width: size,
            height: size,
            fit: BoxFit.cover,
            alignment: Alignment.center,
            errorBuilder: (context, error, stack) => _FallbackMascot(
              size: size,
              expression: expression,
            ),
          ),
        ],
      ),
    );
  }
}

/// Which mascot illustration to draw. Each variant has its own art and
/// fits a different role in the app.
enum GuardianMascotVariant {
  /// Round blue Stitch-like creature in a clay pot with a daisy crown.
  /// Used on the onboarding "Meet your Guardian" screen.
  potStitch,

  /// 3D-rendered gray koala in a blue t-shirt — small avatar.
  koalaBasic,

  /// Koala in a yellow/blue adventure outfit with a leaf badge —
  /// profile/identity moments.
  koalaAdventure,

  /// Blue fluffy forest spirit reaching for a glowing lotus flower.
  /// Journal / sanctuary hero.
  forestFlower,

  /// Blue fluffy forest spirit watering a sprout with a copper can.
  /// Today / add-task hero.
  forestWatering,
}

enum GuardianExpression { calm, happy, proud }

/// Fallback drawing used only if the asset fails to load at runtime.
class _FallbackMascot extends StatelessWidget {
  const _FallbackMascot({required this.size, required this.expression});

  final double size;
  final GuardianExpression expression;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColors.primaryContainer.withValues(alpha: 0.35),
        shape: BoxShape.circle,
      ),
      child: Icon(
        switch (expression) {
          GuardianExpression.happy => Icons.sentiment_very_satisfied_rounded,
          GuardianExpression.proud => Icons.emoji_events_rounded,
          GuardianExpression.calm => Icons.face_retouching_natural_rounded,
        },
        color: AppColors.primary,
        size: size * 0.55,
      ),
    );
  }
}
