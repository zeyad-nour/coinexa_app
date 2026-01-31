// ignore_for_file: unnecessary_import, deprecated_member_use, use_build_context_synchronously

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:coinexa_app/conistant.dart';
import 'package:coinexa_app/core/utils/widgets/lodaingWidget.dart';
import 'package:coinexa_app/core/utils/widgets/styles.dart';
import 'package:coinexa_app/features/compare/presentation/state_mange/cubit/compare_cubit.dart';
import 'package:coinexa_app/features/compare/presentation/view/compare_screen.dart';
import 'package:coinexa_app/features/details/presentation/view/details_screen.dart';
import 'package:coinexa_app/features/home/data/Model/coins_model/coins_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListviewcoinsWidget extends StatelessWidget {
  final String imagecoin;
  final String title;
  final String coinsID;
  final String subtitle;
  final double praic;
  final double rate;

  const ListviewcoinsWidget({
    super.key,
    required this.imagecoin,
    required this.title,
    required this.subtitle,
    required this.praic,
    required this.rate,
    required this.coinsID,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Card(
        color: kPrimaryColors,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(60)),
        child: InkWell(
          borderRadius: BorderRadius.circular(60),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => DetailsScreen(
                  price: praic,
                  rate: rate,
                  headtitle: title,
                  coinId: coinsID,
                  imageUrl: imagecoin,
                  name: title,
                ),
              ),
            );
          },
          onLongPress: () {
            Future.delayed(Duration.zero, () {
              AwesomeDialog(
                context: context,
                dialogType: .noHeader,
                dialogBackgroundColor: compareColor.withOpacity(0.5),
                barrierColor: Colors.black.withOpacity(0.3),
                borderSide: const BorderSide(color: compareColor, width: 1.5),
                width: MediaQuery.sizeOf(context).width * 0.87,
                buttonsBorderRadius: const BorderRadius.all(Radius.circular(2)),
                dismissOnTouchOutside: true,
                dismissOnBackKeyPress: false,

                headerAnimationLoop: false,
                animType: AnimType.leftSlide,
                btnOkText: "Yes",

                desc: 'Do you want to compare this currency?',
                descTextStyle: Style.priceCrypto_TextStyle.copyWith(
                  fontSize: 22,
                  color: Colors.white,
                ),
                showCloseIcon: true,
                closeIcon: Icon(Icons.close, color: colorSelectIteamRange),

                btnOkColor: compareColor.withOpacity(0.6),

                btnOkOnPress: () {
                  final coin = CoinsModel(
                    id: coinsID,
                    name: title,
                    symbol: subtitle,

                    currentPrice: praic,
                    priceChange24h: rate,
                    image: imagecoin,
                  );

                  final compareCubit = context.read<CompareCubit>();
                  compareCubit.addCoin(coin);

                  if (compareCubit.compareList.length == 2) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => BlocProvider.value(
                          value: compareCubit,
                          child: CompareScreen(),
                        ),
                      ),
                    );

                    // compareCubit.clear();
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          '$title added to comparison. Choose another coin.',
                          style: Style.TextStyle18,
                        ),
                        backgroundColor: compareColor.withOpacity(0.7),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  }
                },
              ).show();
            });
          },
          child: ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: CachedNetworkImage(
                imageUrl: imagecoin,
                width: 45,
                height: 45,
                fit: BoxFit.cover,
                placeholder: (context, url) =>
                    SizedBox(width: 20, height: 20, child: Lodaingwidget()),
                errorWidget: (context, url, error) =>
                    const Icon(Icons.error, color: Colors.red),
              ),
            ),
            title: Text(title, style: Style.TextStyle18.copyWith(fontSize: 18)),
            subtitle: Row(children: [Text(subtitle)]),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "\$${praic.toStringAsFixed(2)}",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: pTextColor,
                  ),
                ),
                Expanded(
                  child: Text(
                    "${rate.toStringAsFixed(2)}%",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w900,
                      color: rate >= 0 ? Colors.green : Colors.red,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
