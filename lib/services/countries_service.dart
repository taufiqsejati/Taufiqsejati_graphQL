import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_graphql/models/countries/countries.dart';
import 'package:flutter_graphql/models/countries/model_countries.dart';
import 'package:flutter_graphql/utils/dio_helper.dart';
import 'package:flutter_graphql/utils/utils.dart';

class CountriesServices {
  // Future<List<MGetFilterItemResponse>?> getFilterItem() async {
  //   try {
  //     var groupId = Config().groupId;
  //     var formData =
  //         FormData.fromMap({'group_id': groupId, 'page': '1', 'limit': '5'});
  //     final response = await DioHelper.dio!.post(
  //       '/getItems',
  //       data: formData,
  //       options: Options(validateStatus: (status) => status! < 500),
  //     );
  //     if (response.statusCode == HttpStatus.ok) {
  //       var resultObjsJson = response.data as List;
  //       List<DataperkaraResponse> result = resultObjsJson
  //           .map((tagJson) => DataperkaraResponse.fromJson(tagJson))
  //           .toList();
  //       return result;
  //     } else {
  //       throw MErrorResponse(
  //         statusMessage: globals["${response.statusCode}"].toString(),
  //         statusCode: response.statusCode,
  //       );
  //     }
  //   } catch (e) {
  //     //jika wifi no intenet
  //     if (e is TypeError) {
  //       throw MErrorResponse(
  //         statusCode: HttpStatus.serviceUnavailable,
  //         statusMessage: 'Service Unavailable',
  //       );
  //     }

  //     if (e is! DioError) rethrow;

  //     final error = e.error;
  //     if (error is SocketException) {
  //       throw MErrorResponse(
  //         statusCode: HttpStatus.serviceUnavailable,
  //         statusMessage: 'Service Unavailable',
  //       );
  //     }

  //     if (error is HandshakeException) {
  //       throw MErrorResponse(
  //         statusCode: HttpStatus.serviceUnavailable,
  //         statusMessage: "Cannot connect securely to server."
  //             " Please ensure that the server has a valid SSL configuration.",
  //       );
  //     }

  //     throw MErrorResponse(statusMessage: error);
  //   }
  // }

  //NOTE - Get Detail Product Item
  // Future<DataDetailFilterItem?> getDetailProductItem(
  //     {required dynamic data}) async {
  //   try {
  //     final response = await DioHelper.dio!.post(
  //       '/getItemById',
  //       data: data,
  //       options: Options(validateStatus: (status) => status! < 500),
  //     );
  //     if (response.statusCode == HttpStatus.ok) {
  //       final result = MDetailGetFilterItemResponse.fromJson(response.data);
  //       return result.data;
  //     } else {
  //       throw MErrorResponse(
  //         statusMessage: globals["${response.statusCode}"].toString(),
  //         statusCode: response.statusCode,
  //       );
  //     }
  //   } catch (e) {
  //     //jika wifi no intenet
  //     if (e is TypeError) {
  //       throw MErrorResponse(
  //         statusCode: HttpStatus.serviceUnavailable,
  //         statusMessage: 'Service Unavailable',
  //       );
  //     }

  //     if (e is! DioError) rethrow;

  //     final error = e.error;
  //     if (error is SocketException) {
  //       throw MErrorResponse(
  //         statusCode: HttpStatus.serviceUnavailable,
  //         statusMessage: 'Service Unavailable',
  //       );
  //     }

  //     if (error is HandshakeException) {
  //       throw MErrorResponse(
  //         statusCode: HttpStatus.serviceUnavailable,
  //         statusMessage: "Cannot connect securely to server."
  //             " Please ensure that the server has a valid SSL configuration.",
  //       );
  //     }

  //     throw MErrorResponse(statusMessage: error);
  //   }
  // }

