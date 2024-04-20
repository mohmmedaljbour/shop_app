import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shop_app/layouts/shop_layout/shop_layouts.dart';
import 'package:shop_app/shared/components/constants.dart';
import 'package:shop_app/shared/network/local/cache_helper.dart';
import 'package:shop_app/modules/login/cubit/cubit.dart';
import 'package:shop_app/modules/login/cubit/states.dart';
import 'package:shop_app/shared/components/components.dart';

import '../register/shop_register.dart';

class ShopLoginScreen extends StatelessWidget {
   ShopLoginScreen({Key? key}) : super(key: key);
  var emailAddressController= TextEditingController();
  var passwordController= TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
     return BlocProvider(
      create: (BuildContext context)=>ShopLoginCubit(),
      child: BlocConsumer <ShopLoginCubit , ShopLoginStates>(
        listener: (context , state){
          if (state is ShopLoginSuccessState)
          {
            if (state.loginModel.status=true)
              {
                print(state.loginModel.message);
                print(state.loginModel.data.token);
                CacheHelper.saveDate(
                    key: 'token',
                    value: state.loginModel.data.token
                ).then((value) {
                  token=state.loginModel.data.token;
                  navigateAndFinish(
                    context,
                    ShopLayout(),
                  );
                });
              }
            else
              {
                print(state.loginModel.message);
              showToast(
                  text: state.loginModel.message,
                  state: ToastStates.WARNING,
              );
              }

          }
        },
        builder: (context , state){
          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'LOGIN',
                          style: Theme.of(context).textTheme.headline4!.copyWith(
                              color: Colors.black
                          ),
                        ),
                        Text(
                          'login now to browse our hot offers ',
                          style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(
                          height: 30.0,
                        ),
                        defaultTextForm(
                          controller: emailAddressController,
                          type: TextInputType.emailAddress,
                          validate: (String? value)
                          {
                            if (value!.isEmpty){
                              return 'please enter your email address';
                            }
                          },
                          label: 'Email Address',
                          prefix: Icons.email_outlined,
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        defaultTextForm(
                          controller: passwordController,
                          type: TextInputType.visiblePassword,
                          suffix: ShopLoginCubit.get(context).suffix,
                          isPassword: ShopLoginCubit.get(context).isPassword,
                          suffixPressed: (){
                            ShopLoginCubit.get(context).ChangePasswordVisibility();
                          },
                          onSubmit: (value){
                            if (formKey.currentState!.validate())
                            {
                              ShopLoginCubit.get(context).userLogin(
                                email: emailAddressController.text,
                                password: passwordController.text,
                              );
                            }
                          },
                          validate: (String? value)
                          {
                            if (value!.isEmpty){
                              return 'Password is too short';
                            }
                          },
                          label: 'Password',
                          prefix: Icons.lock_outline,
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        ConditionalBuilder(
                          condition: state is! ShopLoginLoadingState,
                          builder: (context)=>defaultButton(function: ()
                          {
                            if (formKey.currentState!.validate())
                            {
                              ShopLoginCubit.get(context).userLogin(
                                email: emailAddressController.text,
                                password: passwordController.text,
                              );
                            }

                          },
                              text: 'Login',
                              isUpperCase: true
                          ),
                           fallback: (context)=> Center(child: CircularProgressIndicator()),

                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                                'don\'t have an account? '
                            ),
                            defaultTextButton(function: (){
                              navigateTo(
                                context,
                                ShopRegisterScreen(),
                              );
                            }, text: 'Register'
                            )

                          ],
                        )

                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
