import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/models/shop_app/favorites_model.dart';

import '../../models/shop_app/cubit/cubit.dart';
import '../../models/shop_app/cubit/states.dart';
import '../../shared/components/components.dart';
import '../../shared/styles/colors.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return ConditionalBuilder(
          condition: state is! ShopLoadingGetFavoritesState,
          builder: (context) => ListView.separated(
            itemBuilder: (context, index) => BuildListProduct(
                ShopCubit.get(context).favoritesModel!.data.data[index].product,
                context),
            separatorBuilder: (context, index) => myDivider(),
            itemCount: ShopCubit.get(context).favoritesModel?.data.data.length ?? 0,
          ),
          fallback: (context) => Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
