import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:smash_fighters/app/modules/design_system/design_system_module.dart';

import '../stores/fighters_store.dart';
import '../widgets/fighter_widget.dart';

class FightersPage extends StatefulWidget {
  const FightersPage({Key? key}) : super(key: key);

  @override
  _FightersPageState createState() => _FightersPageState();
}

class _FightersPageState extends State<FightersPage> with LoadingMixin, ErrorMixin {
  @override
  final FightersStore store = Modular.get();

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent, statusBarIconBrightness: Brightness.dark),
    );
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      store.getFighters();
      store.getUniverses();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScopedBuilder<FightersStore, Exception, FightersState>(
      store: store,
      onState: (context, state) {
        return Scaffold(
          body: Column(
            children: [
              SimpleAppbarWidget(
                title: const Text('Fighters'),
                action: IconButton(
                  onPressed: () {
                    if (store.isLoading) return;
                    if (store.state.fighters == null || store.state.fighters!.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: const Text('No items to filter'),
                        backgroundColor: Theme.of(context).primaryColor,
                      ));
                    } else {
                      Modular.to.pushNamed('./filters');
                    }
                  },
                  icon: Icon(
                    Icons.filter_list,
                    size: 30,
                    color: state.filters.isInitial ? Colors.black : Theme.of(context).primaryColor,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              BrandsRadioListWidget(
                initialSelectedIndex: 0,
                items: state.universes.map((universe) => universe.name).toList(),
                onChanged: (index) => store.onUniverseChanged(state.universes[index]),
              ),
              const SizedBox(height: 26),
              Row(
                children: [
                  const SizedBox(width: 14),
                  Text('Fighters (${state.filteredFighters?.length ?? 0})', style: FontPalette.current.sectionTitle),
                  const SizedBox(width: 64),
                  Expanded(
                    child: Container(
                      height: 2,
                      width: double.infinity,
                      color: const Color(0xFF979797).withOpacity(0.4),
                    ),
                  )
                ],
              ),
              if (state.filteredFighters == null) const Spacer(),
              if (state.filteredFighters != null)
                Expanded(
                  child: RefreshIndicator(
                    color: Theme.of(context).primaryColor,
                    onRefresh: () async {
                      store.getFighters();
                    },
                    child: GridView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 23),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.75,
                        crossAxisSpacing: 29,
                        mainAxisSpacing: 38,
                      ),
                      itemCount: state.filteredFighters!.length,
                      itemBuilder: (context, index) {
                        return FighterWidget(state.filteredFighters![index]);
                      },
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
