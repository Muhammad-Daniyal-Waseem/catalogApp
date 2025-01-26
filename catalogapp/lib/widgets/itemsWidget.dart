import 'package:catalogapp/models/catalog.dart';
import 'package:flutter/material.dart';

class Itemswidget extends StatelessWidget {
  final Item item;

  const Itemswidget({
    Key? key, // Use nullable type for Key
    required this.item, // Mark this parameter as required
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        tileColor: Colors.white,
        onTap: () {
          print("object");
        },
        leading: Image.network(item.image),
        title: Text(item.name),
        subtitle: Text(
          item.desc,
          style: TextStyle(fontSize: 12),
        ),
        trailing: Text(
          "\$${item.price}",
          textScaleFactor: 1.5,
          style:
              TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
