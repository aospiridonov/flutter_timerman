part of 'partners_bloc.dart';

@freezed
class PartnersState with _$PartnersState {
  const factory PartnersState.loading() = PartnersStateLoading;
  const factory PartnersState.success({required List<Partner> partners}) =
      PartnersStateSuccess;
  const factory PartnersState.failure() = PartnersStateFailure;

  factory PartnersState.fromJson(Map<String, dynamic> json) =>
      _$PartnersStateFromJson(json);
}
