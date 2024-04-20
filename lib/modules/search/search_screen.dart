 import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/modules/search/cubit/cubit.dart';
import 'package:shop_app/modules/search/cubit/states.dart';
import 'package:shop_app/shared/components/components.dart';

import '../../models/shop_app/cubit/cubit.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    var searchController = TextEditingController();
    return  BlocProvider(
      create: (BuildContext context) => SearchCubit(),
      child: BlocConsumer<SearchCubit , SearchStates>(
        listener: (context , state){},
        builder: (context , state){
          return Scaffold(
            appBar: AppBar(),
            body: Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    defaultTextForm(
                        controller: searchController,
                        type: TextInputType.text,
                        validate: (String? value){
                          if (value!.isEmpty)
                            {
                              return 'enter text to search';
                            }
                          return null ;
                        },

                        label: 'Search',
                      onSubmit: (String text)
                      {
                        SearchCubit.get(context).search(text);
                      },
                        prefix: Icons.search,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),

                    if(state is SearchLoadingState)
                    LinearProgressIndicator(),
                    SizedBox(
                      height: 10.0,
                    ),
                    if (state is SearchSuccessState)
                    Expanded(
                      child: ListView.separated(
                        itemBuilder: (context, index) => BuildListProduct(
                            SearchCubit.get(context).model?.data.data[index],context, isOldPrise: false ),
                        separatorBuilder: (context, index) => myDivider(),
                        itemCount: SearchCubit.get(context).model!.data.data.length ,
                      ),
                    ),

                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
