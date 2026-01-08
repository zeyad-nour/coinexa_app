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
                coin2.icon,  // <- هنا الرابط من API
                width: 24,
                errorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.error, size: 24), // لو الصورة فشلت
              ),
            ),
            const SizedBox(width: 12),

            /// Coin Info
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      coin2.symbol,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(width: 4),
                    const Icon(Icons.keyboard_arrow_down, size: 18),
                  ],
                ),
                Text(
                  coin2.name,
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey.shade700,
                  ),
                ),
              ],
            ),

            const Spacer(),

            /// Value
            Text(
              value,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
