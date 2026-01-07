// ignore_for_file: deprecated_member_use

import 'package:coinexa_app/conistant.dart';
import 'package:coinexa_app/features/home/presentation/mange_state/cubit/home_cubit_cubit.dart';
import 'package:coinexa_app/features/home/presentation/view/Widgets/fron_layer_widgets/listviewCoins_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OutmostWidgets extends StatefulWidget {
  const OutmostWidgets({super.key});

  @override
  State<OutmostWidgets> createState() => _OutmostWidgetsState();
}

class _OutmostWidgetsState extends State<OutmostWidgets> {
  @override
  void initState() {
    super.initState();
    context.read<HomeCubitCubit>().featchTrending();
  }

  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height * 0.8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
        color: kPrimaryColors,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 50,
            offset: Offset(0, 25),
          ),
        ],
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Trending Title
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Text(
                "Trending",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),

            // هنا نستخدم BlocBuilder عشان نجيب البيانات من Cubit
            BlocBuilder<HomeCubitCubit, HomeCubitState>(
              builder: (context, state) {
                if (state is HomeCubitLoding) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is HomeCubitFailure) {
                  return Center(child: Text(state.errorMessage));
                } else if (state is HomeCubitSuccess) {
                  final coins = state.coinsList;
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: coins.length,
                    itemBuilder: (context, index) {
                      final coin = coins[index];
                      return ListviewcoinsWidget(
                        imagecoin: coin.image ?? '',
                        title: coin.name ?? '',
                        subtitle: coin.symbol?.toUpperCase() ?? '',
                        praic: coin.currentPrice?.toDouble() ?? 0,
                        rate: coin.priceChangePercentage24h?.toDouble() ?? 0,
                        lenght: coins.length, // مش ضروري هنا
                      );
                    },
                  );
                } else {
                  return SizedBox();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
