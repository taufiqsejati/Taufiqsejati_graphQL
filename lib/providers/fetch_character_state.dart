import 'package:flutter_graphql/models/characters/model_character.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'fetch_character_state.freezed.dart';

@freezed
class FetchCharactersState with _$FetchCharactersState {
  factory FetchCharactersState.initial() = _Initial;
  factory FetchCharactersState.fetching() = _Fetching;
  factory FetchCharactersState.fetched(List<MCharacter> characters) = _Fetched;
  factory FetchCharactersState.failed(String error) = _Failed;
}
