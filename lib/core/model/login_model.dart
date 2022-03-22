class LoginModel {
  LoginModel({this.success});
  Success? success;
  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        success: Success.fromJson(json["success"]),
      );
}

class Success {
  final int? id;
  final String? name;
  final String? phone;
  final String? token;

  Success({this.id, this.name, this.phone, this.token});

  factory Success.fromJson(jsonData) => Success(
        id: jsonData['id'],
        name: jsonData['name'],
        phone: jsonData['phone'],
        token: jsonData['token'],
      );
}
