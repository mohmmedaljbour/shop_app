import 'package:shop_app/models/shop_app/change_favorites_model.dart';
import 'package:shop_app/models/shop_app/login_model.dart';
import 'package:shop_app/models/shop_app/profile_model.dart';

abstract class ShopStates {}

class ShopInitialState extends ShopStates {}

class ShopChangeBottomNavState extends ShopStates {}
class ShopLoadingHomeDataState extends ShopStates {}

class ShopSuccessHomeDataState extends ShopStates {}

class ShopErrorHomeDataState extends ShopStates {}

class ShopSuccessCategoriesState extends ShopStates {}

class ShopErrorCategoriesState extends ShopStates {}

class ShopSuccessChangeFavoritesState extends ShopStates {

  final ChangeFavoritesModel model;

  ShopSuccessChangeFavoritesState(this.model);
}
class ShopChangeFavoritesState extends ShopStates {}

class ShopErrorChangeFavoritesState extends ShopStates {}

class ShopSuccessGetFavoritesState extends ShopStates {}

class ShopErrorGetFavoritesState extends ShopStates {}

class ShopLoadingGetFavoritesState extends ShopStates {}

class ShopSuccessUserDataState extends ShopStates {

  // ignore: non_constant_identifier_names
  final ShopLoginModel profileModel;

  ShopSuccessUserDataState(this.profileModel);
}

class ShopErrorUserDataState extends ShopStates {}

class ShopLoadingUserDataState extends ShopStates {}

class ShopSuccessUpdateUserState extends ShopStates {

  // ignore: non_constant_identifier_names
  final ShopLoginModel profileModel;

  ShopSuccessUpdateUserState(this.profileModel);
}

class ShopErrorUpdateUserState extends ShopStates {}

class ShopLoadingUpdateUserState extends ShopStates {}

