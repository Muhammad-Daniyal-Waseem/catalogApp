import 'package:catalogapp/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogImage extends StatelessWidget {
  final String image;
  const CatalogImage({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Image.network(
        image,
        width: 100,
        height: 100,
        fit: BoxFit.cover,
      ).box.color(Themes.creamcolor).rounded.p8.make(),
    );
  }
}
