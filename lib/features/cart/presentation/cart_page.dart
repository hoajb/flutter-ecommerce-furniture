import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_furniture/core/ext/buildcontext_ext.dart';
import 'package:flutter_ecommerce_furniture/features/product_details/data/mock_data_repo.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../config/theme/styles.dart';
import '../../../core/utils/number_utils.dart';
import '../../../core/wigets/circle_background_widget.dart';
import '../../../core/wigets/product_image.dart';
import '../../product_details/presentation/widgets/checkout_group_button.dart';
import '../../product_details/presentation/widgets/number_selection.dart';
import '../../product_list/data/mock_product_list.dart';

const _rowSize = 120.0;
const _padding = 12.0;

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final _listColors = listProductColorsMap.entries.toList();

  List<Map<String, dynamic>> _cartProductList =
      recommendedProductList.sublist(0, 6);

  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  double _totalPrice = 0.0;

  void removeItem(int index) {
    _listKey.currentState!.removeItem(
      index,
      (context, animation) => _buildCartItem(index, animation),
    );

    _cartProductList.removeAt(index);
  }

  void refreshList() {
    setState(() {
      _cartProductList = recommendedProductList.sublist(0, 6);
    });
  }

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
                'My Cart',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              FaIcon(FontAwesomeIcons.search)
            ],
          ),
          const SizedBox(height: 8),
          Expanded(
            child: AnimatedList(
              key: _listKey,
              initialItemCount: _cartProductList.length,
              itemBuilder: (BuildContext context, int index, animation) =>
                  _buildCartItem(index, animation),
            ),
          ),
          CheckoutGroupButton(
            price: _totalPrice,
            onPressed: () {
              //TODO goto checkout cart
            },
            actionText: 'Check out',
          )
        ],
      ),
    );
  }

  Widget _buildCartItem(int index, Animation<double> animation) {
    if (index > _cartProductList.length - 1) return Container();
    Map<String, dynamic> item = _cartProductList[index];
    return FadeTransition(
      opacity: animation,
      child: SizeTransition(
        sizeFactor: animation,
        child: CartRowProductItem(
          product: item,
          selectedColor: _listColors[index].value,
          selectedColorName: _listColors[index].key,
          onRemoved: (product) {
            removeItem(_cartProductList.indexOf(product));
          },
          onItemPriceChanged: (double itemPrice) {
            _calculateTotalPrice(itemPrice);
          },
        ),
      ),
    );
  }

  _calculateTotalPrice(double itemPrice) {
    setState(() {
      _totalPrice = itemPrice;
    });
  }
}

class CartRowProductItem extends StatefulWidget {
  final Map<String, dynamic> product;
  final Color selectedColor;
  final String selectedColorName;
  final ValueChanged<Map<String, dynamic>> onRemoved;
  final ValueChanged<double> onItemPriceChanged;

  const CartRowProductItem({
    super.key,
    required this.product,
    required this.selectedColor,
    required this.selectedColorName,
    required this.onRemoved,
    required this.onItemPriceChanged,
  });

  @override
  State<CartRowProductItem> createState() => _CartRowProductItemState();
}

class _CartRowProductItemState extends State<CartRowProductItem> {
  int _numberItem = 1;
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
      child: Stack(
        children: [
          Container(
              height: _rowSize,
              decoration: BoxDecoration(
                color: isDark
                    ? Styles.textFieldBackgroundDark
                    : Styles.textFieldBackgroundLight,
                borderRadius: BorderRadius.circular(20),
              )),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                ProductImage(
                    size: _rowSize - _padding * 2,
                    path: widget.product['image']),
                const SizedBox(width: 16),
                _buildRightContent(),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildRightContent() {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            _buildTitleAndRemoveIcon(),
            const SizedBox(height: 8),
            _buildColorContent(),
            const SizedBox(height: 8),
            _buildPriceAndQuantity()
          ],
        ),
      ),
    );
  }

  Widget _buildPriceAndQuantity() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '\$${currencyFormat.format(_itemPrice)}',
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        NumberSelection(
          height: 20,
          numberSize: 12,
          iconSize: 10,
          numberInitial: 2,
          onChanged: (number) {
            setState(() {
              _numberItem = number;
              _itemPrice = widget.product['price'] * _numberItem;
              widget.onItemPriceChanged.call(_itemPrice);
            });
          },
        )
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
        Text(widget.selectedColorName, style: const TextStyle(fontSize: 14))
      ],
    );
  }

  Widget _buildTitleAndRemoveIcon() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            widget.product['title'],
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        GestureDetector(
          onTap: () {
            widget.onRemoved.call(widget.product);
          },
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: FaIcon(FontAwesomeIcons.trashCan, size: 18),
          ),
        ),
      ],
    );
  }
}
