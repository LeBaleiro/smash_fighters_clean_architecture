import 'package:diacritic/diacritic.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../interfaces/cache_service_interface.dart';

class HiveCacheService implements ICacheService {
  @override
  Future<void> initialize() async {
    await Hive.initFlutter();
  }

  @override
  Future<void> registerUninitializedBox(String name) async {
    final nameWithoutDiacritics = removeDiacritics(name);
    if (!Hive.isBoxOpen(nameWithoutDiacritics)) {
      await Hive.openBox(nameWithoutDiacritics);
    }
  }

  @override
  Future<void> deleteEntry(String boxKey, String id) async {
    final boxKeyWithoutDiacritics = removeDiacritics(boxKey);
    final box = Hive.box(boxKeyWithoutDiacritics);
    if (box.containsKey(id)) {
      await box.delete(id);
    }
  }

  @override
  bool containsEntry(String boxKey, String id) {
    final boxKeyWithoutDiacritics = removeDiacritics(boxKey);
    final box = Hive.box(boxKeyWithoutDiacritics);
    return box.containsKey(id);
  }

  @override
  Future<void> deleteAllEntries(String boxKey) async {
    final boxKeyWithoutDiacritics = removeDiacritics(boxKey);
    final box = Hive.box(boxKeyWithoutDiacritics);
    await box.clear();
  }

  @override
  Future<void> saveEntry(String boxKey, String id, dynamic object) async {
    final boxKeyWithoutDiacritics = removeDiacritics(boxKey);
    final box = Hive.box(boxKeyWithoutDiacritics);
    await box.put(id, object);
  }

  @override
  Future<void> saveAllEntries(String boxKey, Map entries) async {
    final boxKeyWithoutDiacritics = removeDiacritics(boxKey);
    final box = Hive.box(boxKeyWithoutDiacritics);
    await box.putAll(entries);
  }

  @override
  List<Map> getAllEntries(String boxKey) {
    final boxKeyWithoutDiacritics = removeDiacritics(boxKey);
    final box = Hive.box(boxKeyWithoutDiacritics);
    final entries = <Map>[];
    for (var value in box.values) {
      entries.add(value);
    }
    return entries;
  }

  @override
  Map? getEntry(String boxKey, String id) {
    final boxKeyWithoutDiacritics = removeDiacritics(boxKey);
    final box = Hive.box(boxKeyWithoutDiacritics);
    final singleObject = box.get(id);
    return singleObject;
  }
}
