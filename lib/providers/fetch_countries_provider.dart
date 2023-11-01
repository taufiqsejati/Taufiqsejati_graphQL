import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/countries/model_countries.dart';
import './fetch_countries_state.dart';
import 'package:dio/dio.dart';

final fetchCountriesProvider =
    StateNotifierProvider<FetchCountriesProvider, FetchCountriesState>((ref) =>
        FetchCountriesProvider(FetchCountriesState.initial())
          ..fetchCountries(ref, ref));

class FetchCountriesProvider extends StateNotifier<FetchCountriesState> {
  FetchCountriesProvider(super.state);

  fetchCountries(args1, args2) async {
    state = FetchCountriesState.fetching();
    try {
      Dio dio = Dio();
      var response =
          await dio.post('https://verified-mosquito-75.hasura.app/v1/graphql',
              options: Options(headers: {
                'x-hasura-admin-secret':
                    'DIK9EhORiG6bT9KNpDth3K9j926oOPLCd3ON93YVh31gVlocQAiNasyniGcVX9gt'
              }),
              data: {
            'query': r'''
              query getContinents {
                continents {
                  code
                  name
                }
              }
''',
            // 'variables': {"name": args1, "code": args2}
          });
      List<dynamic> responseData = response.data['data']['continents'];
      state = FetchCountriesState.fetched(
          responseData.map((e) => MCountries.fromJson(e)).toList());
    } on DioException catch (e) {
      state = FetchCountriesState.failed(e.message!);
    } catch (e) {
      state = FetchCountriesState.failed('Failed to fetch Countries');
    }
  }
}
