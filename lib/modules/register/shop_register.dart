 import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/modules/register/cubit/cubit.dart';
import 'package:shop_app/modules/register/cubit/states.dart';

import '../../layouts/shop_layout/shop_layouts.dart';
import '../../shared/components/components.dart';
import '../../shared/components/constants.dart';
import '../../shared/network/local/cache_helper.dart';
import '../login/cubit/cubit.dart';
import '../login/cubit/states.dart';

class ShopRegisterScreen extends StatelessWidget {
   ShopRegisterScreen({Key? key}) : super(key: key);
  var formKey = GlobalKey<FormState>();
   var emailAddressController= TextEditingController();
   var passwordController= TextEditingController();
   var phoneController= TextEditingController();
   var nameController= TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>ShopRegisterCubit(),
      child: BlocConsumer<ShopRegisterCubit,ShopRegisterStates>(
        listener: (context,state){
          if (state is ShopRegisterSuccessState)
          {
            if (state.loginModel.status)
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
        builder: (context,state){
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
                          'REGISTER',
                          style: Theme.of(context).textTheme.headline4!.copyWith(
                              color: Colors.black
                          ),
                        ),
                        Text(
                          'Register now to browse our hot offers ',
                          style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(
                          height: 30.0,
                        ),
                        defaultTextForm(
                          controller: nameController,
                          type: TextInputType.name,
                          validate: (String? value)
                          {
                            if (value!.isEmpty){
                              return 'please enter your name';
                            }
                          },
                          label: 'User Name',
                          prefix: Icons.person,
                        ),
                        SizedBox(
                          height: 15.0,
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
                          suffix: ShopRegisterCubit.get(context).suffix,
                          isPassword: ShopRegisterCubit.get(context).isPassword,
                          suffixPressed: (){
                            ShopRegisterCubit.get(context).ChangePasswordVisibility();
                          },
                          onSubmit: (value){

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
                        defaultTextForm(
                          controller: phoneController,
                          type: TextInputType.phone,
                          validate: (String? value)
                          {
                            if (value!.isEmpty){
                              return 'please enter your phone';
                            }
                          },
                          label: 'Phone',
                          prefix: Icons.phone,
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        ConditionalBuilder(
                          condition: state is! ShopRegisterLoadingState,
                          builder: (context)=>defaultButton(function: ()
                          {
                            if (formKey.currentState!.validate())
                            {
                              ShopRegisterCubit.get(context).userRegister(
                                name: nameController.text,
                                email: emailAddressController.text,
                                password: passwordController.text,
                                phone:phoneController.text ,
                              );
                            }

                          },
                              text: 'Register',
                              isUpperCase: true
                          ),
                          fallback: (context)=> Center(child: CircularProgressIndicator()),

                        ),
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
