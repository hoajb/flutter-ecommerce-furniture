import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_furniture/core/ext/buildcontext_ext.dart';
import 'package:flutter_ecommerce_furniture/core/wigets/action_button.dart';
import 'package:flutter_ecommerce_furniture/features/product_details/data/mock_data_repo.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../config/theme/styles.dart';
import '../../../core/utils/number_utils.dart';
import '../../../core/wigets/circle_background_widget.dart';
import '../../../core/wigets/product_image.dart';
import '../../product_list/data/mock_product_list.dart';
import 'active_order_list.dart';
import 'completed_order_list.dart';

const orderRowSize = 120.0;

class OrderPage extends StatelessWidget {
  OrderPage({super.key});

  final _listColors = listProductColorsMap.entries.toList();

  final List<Map<String, dynamic>> _orderProductList =
      recommendedProductList.sublist(0, 6);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      color: Colors.transparent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 56,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'My Order',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              FaIcon(FontAwesomeIcons.searchengin)
            ],
          ),
          const SizedBox(height: 8),
          Expanded(
              child: DefaultTabController(
            length: 2,
            child: Column(
              children: [
                TabBar(
                  indicatorColor: Styles.blackColor,
                  splashBorderRadius: BorderRadius.circular(8),
                  tabs: const [
                    Tab(text: 'Active'),
                    Tab(text: 'Completed'),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      ActiveOrderList(),
                      CompletedOrderList(),
                    ],
                  ),
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }

  Widget _buildActiveOrderList() {
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

class OrderRowProductItem extends StatefulWidget {
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
  State<OrderRowProductItem> createState() => _OrderRowProductItemState();
}

class _OrderRowProductItemState extends State<OrderRowProductItem> {
  final int _numberItem = 1;
  double _itemPrice = 0.0;

  @override
  void initState() {
    _itemPrice = widget.product['price'] * _numberItem;
    super.initState();
  }

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
              ProductImage(size: orderRowSize, path: widget.product['image']),
              const SizedBox(width: 16),
              Expanded(child: _buildRightContent()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRightContent() {
    return Container(
      height: orderRowSize,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            widget.product['title'],
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
              'In Delivery',
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
          '\$${currencyFormat.format(_itemPrice)}',
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        ActionButton(text: 'Track Order', height: 30, onPressed: () {})
      ],
    );
  }

  Widget _buildColorContent() {
    return Row(
      children: [
        CircularBackgroundWidget(
          size: 24,
          backgroundColor: widget.selectedColor,
          child: null,
        ),
        const SizedBox(width: 8),
        Text(widget.selectedColorName, style: const TextStyle(fontSize: 14)),
        const SizedBox(width: 8),
        const Text('|', style: TextStyle(fontSize: 14)),
        const SizedBox(width: 8),
        const Text('Qty = 1', style: TextStyle(fontSize: 14))
      ],
    );
  }
}
