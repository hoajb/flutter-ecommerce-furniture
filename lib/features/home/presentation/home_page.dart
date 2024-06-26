import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_furniture/features/product_list/data/mock_product_list.dart';

import '../../../config/routes/routes.dart';
import '../../../core/wigets/header_profile.dart';
import '../../filter/presentation/filter_modal.dart';
import '../../product_list/presentation/page/list_all_page.dart';
import '../data/mock_home_filters.dart';
import '../widgets/home_banners.dart';
import '../widgets/home_grid_menu.dart';
import '../widgets/filter_multi_selection.dart';
import '../widgets/home_search_bar.dart';
import '../widgets/home_title_row.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _controllerSearch = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: [
          const HeaderProfile(),
          const SizedBox(height: 20),
          HomeSearchBar(
            controller: _controllerSearch,
            onFilterPressed: () {
              showModalBottomSheet(
                isDismissible: true,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                context: context,
                builder: (context) => const FilterModal(),
              );
            },
          ),
          const SizedBox(height: 16),
          HomeTitleRow(
            title: 'Special Offers',
            actionText: 'See All',
            onActionPressed: () {
              Navigator.pushNamed(context, AppRoutes.specialOffers);
            },
          ),
          const HomeBanners(),
          const SizedBox(height: 16),
          HomeMenuGrid(onSelectedMenu: (selectedPos) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Action selected : ${selectedPos.title}'),
              ),
            );
          }),
          HomeTitleRow(
            title: 'Most Popular',
            actionText: 'See All',
            onActionPressed: () {
              Navigator.pushNamed(context, AppRoutes.mostPopular);
            },
          ),
          HomeFilterSelection(
            listFilter: listHomeFilterSelection,
          ),
          const SizedBox(height: 16),
          ListAllPage(items: recommendedProductList.sublist(0, 6))
        ]),
      ),
    );
  }
}
