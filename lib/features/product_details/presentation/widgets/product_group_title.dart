import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_furniture/core/ext/buildcontext_ext.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../config/theme/styles.dart';

class ProductGroupTitle extends StatefulWidget {
  const ProductGroupTitle({super.key, required this.product});

  final Map<String, dynamic> product;

  @override
  State<ProductGroupTitle> createState() => _ProductGroupTitleState();
}

class _ProductGroupTitleState extends State<ProductGroupTitle> {
  bool _isFavorited = false;

  @override
  Widget build(BuildContext context) {
    final isDark = context.isDarkModeEnabled;
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.product['title'],
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            IconButton(
              icon: FaIcon(
                _isFavorited
                    ? FontAwesomeIcons.solidHeart
                    : FontAwesomeIcons.heart,
                size: 18,
                color: isDark ? Styles.whiteColor : Styles.blackColor,
              ),
              onPressed: () {
                setState(() {
                  _isFavorited = !_isFavorited;
                });
              },
            ),
          ],
        ),
        Row(
          children: [
            Container(
                decoration: BoxDecoration(
                  color:
                      isDark ? Styles.itemColorBgDark : Styles.itemColorBgLight,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      widget.product['sold'],
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.normal),
                    ))),
            const SizedBox(width: 8),
            const FaIcon(FontAwesomeIcons.starHalfStroke, size: 16),
            Text(
              widget.product['starPoint'].toString(),
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
            ),
            const SizedBox(width: 8),
            const Text(
              '(6,999 reviews)',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
            ),
          ],
        ),
      ],
    );
  }
}
