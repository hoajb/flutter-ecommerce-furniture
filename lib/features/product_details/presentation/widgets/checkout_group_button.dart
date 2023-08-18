import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/utils/number_utils.dart';

class CheckoutGroupButton extends StatelessWidget {
  final double price;
  final VoidCallback onPressed;

  const CheckoutGroupButton(
      {super.key, required this.price, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    bool darkModeEnabled = Theme.of(context).brightness == Brightness.dark;
    final backgroundC = darkModeEnabled ? Colors.white : Colors.black;

    final textC = darkModeEnabled ? Colors.black : Colors.white;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Total price'),
            Text(
              '\$${currencyFormat.format(price)}',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: backgroundC,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(50)),
            ),
          ),
          child: Container(
            padding: const EdgeInsets.all(16),
            constraints: const BoxConstraints(minWidth: 150),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FaIcon(
                  FontAwesomeIcons.bagShopping,
                  color: textC,
                  size: 14,
                ),
                const SizedBox(width: 8),
                Text(
                  'Add to Cart',
                  style: TextStyle(color: textC, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
