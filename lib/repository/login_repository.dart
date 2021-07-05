import 'package:pharmacy/api_provider/registration_api_provider.dart';
import 'package:pharmacy/models/login_model.dart';

class LoginRepository {
  final apiProvider = LoginApiProvider();

  Future<String> fetchSigninRespose(var body) => apiProvider.fetchSigninRespose(body);
}
