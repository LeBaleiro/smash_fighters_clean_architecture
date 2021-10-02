import 'dart:convert';

import '../../domain/entities/universe_entity.dart';

class UniverseMapper {
  static List toMapList(List<UniverseEntity> list) => list.map((entity) => toMap(entity)).toList();
  static List<UniverseEntity> fromMapList(List list) => list.map((json) => fromMap(json)).toList();

  static UniverseEntity fromJson(String str) => fromMap(json.decode(str));
  static String toJson(UniverseEntity entity) => json.encode(toMap(entity));

  static UniverseEntity fromMap(Map json) => UniverseEntity(
        objectId: json["objectID"],
        name: json["name"] ?? 'No name',
        description: json["description"],
      );

  static Map<String, dynamic> toMap(UniverseEntity entity) => {
        "objectID": entity.objectId,
        "name": entity.name,
        "description": entity.description,
      };
}
