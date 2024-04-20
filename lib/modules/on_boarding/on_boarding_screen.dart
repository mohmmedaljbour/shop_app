 import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/modules/login/shop_login.dart';
import 'package:shop_app/shared/network/local/cache_helper.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
 import 'package:shared_preferences/shared_preferences.dart';

import '../../shared/components/components.dart';
import '../../shared/styles/colors.dart';
class BoardingModel{
  late final String image;
  late final String title;
  late final String body;
  BoardingModel({
    required this.title,
    required this.image,
    required this.body,
});
}
class OnBoardingScreen extends StatefulWidget {
   OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
 var boardController= PageController();

 bool isLast= false;

  List<BoardingModel> boarding =[
    BoardingModel(
        title: 'on Board 1 Title',
        image: 'assets/images/onBoarding1.jpg',
        body: 'On board 1 Body ',
  ),
    BoardingModel(
        title: 'on Board 2 Title',
        image: 'assets/images/onBoarding2.jpg',
        body: 'On board 2 Body ',
  ),
    BoardingModel(
        title: 'on Board 3 Title',
        image: 'assets/images/onboard3.jpg',
        body: 'On board 3 Body ',
  ),
  ];
  void submit(){
    CacheHelper.saveDate(key: 'onBoarding', value: true,).then((value)
    {
      if(value=true){
        navigateAndFinish(
          context,
          ShopLoginScreen(),
        );
      }

    });


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: submit,
              child: Text('SKIP')
          )
        ],
      ),
      body:  Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column (
          children: [
            Expanded(
              child: PageView.builder(
                controller: boardController,
                physics: BouncingScrollPhysics(),
                onPageChanged: (int index){
                  if (index == boarding.length -1){
                    print('the last ');
                    setState(() {
                      isLast = true;
                    });
                  }
                  else
                    {
                      setState(() {
                        isLast =false;
                      });
                    }
                },
                itemBuilder: (context,index)=> BuildBoardingItem(boarding[index]),
              itemCount: boarding.length,
              ),
            ),
            const SizedBox(
              height: 40.0,
            ),
            Row(
              children: [
                SmoothPageIndicator(
                    controller: boardController,
                    effect: ExpandingDotsEffect(
                      dotColor: Colors.grey,
                      activeDotColor: defaultColor,
                      dotHeight: 10,
                      expansionFactor: 4,
                      dotWidth: 10,
                      spacing: 5.0,
                    ),
                    count: boarding.length,),
                Spacer(),
                FloatingActionButton(onPressed: (){
                  if (isLast){
                    submit();
                  }
                  else
                    {
                      boardController.nextPage(duration: Duration(
                        milliseconds: 750,
                      ),
                        curve: Curves.fastLinearToSlowEaseIn,
                      );
                    }

                },
                child: Icon(Icons.arrow_forward_ios),
                ),
              ],
            )

          ],
        ),
      )
    );
  }
  Widget BuildBoardingItem (BoardingModel model)=> Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(
        child: Image(
          image: AssetImage('${model.image}'),
        ),
      ),
      SizedBox(
        height: 30.0,
      ),
      Text(
        '${model.title}',
        style: TextStyle(
          fontSize: 24.0,
          fontFamily: 'Janna',
        ),
      ),
      SizedBox(
        height: 15.0,
      ),
      Text(
        '${model.body}',
        style: TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(
        height: 15.0,
      ),

    ],
  );
}
