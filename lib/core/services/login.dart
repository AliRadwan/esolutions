import 'package:esolutions/core/model/login_model.dart';
import 'package:esolutions/utils/helper/api.dart';

import '../../constant.dart';

class Auth {
  Future<LoginModel> login(
      {required String email, required String password}) async {
    Map<String, dynamic> body = {
      'email': email,
      'password': password,
      'device_token': '123'
    };
    Map<String, dynamic> data = await Api().post(url: Url.login, body: body);
    return LoginModel.fromJson(data);
  }
}
