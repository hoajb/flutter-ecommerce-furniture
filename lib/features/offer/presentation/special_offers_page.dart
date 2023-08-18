import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_furniture/core/ext/buildcontext_ext.dart';
import 'package:flutter_ecommerce_furniture/features/offer/presentation/offer_banner.dart';

import '../../home/data/banner_entity.dart';

const _colorBgLight = Color(0xffe4e4e4);
const _colorBgDark = Color(0xff36383e);

final List<BannerEntity> _banners = [
  BannerEntity(
      assetProductImage: 'assets/images/product-chair-1-removebg.png',
      discount: '25%',
      title: 'Today\'s Special!',
      message: 'Get discount for every\norder. only valid for today'),
  BannerEntity(
      assetProductImage: 'assets/images/product-sofa-removebg-1.png',
      discount: '15%',
      title: 'Tuesday\'s Special!',
      message: 'Get discount for every\norder. only valid for Tuesday'),
  BannerEntity(
      assetProductImage: 'assets/images/product-sofa-removebg-2.png',
      discount: '5%',
      title: 'Weekend\'s Special!',
      message: 'Get discount for every\norder. only valid for Weekend'),
  BannerEntity(
      assetProductImage: 'assets/images/product-chair-1-removebg.png',
      discount: '25%',
      title: 'Today\'s Special!',
      message: 'Get discount for every\norder. only valid for today'),
  BannerEntity(
      assetProductImage: 'assets/images/product-sofa-removebg-1.png',
      discount: '15%',
      title: 'Tuesday\'s Special!',
      message: 'Get discount for every\norder. only valid for Tuesday'),
  BannerEntity(
      assetProductImage: 'assets/images/product-sofa-removebg-2.png',
      discount: '5%',
      title: 'Weekend\'s Special!',
      message: 'Get discount for every\norder. only valid for Weekend'),
  BannerEntity(
      assetProductImage: 'assets/images/product-chair-1-removebg.png',
      discount: '25%',
      title: 'Today\'s Special!',
      message: 'Get discount for every\norder. only valid for today'),
  BannerEntity(
      assetProductImage: 'assets/images/product-sofa-removebg-1.png',
      discount: '15%',
      title: 'Tuesday\'s Special!',
      message: 'Get discount for every\norder. only valid for Tuesday'),
  BannerEntity(
      assetProductImage: 'assets/images/product-sofa-removebg-2.png',
      discount: '5%',
      title: 'Weekend\'s Special!',
      message: 'Get discount for every\norder. only valid for Weekend'),
];

class SpecialOfferPage extends StatelessWidget {
  const SpecialOfferPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Special Offers',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
      ),
      body: ListView.separated(
          padding: const EdgeInsets.all(16),
          itemCount: _banners.length,
          separatorBuilder: (BuildContext context, int index) =>
              const SizedBox(height: 16),
          itemBuilder: (BuildContext context, int index) {
            return SpecialOfferItem(
              item: _banners[index],
            );
          }),
    );
  }
}

class SpecialOfferItem extends StatelessWidget {
  final BannerEntity item;

  const SpecialOfferItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final isDark = context.isDarkModeEnabled;
    final screenHeight = MediaQuery.of(context).size.height;
    return SizedBox(
      height: screenHeight * 1 / 6,
      child: Container(
        decoration: BoxDecoration(
          color: isDark ? _colorBgDark : _colorBgLight,
          borderRadius: BorderRadius.circular(30),
        ),
        child: OfferBanner(item: item),
      ),
    );
    ;
  }
}
