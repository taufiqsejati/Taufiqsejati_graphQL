import 'package:flutter_graphql/models/countries/model_countries.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'fetch_countries_state.freezed.dart';

@freezed
class FetchCountriesState with _$FetchCountriesState {
  factory FetchCountriesState.initial() = _Initial;
  factory FetchCountriesState.fetching() = _Fetching;
  factory FetchCountriesState.fetched(List<MCountries> countries) = _Fetched;
  factory FetchCountriesState.failed(String error) = _Failed;
}
