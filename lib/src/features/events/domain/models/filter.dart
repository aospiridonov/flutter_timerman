import 'package:freezed_annotation/freezed_annotation.dart';

part 'filter.freezed.dart';
part 'filter.g.dart';

@freezed
class Filter with _$Filter {
  factory Filter({
    @Default(true) bool online,
    @Default(true) bool swim,
    @Default(true) bool run,
    @Default(true) bool bike,
    @Default(true) bool orienteering,
    DateTime? dateFrom,
    DateTime? toFrom,
    @Default(true) bool child,
    @Default(true) bool adult,
  }) = _Filter;

  factory Filter.fromJson(Map<String, dynamic> json) => _$FilterFromJson(json);
}
