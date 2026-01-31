import 'package:coinexa_app/core/utils/widgets/back_icon_widget.dart';
import 'package:coinexa_app/features/compare/presentation/view/widgets/background_compare.dart';
import 'package:flutter/material.dart';

class CompareBody extends StatelessWidget {
  const CompareBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BackgroundCompare(),
          Positioned(top: 77, left: 20, child: BackIconWidget()),
        ],
      ),
    );
  }
}
