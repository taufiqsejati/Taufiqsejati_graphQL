class Config {
  String? get baseUrl => 'https://verified-mosquito-75.hasura.app/v1/graphql';

  Uri? get uri {
    if (baseUrl == null) return null;
    return Uri.parse(baseUrl!);
  }
}
