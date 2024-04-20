import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../models/shop_app/cubit/cubit.dart';
import '../styles/colors.dart';

Widget myDivider ()=>Padding(
  padding: const EdgeInsets.all(20.0),
  child: Container(
    width: double.infinity,
    height: 1.0,
    color: Colors.grey[300],
  ),
);


Widget defaultTextForm({
  required TextEditingController controller,
  required TextInputType type ,
  var onSubmit,
  var onChanged,
  var onTap,
  required var validate,
  required String? label,
  required IconData prefix,
  IconData? suffix,
  var suffixPressed,
  bool isPassword = false

})=>TextFormField(
  validator: validate,

  controller: controller,
  keyboardType: type,
  onFieldSubmitted: onSubmit,
  onChanged: onChanged,
  obscureText: isPassword,
  onTap: onTap ,
  decoration:  InputDecoration(
    labelText: label,
    prefixIcon: Icon(
      prefix,
    ),
    suffixIcon: suffix != null ? IconButton(
      onPressed: suffixPressed,
      icon: Icon(
        suffix,
      ),
    ) : null,
    border: OutlineInputBorder(),

  ),
);


Widget defaultTextButton({
  required final VoidCallback function,
  required String text
})=>TextButton(
   onPressed: function,
  child: Text(text.toUpperCase()),);


void navigateTo( context , widget)=>Navigator.push(
    context,
    MaterialPageRoute(builder: (context)=>widget,
    )
);
void navigateAndFinish(context , widget)=>Navigator.pushAndRemoveUntil(
    context, MaterialPageRoute(builder: (context)=>widget),
        (route) => false);

Widget defaultButton({
  double width = double.infinity,
  Color background = Colors.blue,
  bool isUpperCase = true,
  required final VoidCallback function ,
  required String text ,

}) => Container(
  width: width,
  color: background,

  child: MaterialButton(
    onPressed: function ,
    child: Text(
      isUpperCase ? text.toUpperCase()  : text,
      style: const TextStyle(
        color: Colors.white,

      ),
    ),
  ),
);

void showToast({
  required String text,
  required ToastStates state ,

})=>Fluttertoast.showToast(
    msg: text,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 5,
    backgroundColor: chooseColorToast(state),
    textColor: Colors.amber,
    fontSize: 16.0
);

enum ToastStates{SUCCESS , ERROR , WARNING }
Color chooseColorToast (ToastStates state)
{
  Color color;
  switch(state)
  {
    case ToastStates.SUCCESS:
      color = Colors.green;
      break;
    case ToastStates.ERROR:
      color = Colors.red;
      break;
    case ToastStates.WARNING:
      color = Colors.amber;
      break;
  }
  return color;
}
Widget BuildListProduct( model, context, {bool isOldPrise = true}) => Padding(
  padding: const EdgeInsets.all(20.0),
  child: Container(
    height: 120.0,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomStart,
          children: [
            Image(
              image: NetworkImage(model.image),
              width: 120.0,
              height: 120.0,
            ),
            if (model.discount != 0 && isOldPrise)
              Container(
                color: Colors.red,
                padding: EdgeInsets.symmetric(
                  horizontal: 5.0,
                ),
                child: const Text(
                  'DISCOUNT',
                  style: TextStyle(
                    fontSize: 8.0,
                    color: Colors.white,
                  ),
                ),
              ),
          ],
        ),
        SizedBox(
          width: 20.0,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                model.name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 14.0,
                  height: 1.3,
                ),
              ),
              Spacer(),
              Row(
                children: [
                  Text(
                    model.price.toString(),
                    style: TextStyle(
                      fontSize: 12.0,
                      color: defaultColor,
                    ),
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  if (model.discount != 0 && isOldPrise)
                    Text(
                      model.oldPrice.toString(),
                      style: const TextStyle(
                        fontSize: 10.0,
                        color: Colors.grey,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                  Spacer(),
                  IconButton(
                      onPressed: () {
                        ShopCubit.get(context)
                            .changeFavorites(model.id);
                      },
                      icon: CircleAvatar(
                        radius: 15.0,
                        backgroundColor: ShopCubit.get(context)
                            .favorites[model.id]!
                            ? defaultColor
                            : Colors.grey,
                        child: Icon(
                          Icons.favorite_border,
                          size: 15.0,
                          color: Colors.white,
                        ),
                      ))
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  ),
);