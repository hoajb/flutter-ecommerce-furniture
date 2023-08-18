import 'package:flutter/material.dart';

import '../../../home/data/mock_home_filters.dart';
import '../../../home/widgets/filter_multi_selection.dart';
import '../../data/mock_product_list.dart';
import 'list_all_page.dart';

class MostPopularPage extends StatelessWidget {
  const MostPopularPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Most Popular',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            HomeFilterSelection(
              listFilter: listHomeFilterSelection,
            ),
            const SizedBox(height: 16),
            Expanded(
              child: SingleChildScrollView(
                child: ListAllPage(
                  items: recommendedProductList,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
