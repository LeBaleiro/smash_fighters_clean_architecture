import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smash_fighters/app/modules/design_system/design_system_module.dart';

import '../../domain/entities/filter_entity.dart';
import '../services/sort_enum.dart';
import '../stores/fighters_store.dart';

class FiltersPage extends StatefulWidget {
  const FiltersPage({Key? key}) : super(key: key);

  @override
  _FiltersPageState createState() => _FiltersPageState();
}

class _FiltersPageState extends State<FiltersPage> {
  final FightersStore fightersStore = Modular.get();
  late FilterEntity filter = fightersStore.state.filters;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SimpleAppbarWidget(
                    title: const Text('Fighters'),
                    leading: TextButton(
                      onPressed: () => Modular.to.pop(),
                      style: ButtonStyle(overlayColor: MaterialStateProperty.all(Theme.of(context).primaryColor.withOpacity(0.2))),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Text('Close', style: FontPalette.current.closeButton),
                      ),
                    ),
                  ),
                  const Divider(thickness: 2, color: Color(0xFFEBEAEC), height: 0),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(25, 29, 25, 28),
                    child: Text('Sort By', style: FontPalette.current.filterSectionTitle),
                  ),
                  RadioListWidget(
                    items: SortEnum.values,
                    initialSelectedIndex: SortEnum.values.indexOf(filter.sortBy),
                    onSelectItem: (index) {
                      filter = filter.copyWith(sortBy: SortEnum.values[index]);
                    },
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 8, top: 24, bottom: 16),
                    child: Divider(thickness: 2, color: Color(0xFFEBEAEC), height: 0),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(25, 0, 25, 25),
                    child: Text('Price', style: FontPalette.current.filterSectionTitle),
                  ),
                  RangeSliderWidget(
                    maxValue: fightersStore.state.maxPrice,
                    minValue: fightersStore.state.minPrice,
                    initialValue: RangeValues(
                      filter.priceMin ?? fightersStore.state.minPrice,
                      filter.priceMax ?? fightersStore.state.maxPrice,
                    ),
                    onChanged: (range) {
                      filter = filter.copyWithPrice(priceMin: range.start, priceMax: range.end);
                    },
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 8, top: 24, bottom: 16),
                    child: Divider(thickness: 2, color: Color(0xFFEBEAEC), height: 0),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(25, 0, 25, 25),
                    child: Text('Stars', style: FontPalette.current.filterSectionTitle),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: RatingWidget(
                      initialSelectedValue: filter.stars,
                      onChanged: (starsCount) => filter = filter.copyWithStars(starsCount),
                    ),
                  ),
                  const SizedBox(height: 50)
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(35, 0, 35, 50),
            child: RoundedButtonWidget(
              text: 'Apply Filters',
              onTap: () {
                fightersStore.onFiltersChanged(filter);
                Modular.to.pop();
              },
            ),
          ),
        ],
      ),
    );
  }
}
