import 'package:coinexa_app/features/details/presentation/view/widgets/back_icon_widget.dart';
import 'package:coinexa_app/features/details/presentation/view/widgets/backgroun_page_details.dart';
import 'package:coinexa_app/features/details/presentation/view/widgets/head_title_widget.dart';
import 'package:coinexa_app/features/details/presentation/view/widgets/left_icon_widget.dart';
import 'package:flutter/material.dart';

class DetailsScreenBody extends StatelessWidget {
  const DetailsScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BackgrounPageDetails(),
          Positioned(top: 60, left: 20, child: BackIconWidget()),
          Positioned(
            top: 80,
            left: 150,
            child: HeadTitleWidget(headTitle: "Etherium (ETH)"),
          ),
          Positioned(top: 60, right: 20, child: LeftIconWidget()),
        ],
      ),
    );
  }
}
