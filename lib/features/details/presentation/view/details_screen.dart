import 'package:coinexa_app/features/details/presentation/view/widgets/details_screen_body.dart';
import 'package:flutter/cupertino.dart';

class DetailsScreen extends StatelessWidget {
  final double price;
  final double rate;
  final String headtitle;
  const DetailsScreen({super.key, required this.price, required this.rate, required this.headtitle});

  @override
  Widget build(BuildContext context) {
    return DetailsScreenBody(price: price, rate: rate,headtitle:headtitle ,);
  }
}
