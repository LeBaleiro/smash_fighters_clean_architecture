import '../../domain/entities/fighter_entity.dart';
import '../../domain/entities/filter_entity.dart';
import 'sort_enum.dart';

//Chain of responsibility
abstract class IFilterService {
  final IFilterService? _next;
  const IFilterService(this._next);
  List<FighterEntity> filter(List<FighterEntity> list, FilterEntity filters);
}

class PriceFilterService extends IFilterService {
  const PriceFilterService({IFilterService? next}) : super(next);
  @override
  List<FighterEntity> filter(List<FighterEntity> list, FilterEntity filters) {
    final newList = list.where((item) {
      final currentPriceIsBiggerOrEqualsFilter = filters.priceMin != null && item.price >= filters.priceMin!;
      final currentPriceIsSmallerOrEqualsFilter = filters.priceMax != null && item.price <= filters.priceMax!;
      final isNotSelectedPriceMax = filters.priceMax == null;
      return isNotSelectedPriceMax || (currentPriceIsBiggerOrEqualsFilter && currentPriceIsSmallerOrEqualsFilter);
    }).toList();
    if (_next == null) return newList;
    return _next!.filter(newList, filters);
  }
}

class SortFilterService extends IFilterService {
  const SortFilterService({IFilterService? next}) : super(next);
  @override
  List<FighterEntity> filter(List<FighterEntity> list, FilterEntity filters) {
    List<FighterEntity> newList = list.toList();
    switch (filters.sortBy) {
      case SortEnum.Ascending:
        newList.sort((fighterA, fighterB) => fighterA.name.toLowerCase().compareTo(fighterB.name.toLowerCase()));
        break;
      case SortEnum.Descending:
        newList.sort((fighterA, fighterB) => fighterA.name.toLowerCase().compareTo(fighterB.name.toLowerCase()));
        newList = newList.reversed.toList();
        break;
      case SortEnum.Rate:
        newList.sort((fighterA, fighterB) => fighterA.rate.compareTo(fighterB.rate));
        break;
      case SortEnum.Downloads:
        newList.sort((fighterA, fighterB) => fighterA.downloads.compareTo(fighterB.downloads));
        break;
    }
    if (_next == null) return newList;
    return _next!.filter(newList, filters);
  }
}

class StarsFilterService extends IFilterService {
  const StarsFilterService({IFilterService? next}) : super(next);
  @override
  List<FighterEntity> filter(List<FighterEntity> list, FilterEntity filters) {
    var newList = list.toList();
    if (filters.stars != null) {
      newList = newList.where((fighter) => fighter.rate == filters.stars).toList();
    }
    if (_next == null) return newList;
    return _next!.filter(newList, filters);
  }
}