  // //NOTE - Update Product Item
  // Future<MSuccessResponse> updateProductItem({required dynamic data}) async {
  //   try {
  //     final response = await DioHelper.dio!.post(
  //       '/item/update',
  //       data: data,
  //       options: Options(validateStatus: (status) => status! < 500),
  //     );
  //     if (response.statusCode == HttpStatus.ok) {
  //       if (MSuccessResponse.fromJson(response.data).success == false) {
  //         throw MErrorResponse(
  //           statusMessage:
  //               MSuccessResponse.fromJson(response.data).message.toString(),
  //           statusCode: response.statusCode,
  //         );
  //       }
  //       return MSuccessResponse.fromJson(response.data);
  //     } else if (response.statusCode == HttpStatus.notFound) {
  //       throw MErrorResponse(
  //         statusMessage: response.data['message'],
  //         statusCode: response.statusCode,
  //       );
  //     } else if (response.statusCode == HttpStatus.badRequest) {
  //       throw MErrorResponse(
  //         statusMessage: response.data['error'],
  //         statusCode: response.statusCode,
  //       );
  //     } else {
  //       throw MErrorResponse(
  //         statusMessage: globals["${response.statusCode}"].toString(),
  //         statusCode: response.statusCode,
  //       );
  //     }
  //   } catch (e) {
  //     //jika wifi no intenet
  //     if (e is TypeError) {
  //       throw MErrorResponse(
  //         statusCode: HttpStatus.serviceUnavailable,
  //         statusMessage: 'Service Unavailable',
  //       );
  //     }

  //     if (e is! DioError) rethrow;

  //     final error = e.error;
  //     if (error is SocketException) {
  //       throw MErrorResponse(
  //         statusCode: HttpStatus.serviceUnavailable,
  //         statusMessage: 'Service Unavailable',
  //       );
  //     }

  //     if (error is HandshakeException) {
  //       throw MErrorResponse(
  //         statusCode: HttpStatus.serviceUnavailable,
  //         statusMessage: "Cannot connect securely to server."
  //             " Please ensure that the server has a valid SSL configuration.",
  //       );
  //     }

  //     throw MErrorResponse(statusMessage: error);
  //   }
  // }

  // //NOTE - Create Product Item
  // Future<MSuccessResponse> createProductItem({required dynamic data}) async {
  //   try {
  //     final response = await DioHelper.dio!.post(
  //       '/item/create',
  //       data: data,
  //       options: Options(validateStatus: (status) => status! < 500),
  //     );

  //     if (response.statusCode == HttpStatus.ok) {
  //       if (MSuccessResponse.fromJson(response.data).success == false) {
  //         throw MErrorResponse(
  //           statusMessage:
  //               MSuccessResponse.fromJson(response.data).message.toString(),
  //           statusCode: response.statusCode,
  //         );
  //       }
  //       return MSuccessResponse.fromJson(response.data);
  //     } else {
  //       throw MErrorResponse(
  //         statusMessage:
  //             MSuccessResponse.fromJson(response.data).message.toString(),
  //         statusCode: response.statusCode,
  //       );
  //     }
  //   } catch (e) {
  //     //jika wifi no intenet
  //     if (e is TypeError) {
  //       throw MErrorResponse(
  //         statusCode: HttpStatus.serviceUnavailable,
  //         statusMessage: 'Service Unavailable',
  //       );
  //     }

  //     if (e is! DioError) rethrow;

  //     final error = e.error;
  //     if (error is SocketException) {
  //       throw MErrorResponse(
  //         statusCode: HttpStatus.serviceUnavailable,
  //         statusMessage: 'Service Unavailable',
  //       );
  //     }

  //     if (error is HandshakeException) {
  //       throw MErrorResponse(
  //         statusCode: HttpStatus.serviceUnavailable,
  //         statusMessage: "Cannot connect securely to server."
  //             " Please ensure that the server has a valid SSL configuration.",
  //       );
  //     }

  //     throw MErrorResponse(statusMessage: error);
  //   }
  // }

  // //NOTE - Delete Product Item
  // Future<MDeleteResponse> deleteProductItem({required dynamic data}) async {
  //   try {
  //     final response = await DioHelper.dio!.post(
  //       '/item/delete',
  //       data: data,
  //       options: Options(validateStatus: (status) => status! < 500),
  //     );
  //     if (response.statusCode == HttpStatus.ok) {
  //       if (MDeleteResponse.fromJson(response.data).success == false) {
  //         throw MErrorResponse(
  //           statusMessage: response.data['message'],
  //           statusCode: response.statusCode,
  //         );
  //       }
  //       return MDeleteResponse.fromJson(response.data);
  //     } else if (response.statusCode == HttpStatus.unauthorized) {
  //       throw MErrorResponse(
  //         statusMessage: response.data['message'],
  //         statusCode: response.statusCode,
  //       );
  //     } else if (response.statusCode == HttpStatus.notFound) {
  //       throw MErrorResponse(
  //         statusMessage: response.data['message'],
  //         statusCode: response.statusCode,
  //       );
  //     }
  //     // notFound
  //     else {
  //       throw MErrorResponse(
  //         statusMessage: globals["${response.statusCode}"].toString(),
  //         statusCode: response.statusCode,
  //       );
  //     }
  //   } catch (e) {
  //     //jika wifi no intenet
  //     if (e is TypeError) {
  //       throw MErrorResponse(
  //         statusCode: HttpStatus.serviceUnavailable,
  //         statusMessage: 'Service Unavailable',
  //       );
  //     }

