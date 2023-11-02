import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_graphql/models/countries/countries.dart';
import 'package:flutter_graphql/services/services.dart';

part 'get_product_category_state.dart';

class GetProductCategoryCubit extends Cubit<GetProductCategoryState> {
  GetProductCategoryCubit() : super(GetProductCategoryInitial());

  Future get() async {
    try {
      emit(GetProductCategoryLoading());
      final getProductCategoryResponse =
          await CountriesServices().getCountries();

      emit(GetProductCategorySuccess(getProductCategoryResponse));
    } catch (e) {
      emit(GetProductCategoryFailed((e as MErrorResponse).statusMessage));
    }
  }
}
