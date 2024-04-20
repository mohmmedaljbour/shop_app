import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/models/shop_app/login_model.dart';
import 'package:shop_app/modules/login/cubit/states.dart';
import 'package:shop_app/modules/register/cubit/states.dart';
import 'package:shop_app/shared/network/remote/dio_helper.dart';

import '../../../shared/network/end_points.dart';

class ShopRegisterCubit extends Cubit<ShopRegisterStates>
{
  ShopRegisterCubit() : super(ShopRegisterInitialState());
 static ShopRegisterCubit get(context)=> BlocProvider.of(context);
late ShopLoginModel loginModel;

 void userRegister(
  {
  required String? email,
  required String? name,
  required String? phone,
  required String? password,
}
)
 {
   emit(ShopRegisterLoadingState());

   DioHelper.postData(
       url: REGISTER,
       data: {
         'email':email ,
         'name':name ,
         'phone':phone ,
         'password':password
       }
   ).then((value) {
     // ignore: avoid_print
     print(value?.data);
     loginModel= ShopLoginModel.fromJson(value?.data);
     print(loginModel.data.email);
     emit(ShopRegisterSuccessState(loginModel));
   }).catchError((error)
   {
     print(error);
     emit(ShopRegisterErrorState(error.toString()));
   });
 }
IconData suffix =Icons.visibility_outlined;
 bool isPassword = true ;
 // ignore: non_constant_identifier_names
 void ChangePasswordVisibility(){
   isPassword = !isPassword;
   suffix = isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
   emit(ChangeRegisterPasswordVisibilityState());

 }
}
