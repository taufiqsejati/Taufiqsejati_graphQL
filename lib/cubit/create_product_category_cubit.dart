import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_graphql/models/countries/countries.dart';
import 'package:flutter_graphql/services/services.dart';

part 'create_product_category_state.dart';

class CreateProductCategoryCubit extends Cubit<CreateProductCategoryState> {
  CreateProductCategoryCubit() : super(CreateProductCategoryInitial());

  Future create(String name, String code) async {
    print('in Cubit $name');
    print('in Cubit $code');
    try {
      emit(CreateProductCategoryLoading());
      final createProductCategoryResponse = await CountriesServices()
          .createProductCategory(name: name, code: code);

      emit(CreateProductCategorySuccess(createProductCategoryResponse));
    } catch (e) {
      emit(CreateProductCategoryFailed((e as MErrorResponse).statusMessage));
    }
  }
}
