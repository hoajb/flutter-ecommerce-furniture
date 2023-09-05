import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_furniture/core/ext/buildcontext_ext.dart';

import '../../../config/theme/styles.dart';
import '../../../core/utils/number_utils.dart';
import '../../../core/wigets/action_button.dart';
import '../../../core/wigets/circle_background_widget.dart';
import '../../../core/wigets/product_image.dart';
import '../../product_details/data/mock_data_repo.dart';
import '../../product_list/data/mock_product_list.dart';
import 'order_page.dart';

final List<Map<String, dynamic>> _orderProductList =
    recommendedProductList.sublist(5, 10);

class CompletedOrderList extends StatelessWidget {
  CompletedOrderList({super.key});

  final _listColors = listProductColorsMap.entries.toList();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.only(top: 8),
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return _buildOrderItem(index);
        });
  }

  Widget _buildOrderItem(int index) {
    if (index > _orderProductList.length - 1) return Container();
    Map<String, dynamic> item = _orderProductList[index];
    return OrderRowProductItem(
      product: item,
      selectedColor: _listColors[index].value,
      selectedColorName: _listColors[index].key,
    );
  }
}

class OrderRowProductItem extends StatelessWidget {
  final Map<String, dynamic> product;
  final Color selectedColor;
  final String selectedColorName;

  const OrderRowProductItem({
    super.key,
    required this.product,
    required this.selectedColor,
    required this.selectedColorName,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = context.isDarkModeEnabled;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: isDark
              ? Styles.textFieldBackgroundDark
              : Styles.textFieldBackgroundLight,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              ProductImage(size: orderRowSize, path: product['image']),
              const SizedBox(width: 16),
              Expanded(child: _buildRightContent()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRightContent() {
    return SizedBox(
      height: orderRowSize,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            product['title'],
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          _buildColorContent(),
          Container(
            decoration: BoxDecoration(
                color: Styles.greyColorLight,
                borderRadius: BorderRadius.circular(8)),
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: const Text(
              'Completed',
              style: TextStyle(fontSize: 12),
            ),
          ),
          _buildPriceAndActionButton()
        ],
      ),
    );
  }

  Widget _buildPriceAndActionButton() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '\$${currencyFormat.format(product['price'])}',
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        ActionButton(text: 'Buy Again', height: 30, onPressed: () {})
      ],
    );
  }

  Widget _buildColorContent() {
    return Row(
      children: [
        CircularBackgroundWidget(
          size: 24,
          backgroundColor: selectedColor,
          child: null,
        ),
        const SizedBox(width: 8),
        Text(selectedColorName, style: const TextStyle(fontSize: 14)),
        const SizedBox(width: 8),
        const Text('|', style: TextStyle(fontSize: 14)),
        const SizedBox(width: 8),
        const Text('Qty = 1', style: TextStyle(fontSize: 14))
      ],
    );
  }
}
