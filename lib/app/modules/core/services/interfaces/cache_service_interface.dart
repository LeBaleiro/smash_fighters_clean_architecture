abstract class ICacheService {
  Future<void> initialize();

  ///Initializes a box if the box isn't registred yet
  Future<void> registerUninitializedBox(String name);
  Future<void> saveEntry(String boxKey, String id, Map object);
  Future<void> saveAllEntries(String boxKey, Map entries);
  Future<void> deleteEntry(String boxKey, String id);
  Future<void> deleteAllEntries(String boxKey);
  bool containsEntry(String boxKey, String id);
  List<Map> getAllEntries(String boxKey);
  Map? getEntry(String boxKey, String id);
}
