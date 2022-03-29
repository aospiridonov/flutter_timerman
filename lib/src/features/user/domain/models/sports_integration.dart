import 'package:freezed_annotation/freezed_annotation.dart';

part 'sports_integration.freezed.dart';
part 'sports_integration.g.dart';

enum SportsIntegrationState {
  @JsonValue('disconect')
  disconect, // отключить
  @JsonValue('connected')
  connected, // подключено
}

@freezed
class SportsIntegration with _$SportsIntegration {
  factory SportsIntegration({
    required String name,
    required SportsIntegrationState state,
  }) = _SportsIntegration;

  factory SportsIntegration.fromJson(Map<String, dynamic> json) =>
      _$SportsIntegrationFromJson(json);
}
