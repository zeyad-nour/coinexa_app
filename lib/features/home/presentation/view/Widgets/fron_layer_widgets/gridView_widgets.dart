import 'package:coinexa_app/core/utils/widgets/assets.dart';
import 'package:coinexa_app/features/home/presentation/view/Widgets/fron_layer_widgets/options_card_widgets.dart';
import 'package:flutter/cupertino.dart';

class GridviewWidgets extends StatelessWidget {
  const GridviewWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 4,
        crossAxisSpacing: 20,

        mainAxisSpacing: 10,
      ),

      children: [
        OptionsCardWidgets(
          imagename: AssetsData.watchlists,
          title: "Calculator",
        ),
        OptionsCardWidgets(imagename: AssetsData.compare, title: "Compare"),
        OptionsCardWidgets(imagename: AssetsData.convert, title: "Convert"),
        OptionsCardWidgets(
          imagename: AssetsData.pricealert,
          title: "pricealert",
        ),
      ],
    );
  }
}
