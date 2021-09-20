import '../constants.dart';
import '../model/user_model.dart';

class UserViewModel {
  User? _user;

  UserViewModel({User? user}) : _user = user;

  int? get id {
    return _user?.id;
  }

  String? get name {
    return _user?.name;
  }

  String? get email {
    return _user?.email;
  }

  int? get active {
    return _user?.active;
  }

  String? get gender {
    return _user?.gender;
  }

  String? get avatar {
    return '$apiUserImageUrl/${_user?.avatar}';
  }

  String? get createdAt {
    return _user?.createdAt;
  }
}
