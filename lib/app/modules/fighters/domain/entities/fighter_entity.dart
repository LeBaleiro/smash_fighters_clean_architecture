class FighterEntity {
  final String objectId;
  final String name;
  final String? universe;
  final double price;
  final bool? popular;
  final int rate;
  final int downloads;
  final String? description;
  final String? createdAt;
  final String imageUrl;

  FighterEntity({
    required this.objectId,
    required this.name,
    required this.universe,
    required this.price,
    required this.popular,
    required this.rate,
    required this.downloads,
    required this.description,
    required this.createdAt,
    required this.imageUrl,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is FighterEntity &&
        other.objectId == objectId &&
        other.name == name &&
        other.universe == universe &&
        other.price == price &&
        other.popular == popular &&
        other.rate == rate &&
        other.downloads == downloads &&
        other.description == description &&
        other.createdAt == createdAt &&
        other.imageUrl == imageUrl;
  }

  @override
  int get hashCode {
    return objectId.hashCode ^
        name.hashCode ^
        universe.hashCode ^
        price.hashCode ^
        popular.hashCode ^
        rate.hashCode ^
        downloads.hashCode ^
        description.hashCode ^
        createdAt.hashCode ^
        imageUrl.hashCode;
  }

  @override
  String toString() {
    return 'FighterEntity(objectId: $objectId, name: $name, universe: $universe, price: $price, popular: $popular, rate: $rate, downloads: $downloads, description: $description, createdAt: $createdAt, imageUrl: $imageUrl)';
  }
}
