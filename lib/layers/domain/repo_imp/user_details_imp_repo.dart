import 'package:impacteers/layers/data/api_provider/api_provider.dart';
import 'package:impacteers/layers/data/models/user_model.dart';
import 'package:impacteers/layers/domain/repo_abstract/user_details_repo.dart';

class UserDetailsimp implements UserDetailsRepo {
  ApiProvider api = ApiProvider();

  UserDetailsimp();
  @override
  Future<UserModel> getList({int pageIndex = 1}) async {
    final String response = await api.get('api/users?page=$pageIndex');
    final UserModel userModel = UserModel.fromJson(response);
    return userModel;
  }
}
