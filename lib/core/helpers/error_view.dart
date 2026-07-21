import 'package:flutter/material.dart';
import 'package:spot/core/error/faliure.dart';
import 'package:spot/core/error/general_failure.dart';
import 'package:spot/core/error/server_failure.dart';
import 'package:spot/core/utils/color_manager.dart';
import 'package:spot/core/utils/font_manager.dart';
import 'package:spot/core/utils/height_manger.dart';
import 'package:spot/core/utils/raduis_manager.dart';
import 'package:spot/core/utils/text_manager.dart';

class ErrorView extends StatelessWidget {
  final Failure failure;
  final VoidCallback onRetry;

  const ErrorView({super.key, required this.failure, required this.onRetry});

  IconData get icon => switch (failure) {
    ServerFailure failure when failure.statusCode == 404 => Icons.search_off,
    ServerFailure failure when failure.statusCode == 401 => Icons.lock_outline,
    ServerFailure _ => Icons.cloud_off,
    GeneralFailure _ when !failure.canRetry => Icons.broken_image_outlined,
    _ => Icons.warning_amber_rounded,
  };

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: HeightManager.h20),
        Icon(icon, size: FontManager.f65, color: ColorManager.greyColor),
        const SizedBox(height: HeightManager.h16),
        Text(
          failure.userMessage,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: FontManager.f16),
        ),
        const SizedBox(height: HeightManager.h20),
        if (failure.canRetry)
          ElevatedButton.icon(
            onPressed: onRetry,
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorManager.primaryColor,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(RaduisManager.r10),
              ),
            ),
            icon: const Icon(Icons.refresh),
            label: const Text(TextManager.tryAgain),
          ),
      ],
    );
  }
}
