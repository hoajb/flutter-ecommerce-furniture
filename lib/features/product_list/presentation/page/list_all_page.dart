import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_furniture/core/ext/buildcontext_ext.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../config/theme/styles.dart';

class ListAllPage extends StatelessWidget {
  ListAllPage({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> items = [
    {
      'image': 'assets/images/product-chair-4-removebg.png',
      'title': 'Hammock Chair',
      'starPoint': 4.4,
      'sold': '2.7k sold',
      'price': '\$169.95',
    },
    {
      'image': 'assets/images/product-chair-1-removebg.png',
      'title': 'Hammock Chair',
      'starPoint': 4.2,
      'sold': '2.7k sold',
      'price': '\$129.95',
    },
    {
      'image': 'assets/images/product-chair-2-removebg.png',
      'title': 'Hammock Chair',
      'starPoint': 4.1,
      'sold': '2.7k sold',
      'price': '\$69.00',
    },
    {
      'image': 'assets/images/product-chair-1-removebg.png',
      'title': 'Hammock Chair',
      'starPoint': 4.0,
      'sold': '2.7k sold',
      'price': '\$69.95',
    },
    {
      'image': 'assets/images/product-chair-4-removebg.png',
      'title': 'Hammock Chair',
      'starPoint': 4.4,
      'sold': '2.7k sold',
      'price': '\$99.95',
    },
    {
      'image': 'assets/images/product-chair-4-removebg.png',
      'title': 'Hammock Chair',
      'starPoint': 4.4,
      'sold': '2.7k sold',
      'price': '\$210.50',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = context.isDarkModeEnabled;
    return GridView.builder(
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12.0,
          mainAxisSpacing: 12.0,
          childAspectRatio: 2 / 3.3),
      itemCount: items.length,
      // Number of items in the grid
      itemBuilder: (context, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color:
                    isDark ? Styles.itemColorBgDark : Styles.itemColorBgLight,
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: AspectRatio(
                aspectRatio: 1,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Image.asset(
                    items[index]['image'],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              items[index]['title'],
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                const FaIcon(FontAwesomeIcons.starHalfStroke, size: 18),
                Text(
                  items[index]['starPoint'].toString(),
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 8),
                const Text(
                  '|',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 8),
                Container(
                    decoration: BoxDecoration(
                      color: isDark
                          ? Styles.itemColorBgDark
                          : Styles.itemColorBgLight,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Text(
                          items[index]['sold'],
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ))),
              ],
            ),
            Text(
              items[index]['price'],
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ],
        );
      },
    );
  }
}
