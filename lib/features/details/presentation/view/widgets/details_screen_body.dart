import 'package:coinexa_app/features/details/presentation/view/widgets/backgroun_page_details.dart';
import 'package:flutter/material.dart';

class DetailsScreenBody extends StatelessWidget {
  const DetailsScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      body: Stack(children: [ 
        BackgrounPageDetails()
      ],),
    );
  }
}