  //     if (e is! DioError) rethrow;

  //     final error = e.error;
  //     if (error is SocketException) {
  //       throw MErrorResponse(
  //         statusCode: HttpStatus.serviceUnavailable,
  //         statusMessage: 'Service Unavailable',
  //       );
  //     }

  //     if (error is HandshakeException) {
  //       throw MErrorResponse(
  //         statusCode: HttpStatus.serviceUnavailable,
  //         statusMessage: "Cannot connect securely to server."
  //             " Please ensure that the server has a valid SSL configuration.",
  //       );
  //     }

  //     throw MErrorResponse(statusMessage: error);
  //   }
  // }

  //NOTE - Get Product Category
  Future<List<MCountries>?> getCountries() async {
    try {
      var data = {
        'query': r'''
              query getContinents {
                continents {
                  code
                  name
                }
              }
''',
      };
      var header = {
        'x-hasura-admin-secret':
            'DIK9EhORiG6bT9KNpDth3K9j926oOPLCd3ON93YVh31gVlocQAiNasyniGcVX9gt'
      };
      final response = await DioHelper.dio!.post(
        '',
        data: data,
        options:
            Options(validateStatus: (status) => status! < 500, headers: header),
      );
      if (response.statusCode == HttpStatus.ok) {
        // List<dynamic> responseData = response.data['data']['continents'];
        // state = FetchCountriesState.fetched(
        //     responseData.map((e) => MCountries.fromJson(e)).toList());
        List<dynamic> result = response.data['data']['continents'];
        return result.map((e) => MCountries.fromJson(e)).toList();
      } else if (response.statusCode == HttpStatus.notFound) {
        throw MErrorResponse(
          statusMessage: globals["${response.statusCode}"].toString(),
          statusCode: response.statusCode,
        );
      } else if (response.statusCode == HttpStatus.badRequest) {
        throw MErrorResponse(
          statusMessage: globals["${response.statusCode}"].toString(),
          statusCode: response.statusCode,
        );
      } else {
        throw MErrorResponse(
          statusMessage: globals["${response.statusCode}"].toString(),
          statusCode: response.statusCode,
        );
      }
    } catch (e) {
      //jika wifi no intenet
      if (e is TypeError) {
        throw MErrorResponse(
          statusCode: HttpStatus.serviceUnavailable,
          statusMessage: 'Service Unavailable',
        );
      }

      if (e is! DioError) rethrow;

      final error = e.error;
      if (error is SocketException) {
        throw MErrorResponse(
          statusCode: HttpStatus.serviceUnavailable,
          statusMessage: 'Service Unavailable',
        );
      }

      if (error is HandshakeException) {
        throw MErrorResponse(
          statusCode: HttpStatus.serviceUnavailable,
          statusMessage: "Cannot connect securely to server."
              " Please ensure that the server has a valid SSL configuration.",
        );
      }

      throw MErrorResponse(statusMessage: error.toString());
    }
  }

  //NOTE - Update Product Category
  // Future<MSuccessResponse> updateProductCategory(
  //     {required dynamic data}) async {
  //   try {
  //     final response = await DioHelper.dio!.post(
  //       '/category/update',
  //       data: data,
  //       options: Options(validateStatus: (status) => status! < 500),
  //     );
  //     if (response.statusCode == HttpStatus.ok) {
  //       if (MSuccessResponse.fromJson(response.data).success == false) {
  //         throw MErrorResponse(
  //           statusMessage:
  //               MSuccessResponse.fromJson(response.data).message.toString(),
  //           statusCode: response.statusCode,
  //         );
  //       }
  //       return MSuccessResponse.fromJson(response.data);
  //     } else if (response.statusCode == HttpStatus.notFound) {
  //       throw MErrorResponse(
  //         statusMessage: response.data['message'],
  //         statusCode: response.statusCode,
  //       );
  //     } else if (response.statusCode == HttpStatus.badRequest) {
  //       throw MErrorResponse(
  //         statusMessage: response.data['error'],
  //         statusCode: response.statusCode,
  //       );
  //     } else {
  //       throw MErrorResponse(
  //         statusMessage: globals["${response.statusCode}"].toString(),
  //         statusCode: response.statusCode,
  //       );
  //     }
  //   } catch (e) {
  //     //jika wifi no intenet
  //     if (e is TypeError) {
  //       throw MErrorResponse(
  //         statusCode: HttpStatus.serviceUnavailable,
  //         statusMessage: 'Service Unavailable',
  //       );
  //     }

