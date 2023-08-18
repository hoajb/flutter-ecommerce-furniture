import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_furniture/config/routes/routes.dart';
import 'package:flutter_ecommerce_furniture/core/ext/buildcontext_ext.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../config/theme/styles.dart';

class ListAllPage extends StatelessWidget {
  final List<Map<String, dynamic>> items;
  final ValueChanged<Map<String, dynamic>>? onItemSelected;

  const ListAllPage({Key? key, required this.items, this.onItemSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        return GestureDetector(
          onTap: () {
            onItemSelected?.call(items[index]);
            Navigator.pushNamed(context, AppRoutes.productDetails,
                arguments: items[index]);
          },
          child: ProductItem(
            item: items[index],
          ),
        );
      },
    );
  }
}

class ProductItem extends StatefulWidget {
  const ProductItem({super.key, required this.item});

  final Map<String, dynamic> item;

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  bool _isFavorited = false;

  @override
  Widget build(BuildContext context) {
    final isDark = context.isDarkModeEnabled;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: isDark ? Styles.itemColorBgDark : Styles.itemColorBgLight,
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: AspectRatio(
            aspectRatio: 1,
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Image.asset(
                    widget.item['image'],
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                      alignment: Alignment.topRight,
                      child: CircleAvatar(
                          radius: 16,
                          backgroundColor: Colors.black,
                          child: IconButton(
                            icon: FaIcon(
                              _isFavorited
                                  ? FontAwesomeIcons.solidHeart
                                  : FontAwesomeIcons.heart,
                              size: 18,
                              color: Styles.whiteColor,
                            ),
                            onPressed: () {
                              setState(() {
                                _isFavorited = !_isFavorited;
                              });
                            },
                          ))),
                )
              ],
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          widget.item['title'],
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Row(
          children: [
            const FaIcon(FontAwesomeIcons.starHalfStroke, size: 18),
            Text(
              widget.item['starPoint'].toString(),
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(width: 8),
            const Text(
              '|',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(width: 8),
            Container(
                decoration: BoxDecoration(
                  color:
                      isDark ? Styles.itemColorBgDark : Styles.itemColorBgLight,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      widget.item['sold'],
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.bold),
                    ))),
          ],
        ),
        Text(
          '\$${widget.item['price']}',
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
