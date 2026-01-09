import 'package:coinexa_app/conistant.dart';
import 'package:coinexa_app/core/utils/widgets/styles.dart';
import 'package:flutter/cupertino.dart';

class HeadTitleWidget extends StatelessWidget {
  final String headTitle;
  const HeadTitleWidget({super.key, required this.headTitle});

  @override
  Widget build(BuildContext context) {
    return Text(
      headTitle,
      style: Style.headTitle_TextStyle.copyWith(color: kPrimaryColorsTow),
    );
  }
}