  //     if (e is! DioError) rethrow;

  //     final error = e.error;
  //     if (error is SocketException) {
  //       throw MErrorResponse(
  //         statusCode: HttpStatus.serviceUnavailable,
  //         statusMessage: 'Service Unavailable',
  //       );
  //     }

  //     if (error is HandshakeException) {
  //       throw MErrorResponse(
  //         statusCode: HttpStatus.serviceUnavailable,
  //         statusMessage: "Cannot connect securely to server."
  //             " Please ensure that the server has a valid SSL configuration.",
  //       );
  //     }

  //     throw MErrorResponse(statusMessage: error);
  //   }
  // }

  //NOTE - Create Product Category
  Future<List<MCountries>?> createProductCategory(
      {required String name, required String code}) async {
    try {
      var data = {
        'query': r'''
              mutation insert_continents2($name: String!, $code: String!) {
              insert_continents(objects: [{name: $name, code: $code}]) {
                returning {
                  code
                  name
                }
              }
            }
''',
        'variables': {"code": code, "name": name}
      };
      var header = {
        'x-hasura-admin-secret':
            'DIK9EhORiG6bT9KNpDth3K9j926oOPLCd3ON93YVh31gVlocQAiNasyniGcVX9gt'
      };
      final response = await DioHelper.dio!.post(
        '',
        data: data,
        options:
            Options(validateStatus: (status) => status! < 500, headers: header),
      );

      if (response.statusCode == HttpStatus.ok) {
        List<dynamic> result =
            response.data['data']['insert_continents']['returning'];
        return result.map((e) => MCountries.fromJson(e)).toList();
      } else {
        throw MErrorResponse(
          statusMessage: globals["${response.statusCode}"].toString(),
          statusCode: response.statusCode,
        );
      }
    } catch (e) {
      //jika wifi no intenet
      if (e is TypeError) {
        throw MErrorResponse(
          statusCode: HttpStatus.serviceUnavailable,
          statusMessage: 'Service Unavailable',
        );
      }

      if (e is! DioError) rethrow;

      final error = e.error;
      if (error is SocketException) {
        throw MErrorResponse(
          statusCode: HttpStatus.serviceUnavailable,
          statusMessage: 'Service Unavailable',
        );
      }

      if (error is HandshakeException) {
        throw MErrorResponse(
          statusCode: HttpStatus.serviceUnavailable,
          statusMessage: "Cannot connect securely to server."
              " Please ensure that the server has a valid SSL configuration.",
        );
      }

      throw MErrorResponse(statusMessage: error.toString());
    }
  }

  // //NOTE - Delete Product Category
  // Future<MDeleteResponse> deleteProductCategory({required dynamic data}) async {
  //   try {
  //     final response = await DioHelper.dio!.post(
  //       '/category/delete',
  //       data: data,
  //       options: Options(validateStatus: (status) => status! < 500),
  //     );
  //     if (response.statusCode == HttpStatus.ok) {
  //       if (MDeleteResponse.fromJson(response.data).success == false) {
  //         throw MErrorResponse(
  //           statusMessage: response.data['message'],
  //           statusCode: response.statusCode,
  //         );
  //       }
  //       return MDeleteResponse.fromJson(response.data);
  //     } else if (response.statusCode == HttpStatus.unauthorized) {
  //       throw MErrorResponse(
  //         statusMessage: response.data['message'],
  //         statusCode: response.statusCode,
  //       );
  //     } else if (response.statusCode == HttpStatus.notFound) {
  //       throw MErrorResponse(
  //         statusMessage: response.data['message'],
  //         statusCode: response.statusCode,
  //       );
  //     }
  //     // notFound
  //     else {
  //       throw MErrorResponse(
  //         statusMessage: globals["${response.statusCode}"].toString(),
  //         statusCode: response.statusCode,
  //       );
  //     }
  //   } catch (e) {
  //     //jika wifi no intenet
  //     if (e is TypeError) {
  //       throw MErrorResponse(
  //         statusCode: HttpStatus.serviceUnavailable,
  //         statusMessage: 'Service Unavailable',
  //       );
  //     }

  //     if (e is! DioError) rethrow;

