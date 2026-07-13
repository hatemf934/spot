import 'package:flutter/material.dart';
import 'package:spot/feature/home/presentation/view/widgets/action_button_header.dart';
import 'package:spot/feature/home/presentation/view/widgets/title_welcome_header.dart';

class WelcomeHeader extends StatelessWidget {
  const WelcomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(children: const [TitleWelcomeHeader(), ActionButtonHeader()]);
  }
}
