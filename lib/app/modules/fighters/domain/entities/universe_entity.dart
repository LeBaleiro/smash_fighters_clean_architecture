class UniverseEntity {
  final String objectId;
  final String name;
  final String? description;

  UniverseEntity({
    required this.objectId,
    required this.name,
    required this.description,
  });
  UniverseEntity.all()
      : name = 'All',
        objectId = 'All',
        description = null;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UniverseEntity && other.objectId == objectId && other.name == name && other.description == description;
  }

  @override
  int get hashCode => objectId.hashCode ^ name.hashCode ^ description.hashCode;
}
