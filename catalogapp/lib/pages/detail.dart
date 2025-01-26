import 'package:catalogapp/models/catalog.dart';
import 'package:catalogapp/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class Detail extends StatefulWidget {
  final Item catalog;
  const Detail({
    Key? key,
    required this.catalog,
  }) : super(key: key);

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  // Function to show the confirmation dialog for 2 seconds
  void _showConfirmation() {
    showDialog(
      context: context,
      barrierDismissible: false, // User cannot dismiss the dialog
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Vx.white,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.check_circle,
                  color: Colors.black,
                  size: 50,
                ),
                SizedBox(height: 16),
                Text(
                  'Added to Cart',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );

    // Close the dialog after 2 seconds
    Future.delayed(Duration(seconds: 1), () {
      Navigator.of(context).pop();
    });
  }

  @override
  Widget build(BuildContext context) {
    final catalog = widget.catalog;

    return Scaffold(
      appBar: AppBar(
        title: "Product Details".text.bold.make(),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Themes.creamcolor,
                Themes.darkBlueColor.withOpacity(0.1),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Hero Image
                Hero(
                  tag: Key(catalog.id.toString()),
                  child: Container(
                    margin: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          blurRadius: 10,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.network(
                        catalog.image,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: 300,
                      ),
                    ),
                  ),
                ),

                // Product Info Card
                Container(
                  padding: const EdgeInsets.all(16),
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        blurRadius: 15,
                        offset: Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Name and Description
                      catalog.name.text.xl4.bold
                          .color(Themes.darkBlueColor)
                          .make(),
                      SizedBox(height: 8),
                      catalog.desc.text.lg.color(Colors.grey.shade700).make(),
                      SizedBox(height: 16),

                      // Price
                      "\$${catalog.price}"
                          .text
                          .bold
                          .xl3
                          .color(Themes.darkBlueColor)
                          .make(),

                      SizedBox(
                        height: 15,
                      ),
                      catalog.detail.text.lg.color(Colors.grey.shade600).make(),
                    ],
                  ),
                ),

                // Button Section
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed:
                      _showConfirmation, // Trigger the confirmation modal
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Themes.darkBlueColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 12),
                    elevation: 10,
                  ),
                  child: "Add to Cart".text.white.bold.xl.make(),
                ),

                // Spacer
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
