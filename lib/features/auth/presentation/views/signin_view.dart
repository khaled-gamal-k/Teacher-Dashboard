import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/extensions/context_extensions.dart';
import '../widgets/puls_glow_container.dart';
import '../widgets/signin_form_card.dart';

class SigninView extends StatelessWidget {
  const SigninView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //? BLUE GLOW
          _buildBlueGlowCircle(context),

          //* CYAN GLOW
          _buildCyenGlowCircle(context),

          //! BLUR LAYER
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
              child: Container(color: AppColors.primaryBackground.withValues(alpha: 0.2)),
            ),
          ),

          //* SIGNIN FORM
          const Center(child: SignInFormCard()),
        ],
      ),
    );
  }

  Widget _buildCyenGlowCircle(BuildContext context) {
    return Positioned(
      left: context.width * .24,
      bottom: context.height * .25,
      child: const PulseGlowContainer(color: AppColors.glowCyan, size: 150)
          .animate(onPlay: (c) => c.repeat(reverse: true))
          .scale(
            begin: const Offset(1.2, 1.2),
            end: const Offset(1, 1),
            duration: 1500.ms,
            curve: Curves.easeInOut,
          )
          .fade(begin: 1, end: 0.3)
          .blurXY(begin: 0, end: 5),
    );
  }

  Widget _buildBlueGlowCircle(BuildContext context) {
    return Positioned(
      right: context.width * .24,
      top: context.height * .25,
      child: const PulseGlowContainer(color: AppColors.glowBlue, size: 150)
          .animate(onPlay: (c) => c.repeat(reverse: true))
          .scale(
            begin: const Offset(1, 1),
            end: const Offset(1.2, 1.2),
            duration: 1500.ms,
            curve: Curves.easeInOut,
          )
          .fade(begin: 0.3, end: 1)
          .blurXY(begin: 0, end: 5),
    );
  }
}
