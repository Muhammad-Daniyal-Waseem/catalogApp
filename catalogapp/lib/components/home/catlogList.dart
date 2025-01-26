import 'package:catalogapp/components/home/catlogItem.dart';
import 'package:catalogapp/models/catalog.dart';
import 'package:flutter/material.dart';

class CatalogList extends StatelessWidget {
  final List<Item> items;
  const CatalogList({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return CatalogItem(catalog: items[index]);
      },
    );
  }
}
