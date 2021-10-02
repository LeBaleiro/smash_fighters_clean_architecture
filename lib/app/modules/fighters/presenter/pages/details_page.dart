import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smash_fighters/app/modules/design_system/design_system_module.dart';

import '../../domain/entities/fighter_entity.dart';

class DetailsPage extends StatefulWidget {
  final FighterEntity fighterModel;
  const DetailsPage({Key? key, required this.fighterModel}) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent, statusBarIconBrightness: Brightness.light),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        SystemChrome.setSystemUIOverlayStyle(
          const SystemUiOverlayStyle(statusBarColor: Colors.transparent, statusBarIconBrightness: Brightness.dark),
        );
        return true;
      },
      child: Scaffold(
        body: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 50),
          child: Column(
            children: [
              Stack(
                children: [
                  Positioned.fill(
                    child: ClipPath(
                      clipper: BackgroundClipper(),
                      child: Container(
                        color: Theme.of(context).primaryColor,
                        // padding: const EdgeInsetsDirectional.only(bottom: 21),
                      ),
                    ),
                  ),
                  SafeArea(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 13),
                          child: IconButton(
                            onPressed: () => Modular.to.maybePop(),
                            color: Colors.white,
                            icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 30),
                          ),
                        ),
                        const SizedBox(height: 5),
                        Padding(
                          padding: const EdgeInsets.only(left: 28),
                          child: Text(widget.fighterModel.name, style: FontPalette.current.detailsTitle),
                        ),
                        const SizedBox(height: 9),
                        Padding(
                          padding: const EdgeInsets.only(left: 28),
                          child: Text(widget.fighterModel.universe ?? '', style: FontPalette.current.detailsSubtitle),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 28),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 12),
                                  Text('${widget.fighterModel.downloads} downloads', style: FontPalette.current.detailsDownloads),
                                  const SizedBox(height: 9),
                                  Transform.translate(
                                    offset: const Offset(-5, 0),
                                    child: RatingWidget(
                                      onChanged: null,
                                      starSize: 16.5,
                                      spaceBetween: 11,
                                      inactiveColor: Colors.black.withOpacity(0.2),
                                      activeColor: Colors.white,
                                      initialSelectedValue: widget.fighterModel.rate,
                                    ),
                                  ),
                                  const SizedBox(height: 27),
                                  Container(
                                    alignment: Alignment.center,
                                    width: 90,
                                    padding: const EdgeInsets.symmetric(vertical: 6.29),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(6.86),
                                    ),
                                    child: Text('\$${widget.fighterModel.price.toInt()}', style: FontPalette.current.detailsPrice),
                                  )
                                ],
                              ),
                            ),
                            Expanded(
                              child: Hero(
                                tag: widget.fighterModel.hashCode,
                                child: Transform.translate(
                                  offset: const Offset(0, 21),
                                  child: CachedNetworkImage(
                                    height: 218,
                                    imageUrl: widget.fighterModel.imageUrl,
                                    errorWidget: (context, url, ex) => Container(),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 35),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28),
                child: Text(widget.fighterModel.description ?? 'No description', style: FontPalette.current.detailsDescription),
              )
            ],
          ),
        ),
      ),
    );
  }
}
