import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:catalogapp/widgets/themes.dart';

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Catalog App".text.xl5.bold.color(Themes.darkBlueColor).make(),
        "Trending products".text.xl2.color(Colors.brown).make(),
        SizedBox(
          height: 20,
        )
      ],
    );
  }
}
