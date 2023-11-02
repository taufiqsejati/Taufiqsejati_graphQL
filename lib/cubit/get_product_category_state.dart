part of 'get_product_category_cubit.dart';

abstract class GetProductCategoryState extends Equatable {
  const GetProductCategoryState();

  @override
  List<Object> get props => [];
}

class GetProductCategoryInitial extends GetProductCategoryState {}

class GetProductCategoryLoading extends GetProductCategoryState {}

class GetProductCategorySuccess extends GetProductCategoryState {
  final List<MCountries>? dataFilterCategory;

  const GetProductCategorySuccess(this.dataFilterCategory);
}

class GetProductCategoryFailed extends GetProductCategoryState {
  final String errorMessage;

  const GetProductCategoryFailed(this.errorMessage);
}
