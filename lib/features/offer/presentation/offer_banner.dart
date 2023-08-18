import 'package:flutter/material.dart';

import '../../home/data/banner_entity.dart';

class OfferBanner extends StatelessWidget {
  final BannerEntity item;

  const OfferBanner({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 20, 20, 10),
      child: Row(
        children: [
          Expanded(
            flex: 6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.discount,
                  style: const TextStyle(
                      fontSize: 32, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  item.title,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(item.message),
              ],
            ),
          ),
          Expanded(
            flex: 4,
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