  //     final error = e.error;
  //     if (error is SocketException) {
  //       throw MErrorResponse(
  //         statusCode: HttpStatus.serviceUnavailable,
  //         statusMessage: 'Service Unavailable',
  //       );
  //     }

  //     if (error is HandshakeException) {
  //       throw MErrorResponse(
  //         statusCode: HttpStatus.serviceUnavailable,
  //         statusMessage: "Cannot connect securely to server."
  //             " Please ensure that the server has a valid SSL configuration.",
  //       );
  //     }

  //     throw MErrorResponse(statusMessage: error);
  //   }
  // }

  // //NOTE - Get Product Unit
  // Future<List<DataFilterUnit>?> getProductUnit() async {
  //   try {
  //     var data = {
  //       "start": "0",
  //       "length": "",
  //       "filter_by": "",
  //       "filter_value": ""
  //     };
  //     final response = await DioHelper.dio!.post(
  //       '/unit/get',
  //       data: data,
  //       options: Options(validateStatus: (status) => status! < 500),
  //     );
  //     if (response.statusCode == HttpStatus.ok) {
  //       final result = MGetFilterUnitResponse.fromJson(response.data);
  //       return result.data;
  //     } else if (response.statusCode == HttpStatus.notFound) {
  //       throw MErrorResponse(
  //         statusMessage: globals["${response.statusCode}"].toString(),
  //         statusCode: response.statusCode,
  //       );
  //     } else if (response.statusCode == HttpStatus.badRequest) {
  //       throw MErrorResponse(
  //         statusMessage: globals["${response.statusCode}"].toString(),
  //         statusCode: response.statusCode,
  //       );
  //     } else {
  //       throw MErrorResponse(
  //         statusMessage: globals["${response.statusCode}"].toString(),
  //         statusCode: response.statusCode,
  //       );
  //     }
  //   } catch (e) {
  //     //jika wifi no intenet
  //     if (e is TypeError) {
  //       throw MErrorResponse(
  //         statusCode: HttpStatus.serviceUnavailable,
  //         statusMessage: 'Service Unavailable',
  //       );
  //     }

  //     if (e is! DioError) rethrow;

  //     final error = e.error;
  //     if (error is SocketException) {
  //       throw MErrorResponse(
  //         statusCode: HttpStatus.serviceUnavailable,
  //         statusMessage: 'Service Unavailable',
  //       );
  //     }

  //     if (error is HandshakeException) {
  //       throw MErrorResponse(
  //         statusCode: HttpStatus.serviceUnavailable,
  //         statusMessage: "Cannot connect securely to server."
  //             " Please ensure that the server has a valid SSL configuration.",
  //       );
  //     }

  //     throw MErrorResponse(statusMessage: error);
  //   }
  // }

  // //NOTE - Update Product Unit
  // Future<MSuccessResponse> updateProductUnit({required dynamic data}) async {
  //   try {
  //     final response = await DioHelper.dio!.post(
  //       '/unit/update',
  //       data: data,
  //       options: Options(validateStatus: (status) => status! < 500),
  //     );
  //     if (response.statusCode == HttpStatus.ok) {
  //       if (MSuccessResponse.fromJson(response.data).success == false) {
  //         throw MErrorResponse(
  //           statusMessage:
  //               MSuccessResponse.fromJson(response.data).message.toString(),
  //           statusCode: response.statusCode,
  //         );
  //       }
  //       return MSuccessResponse.fromJson(response.data);
  //     } else if (response.statusCode == HttpStatus.notFound) {
  //       throw MErrorResponse(
  //         statusMessage: response.data['message'],
  //         statusCode: response.statusCode,
  //       );
  //     } else if (response.statusCode == HttpStatus.badRequest) {
  //       throw MErrorResponse(
  //         statusMessage: response.data['error'],
  //         statusCode: response.statusCode,
  //       );
  //     } else {
  //       throw MErrorResponse(
  //         statusMessage: globals["${response.statusCode}"].toString(),
  //         statusCode: response.statusCode,
  //       );
  //     }
  //   } catch (e) {
  //     //jika wifi no intenet
  //     if (e is TypeError) {
  //       throw MErrorResponse(
  //         statusCode: HttpStatus.serviceUnavailable,
  //         statusMessage: 'Service Unavailable',
  //       );
  //     }

  //     if (e is! DioError) rethrow;

  //     final error = e.error;
  //     if (error is SocketException) {
  //       throw MErrorResponse(
  //         statusCode: HttpStatus.serviceUnavailable,
  //         statusMessage: 'Service Unavailable',
  //       );
  //     }

