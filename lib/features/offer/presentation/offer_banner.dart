import 'package:flutter/material.dart';

import '../../home/data/banner_entity.dart';

class OfferBanner extends StatelessWidget {
  final BannerEntity item;

  const OfferBanner({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 20, 20, 20),
      child: Row(
        children: [
          Expanded(
            flex: 65,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  item.discount,
                  style: const TextStyle(
                      fontSize: 28, fontWeight: FontWeight.bold),
                ),
                Text(
                  item.title,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  item.message,
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.normal),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 35,
            child: Image.asset(
              item.assetProductImage,
              width: 180,
              height: 180,
            ),
          ),
        ],
      ),
    );
  }
}
