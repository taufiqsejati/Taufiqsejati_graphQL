import 'config.dart';
import 'dio_helper.dart';

initApiConfig() async {
  await DioHelper.init(Config().baseUrl!);
}

String getAbsoluteUrl(String url) {
  return Uri.encodeFull("${Config().baseUrl}$url");
}
