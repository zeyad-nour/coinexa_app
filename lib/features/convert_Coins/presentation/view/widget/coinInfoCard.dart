// ignore_for_file: deprecated_member_use

import 'package:coinexa_app/conistant.dart';
import 'package:coinexa_app/core/utils/widgets/styles.dart';
import 'package:coinexa_app/features/convert_Coins/data/model/convert_model/coinModel.dart';
import 'package:flutter/material.dart';

class CoinInputCard extends StatelessWidget {
  final Coin coin2;
  final String value;
  final VoidCallback onTap;

  const CoinInputCard({
    super.key,
    required this.coin2,
    required this.value,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.sizeOf(context).width * 0.92,
        height: MediaQuery.sizeOf(context).height * 0.15,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.75),
          borderRadius: BorderRadius.circular(24),
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 22,
              backgroundColor: Colors.white,
              child: Image.network(
                coin2.icon,
                width: 60,
                errorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.error, size: 24),
              ),
            ),
            const SizedBox(width: 12),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      coin2.symbol,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                    const SizedBox(width: 4),
                    const Icon(
                      Icons.keyboard_arrow_down,
                      size: 30,
                      color: drowpUpRateColor,
                    ),
                  ],
                ),
                Text(
                  coin2.name,
                  style: Style.priceCrypto_TextStyle.copyWith(fontSize: 20),
                ),
              ],
            ),
            const Spacer(),
            Text(
              value,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