  //     if (error is HandshakeException) {
  //       throw MErrorResponse(
  //         statusCode: HttpStatus.serviceUnavailable,
  //         statusMessage: "Cannot connect securely to server."
  //             " Please ensure that the server has a valid SSL configuration.",
  //       );
  //     }

  //     throw MErrorResponse(statusMessage: error);
  //   }
  // }

  // //NOTE - Create Product Unit
  // Future<MSuccessResponse> createProductUnit({required dynamic data}) async {
  //   try {
  //     final response = await DioHelper.dio!.post(
  //       '/unit/create',
  //       data: data,
  //       options: Options(validateStatus: (status) => status! < 500),
  //     );

  //     if (response.statusCode == HttpStatus.ok) {
  //       if (MSuccessResponse.fromJson(response.data).success == false) {
  //         throw MErrorResponse(
  //           statusMessage:
  //               MSuccessResponse.fromJson(response.data).message.toString(),
  //           statusCode: response.statusCode,
  //         );
  //       }
  //       return MSuccessResponse.fromJson(response.data);
  //     } else {
  //       throw MErrorResponse(
  //         statusMessage:
  //             MSuccessResponse.fromJson(response.data).message.toString(),
  //         statusCode: response.statusCode,
  //       );
  //     }
  //   } catch (e) {
  //     //jika wifi no intenet
  //     if (e is TypeError) {
  //       throw MErrorResponse(
  //         statusCode: HttpStatus.serviceUnavailable,
  //         statusMessage: 'Service Unavailable',
  //       );
  //     }

  //     if (e is! DioError) rethrow;

  //     final error = e.error;
  //     if (error is SocketException) {
  //       throw MErrorResponse(
  //         statusCode: HttpStatus.serviceUnavailable,
  //         statusMessage: 'Service Unavailable',
  //       );
  //     }

  //     if (error is HandshakeException) {
  //       throw MErrorResponse(
  //         statusCode: HttpStatus.serviceUnavailable,
  //         statusMessage: "Cannot connect securely to server."
  //             " Please ensure that the server has a valid SSL configuration.",
  //       );
  //     }

  //     throw MErrorResponse(statusMessage: error);
  //   }
  // }

  // //NOTE - Delete Product Unit
  // Future<MDeleteResponse> deleteProductUnit({required dynamic data}) async {
  //   try {
  //     final response = await DioHelper.dio!.post(
  //       '/unit/delete',
  //       data: data,
  //       options: Options(validateStatus: (status) => status! < 500),
  //     );
  //     if (response.statusCode == HttpStatus.ok) {
  //       if (MDeleteResponse.fromJson(response.data).success == false) {
  //         throw MErrorResponse(
  //           statusMessage: response.data['message'],
  //           statusCode: response.statusCode,
  //         );
  //       }
  //       return MDeleteResponse.fromJson(response.data);
  //     } else if (response.statusCode == HttpStatus.unauthorized) {
  //       throw MErrorResponse(
  //         statusMessage: response.data['message'],
  //         statusCode: response.statusCode,
  //       );
  //     } else if (response.statusCode == HttpStatus.notFound) {
  //       throw MErrorResponse(
  //         statusMessage: response.data['message'],
  //         statusCode: response.statusCode,
  //       );
  //     }
  //     // notFound
  //     else {
  //       throw MErrorResponse(
  //         statusMessage: globals["${response.statusCode}"].toString(),
  //         statusCode: response.statusCode,
  //       );
  //     }
  //   } catch (e) {
  //     //jika wifi no intenet
  //     if (e is TypeError) {
  //       throw MErrorResponse(
  //         statusCode: HttpStatus.serviceUnavailable,
  //         statusMessage: 'Service Unavailable',
  //       );
  //     }

  //     if (e is! DioError) rethrow;

  //     final error = e.error;
  //     if (error is SocketException) {
  //       throw MErrorResponse(
  //         statusCode: HttpStatus.serviceUnavailable,
  //         statusMessage: 'Service Unavailable',
  //       );
  //     }

  //     if (error is HandshakeException) {
  //       throw MErrorResponse(
  //         statusCode: HttpStatus.serviceUnavailable,
  //         statusMessage: "Cannot connect securely to server."
  //             " Please ensure that the server has a valid SSL configuration.",
  //       );
  //     }

  //     throw MErrorResponse(statusMessage: error);
  //   }
  // }
}
