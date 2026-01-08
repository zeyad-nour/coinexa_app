import 'package:coinexa_app/features/convert_Coins/data/model/convert_model/coinModel.dart';
import 'package:coinexa_app/features/convert_Coins/presentation/mange_state/cubit/convert_cubit_cubit.dart';
import 'package:coinexa_app/features/convert_Coins/presentation/view/widget/coinInfoCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConvertFieldsSection extends StatefulWidget {
  const ConvertFieldsSection({super.key});

  @override
  State<ConvertFieldsSection> createState() => _ConvertFieldsSectionState();
}

class _ConvertFieldsSectionState extends State<ConvertFieldsSection> {
  List<Coin> coinsList = []; // هتتملي من API
  Coin? fromCoin;
  Coin? toCoin;

  double amount = 1;

  @override
  void initState() {
    super.initState();
    _loadCoins();
  }

  Future<void> _loadCoins() async {
    try {
      final fetchedCoins = await context.read<ConvertCubit>().fetchCoins();
      setState(() {
        coinsList = fetchedCoins;
        fromCoin = coinsList.isNotEmpty ? coinsList[0] : null;
        toCoin = coinsList.length > 1 ? coinsList[1] : null;
      });
      if (fromCoin != null && toCoin != null) _convert();
    } catch (e) {
      // ممكن تضيف هنا عرض رسالة خطأ
      debugPrint('Error loading coins: $e');
    }
  }

  void _convert() {
    if (fromCoin == null || toCoin == null) return;
    context.read<ConvertCubit>().convert(
          fromCoinId: fromCoin!.id,
          toCoinId: toCoin!.id,
          amount: amount,
        );
  }

  @override
  Widget build(BuildContext context) {
    if (fromCoin == null || toCoin == null) {
      return const Center(child: CircularProgressIndicator());
    }

    return Column(
      children: [
        /// FROM
        CoinInputCard(
          coin2: fromCoin!,
          value: amount.toString(),
          onTap: () => _selectCoin(
            onSelected: (coin) {
              setState(() => fromCoin = coin);
              _convert();
            },
          ),
        ),
        const SizedBox(height: 20),

        /// TO
        BlocBuilder<ConvertCubit, ConvertCubitState>(
          builder: (context, state) {
            if (state is ConvertLoading) {
              return const CircularProgressIndicator();
            }

            if (state is ConvertSuccess) {
              return CoinInputCard(
                coin2: toCoin!,
                value: state.result.toStringAsFixed(6),
                onTap: () => _selectCoin(
                  onSelected: (coin) {
                    setState(() => toCoin = coin);
                    _convert();
                  },
                ),
              );
            }

            if (state is ConvertFailure) {
              return Text(state.error);
            }

            return CoinInputCard(coin2: toCoin!, value: '0.0', onTap: () {});
          },
        ),
      ],
    );
  }

  void _selectCoin({required Function(Coin) onSelected}) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (_) {
        return ListView.builder(
          itemCount: coinsList.length,
          itemBuilder: (context, index) {
            final coin = coinsList[index];
            return ListTile(
              leading: Image.network(
                coin.icon,
                width: 32,
                errorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.error, size: 32),
              ),
              title: Text('${coin.symbol.toUpperCase()} - \$${coin.usdPrice?.toStringAsFixed(2) ?? '0.00'}'),
              subtitle: Text(coin.name),
              onTap: () {
                onSelected(coin);
                Navigator.pop(context);
              },
            );
          },
        );
      },
    );
  }
}
