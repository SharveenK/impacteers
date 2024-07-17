import 'package:impacteers/layers/data/models/user_model.dart';

abstract class UserDetailsRepo {
  Future<UserModel> getList({int pageIndex = 1});
}
