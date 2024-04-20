
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shop_app/layouts/shop_layout/shop_layouts.dart';
import 'package:shop_app/models/shop_app/cubit/states.dart';
import 'package:shop_app/modules/login/shop_login.dart';
import 'package:shop_app/shared/components/constants.dart';
import 'package:shop_app/shared/network/local/cache_helper.dart';
import 'package:shop_app/shared/network/remote/dio_helper.dart';
import 'package:shop_app/shared/styles/bloc_observer.dart';
import 'package:shop_app/shared/styles/themes.dart';

import 'models/shop_app/cubit/cubit.dart';
import 'modules/on_boarding/on_boarding_screen.dart';


void main() async
{
   WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer =MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
  Widget widget;
  bool ? onBoarding = CacheHelper.getData(key: 'onBoarding');
  token = CacheHelper.getData(key: 'token');
  print(token);
  // ignore: unnecessary_null_comparison
  if (onBoarding != null)
    {
      // ignore: unnecessary_null_comparison
      if(token != null )widget = ShopLayout();
      else widget = ShopLoginScreen();
    }
  else widget = OnBoardingScreen();
  print(onBoarding);

  runApp( MyApp(widget));
}

class MyApp extends StatelessWidget {

final Widget startWidget;

MyApp(this.startWidget);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
         return BlocProvider(
          create: (BuildContext context) =>ShopCubit()..getHomeData()..getCategories()..getFavorites()..getUserData(),
          child: BlocConsumer<ShopCubit , ShopStates>(
            listener: (context , state){},
            builder: (context , state){
              return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  theme: lightTheme,
                  darkTheme: darkTheme,
                  home:startWidget
              );
            },
          ),
        );
      }
  }
