import 'package:coinexa_app/features/favorite/presentation/view/widget/Favorite_card.dart';
import 'package:flutter/material.dart';

class Listviewfavoritecard extends StatelessWidget {
  const Listviewfavoritecard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 1,
      height: MediaQuery.sizeOf(context).height * 1,
      decoration: BoxDecoration(color: Colors.blueGrey.withOpacity(0.06)),
      child: ListView.builder(
        itemCount: 50,
        itemBuilder: (context, index) {
          return FavoriteCard();
        },
      ),
    );
  }
}
