import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smash_fighters/app/modules/design_system/design_system_module.dart';

import '../../domain/entities/fighter_entity.dart';

class FighterWidget extends StatelessWidget {
  final FighterEntity fighterModel;
  const FighterWidget(this.fighterModel, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Modular.to.pushNamed('./details', arguments: fighterModel);
      },
      child: Column(
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFFFBFBFB),
                border: Border.all(width: 1, color: const Color(0xFFEAEAEA)),
                borderRadius: BorderRadius.circular(8),
                boxShadow: const [BoxShadow(offset: Offset(0, 1), spreadRadius: 0.1, color: Colors.black12)],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Hero(
                  tag: fighterModel.hashCode,
                  child: CachedNetworkImage(
                    imageUrl: fighterModel.imageUrl,
                    errorWidget: (context, url, ex) => Image.asset('assets/fighters/not-found.png', fit: BoxFit.cover),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 13),
          Text(fighterModel.name.toUpperCase(), style: FontPalette.current.cardTitle),
          Text(fighterModel.universe?.toUpperCase() ?? '', style: FontPalette.current.cardSubtitle),
        ],
      ),
    );
  }
}
