import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_furniture/config/theme/styles.dart';
import 'package:flutter_ecommerce_furniture/core/ext/buildcontext_ext.dart';
import 'package:flutter_ecommerce_furniture/features/product_details/presentation/widgets/checkout_group_button.dart';
import 'package:flutter_ecommerce_furniture/features/product_details/presentation/widgets/color_selection.dart';
import 'package:flutter_ecommerce_furniture/features/product_details/presentation/widgets/number_selection.dart';
import 'package:flutter_ecommerce_furniture/features/product_details/presentation/widgets/product_banners.dart';
import 'package:flutter_ecommerce_furniture/features/product_details/presentation/widgets/product_group_title.dart';

import '../../../core/wigets/expandable_text.dart';
import '../data/mock_data_repo.dart';

class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage({super.key});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  int _numberItem = 1;

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> product =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    final isDark = context.isDarkModeEnabled;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Styles.itemColorBgLight,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          color: Styles.itemColorBgLight,
          child: Column(
            children: [
              ProductBanners(
                  imagePaths: List.generate(5, (index) => product['image'])),
              const SizedBox(height: 20),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  color: isDark ? Styles.blackColor : Styles.whiteColor,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ProductGroupTitle(
                        product: product,
                      ),
                      const SizedBox(height: 8),
                      const Divider(),
                      const SizedBox(height: 8),
                      const Text(
                        'Descriptions',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      DescriptionTextWidget(
                        text: mockDescriptionText,
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Color',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      ColorSelection(
                        listColors: listProductColors,
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text(
                            'Quantity',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(width: 20),
                          NumberSelection(
                            onChanged: (number) {
                              setState(() {
                                _numberItem = number;
                              });
                            },
                          )
                        ],
                      ),
                      const SizedBox(height: 8),
                      const Divider(),
                      const SizedBox(height: 8),
                      CheckoutGroupButton(
                        price: product['price'] * _numberItem,
                        onPressed: () {
                          //TODO goto checkout cart
                        },
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
