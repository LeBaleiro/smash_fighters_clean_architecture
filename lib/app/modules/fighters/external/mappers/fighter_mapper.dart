import 'dart:convert';

import '../../domain/entities/fighter_entity.dart';

class FighterMapper {
  static FighterEntity fromJson(String str) => fromMap(json.decode(str));

  static List toMapList(List<FighterEntity> list) => list.map((entity) => toMap(entity)).toList();

  static List<FighterEntity> fromMapList(List list) => list.map((json) => fromMap(json)).toList();

  static String toJson(FighterEntity entity) => json.encode(toMap(entity));
  static FighterEntity fromMap(Map json) => FighterEntity(
        objectId: json["objectID"] ?? '',
        name: json["name"] ?? 'No name',
        universe: json["universe"],
        price: double.tryParse(json["price"] ?? '') ?? 0,
        popular: json["popular"],
        rate: json["rate"] ?? 0,
        downloads: int.tryParse(json["downloads"] ?? '') ?? 0,
        description: json["description"] ?? '',
        createdAt: json["created_at"],
        imageUrl: json["imageURL"] ?? '',
      );

  static Map toMap(FighterEntity entity) => {
        "objectID": entity.objectId,
        "name": entity.name,
        "universe": entity.universe,
        "price": entity.price.toStringAsFixed(2),
        "popular": entity.popular,
        "rate": entity.rate,
        "downloads": entity.downloads.toString(),
        "description": entity.description,
        "created_at": entity.createdAt,
        "imageURL": entity.imageUrl,
      };
}
