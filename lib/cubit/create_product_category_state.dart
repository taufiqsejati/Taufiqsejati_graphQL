part of 'create_product_category_cubit.dart';

abstract class CreateProductCategoryState {
  const CreateProductCategoryState();

  List<Object> get props => [];
}

class CreateProductCategoryInitial extends CreateProductCategoryState {}

class CreateProductCategoryLoading extends CreateProductCategoryState {}

class CreateProductCategorySuccess extends CreateProductCategoryState {
  final List<MCountries>? successResponse;

  const CreateProductCategorySuccess(this.successResponse);
}

class CreateProductCategoryFailed extends CreateProductCategoryState {
  final String errorMessage;

  const CreateProductCategoryFailed(this.errorMessage);
}
