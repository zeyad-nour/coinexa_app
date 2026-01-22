import 'package:coinexa_app/core/utils/api_serves.dart';
import 'package:coinexa_app/core/utils/widgets/refreshIcon_widet.dart';
import 'package:coinexa_app/core/utils/widgets/styles.dart';
import 'package:coinexa_app/features/convert_Coins/data/repo/convert_repo_implement.dart';
import 'package:coinexa_app/features/convert_Coins/presentation/mange_state/cubit/convert_cubit_cubit.dart';
import 'package:coinexa_app/features/convert_Coins/presentation/view/widget/bachground_Convert.dart';
import 'package:coinexa_app/features/convert_Coins/presentation/view/widget/convertFieldSection_widget.dart';
import 'package:coinexa_app/core/utils/widgets/back_icon_widget.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConvertCoinsbody extends StatelessWidget {
  const ConvertCoinsbody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BachgroundConvert(),
          Positioned(top: 100, left: 20, child: BackIconWidget()),
          Positioned(top: 100, right: 20, child: RefreshiconWidet()),
          Positioned(
            top: 210,
            left: 60,
            child: Text(
              "Converter",
              style: Style.headTitle_TextStyle.copyWith(fontSize: 40),
            ),
          ),
          Positioned(
            top: 330,
            left: 20,
            right: 20,
            child: BlocProvider(
              create: (context) =>
                  ConvertCubit(ConvertRepoImpl(ApiServes(Dio()))),
              child: const ConvertFieldsSection(),
            ),
          ),
        ],
      ),
    );
  }
}
