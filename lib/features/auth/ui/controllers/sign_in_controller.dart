import 'package:crafty_bay/app/app_urls.dart';
import 'package:crafty_bay/core/network_caller/network_caller.dart';
import 'package:crafty_bay/features/auth/data/sign_in_model.dart';
import 'package:get/get.dart';

class SignInController extends GetxController {
  bool _isLoading = false;

  bool get isLoading => _isLoading;
  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  Future<bool> signIn(SignInModel signInModel) async {
    bool isSuccess = false;
    _isLoading = true;
    update();
    final NetworkResponse response =
        await Get.find<NetworkCaller>().postRequest(
      url: AppUrls.signInUrl,
          body: signInModel.toJson()
    );
    if (response.isSuccess) {
      _errorMessage = null;
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }
    _isLoading = false;
    update();
    return isSuccess;
  }
}
