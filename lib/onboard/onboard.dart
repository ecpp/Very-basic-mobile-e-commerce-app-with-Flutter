import 'package:cs310group28/main.dart';
import 'package:cs310group28/onboard/onboard_model.dart';
import 'package:cs310group28/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cs310group28/routes/welcome_page.dart';


class OnBoard extends StatefulWidget {
  @override
  _OnBoardState createState() => _OnBoardState();
}

class _OnBoardState extends State<OnBoard> {
  int currentIndex = 0;
  late PageController _pageController;
  List<OnboardModel> screens = <OnboardModel>[
    OnboardModel(

      img: 'https://cdn0.iconfinder.com/data/icons/shopping-and-commerce-outline/512/Shopping_and_Commerce_-_Outline_21-512.png',
      text: "SHOPPING ONLINE!",
      desc:
      "You can buy everything on E-GAYME 7/24 and online!",
      bg: AppColors.maintextColor,
      button: AppColors.maintitleBackColor,
    ),
    OnboardModel(
      img: 'http://cdn.onlinewebfonts.com/svg/img_405532.png',
      text: "CLICK AND BUY!",
      desc:
      "Just click and add to cart, then buy! ",
      bg: AppColors.maintextColor,
      button: AppColors.maintitleBackColor,
    ),
    OnboardModel(

      img: 'https://i.pinimg.com/originals/14/64/53/146453abcd0d77e10444895668151bd0.png',
      text: "ENJOY!",
      desc:
      "We serve you just because you are what you are :)",
      bg: AppColors.maintextColor,
      button: AppColors.maintitleBackColor,
    ),
  ];

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  _storeOnboardInfo() async {
    print("Shared pref called");
    int isViewed = 0;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('onBoard', isViewed);
    print(prefs.getInt('onBoard'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.walkBG,
      appBar: AppBar(
        backgroundColor: AppColors.walkBG,
        elevation: 0.0,
        actions: [
          TextButton(
            style: TextButton.styleFrom(
              padding: const EdgeInsets.all(16.0),
              primary: Colors.white,
              textStyle: const TextStyle(fontSize: 20),
            ),
            onPressed: () {
              _storeOnboardInfo();
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => WelcomePage()));
            },
            child: Text(
              "Skip",
              style: TextStyle(
                color: AppColors.maintextColor,

              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: PageView.builder(
            itemCount: screens.length,
            controller: _pageController,

            onPageChanged: (int index) {
              setState(() {
                currentIndex = index;
              });
            },
            itemBuilder: (_, index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.network(screens[index].img,height: 300, width: 225,),
                  Container(
                    height: 10.0,
                    child: ListView.builder(
                      itemCount: screens.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 3.0),
                                width: currentIndex == index ? 25 : 8,
                                height: 8,
                                decoration: BoxDecoration(
                                  color: currentIndex == index
                                      ? AppColors.maintitleBackColor
                                      : AppColors.walkColor,
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            ]);
                      },
                    ),
                  ),
                  Text(
                    screens[index].text,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 27.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                      color: AppColors.maintextColor,
                    ),
                  ),
                  Text(
                    screens[index].desc,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14.0,
                      fontFamily: 'Montserrat',
                      color: AppColors.maintextColor,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly, //Center Row contents horizontally,
                    children: [
                      InkWell(
                        onTap: () async {
                          //print(index);
                          if (index != 0) {
                            _pageController.previousPage(
                              duration: Duration(milliseconds: 600),
                              curve: Curves.ease,
                            );
                          }


                        },
                        child: Container(
                          padding:
                          EdgeInsets.symmetric(horizontal: 45.0, vertical: 6),
                          decoration: BoxDecoration(
                              color: AppColors.maintitleBackColor,
                              borderRadius: BorderRadius.circular(15.0)),
                          child: Row(mainAxisSize: MainAxisSize.min, children: [
                            Icon(Icons.arrow_back_rounded, size: 18,),
                          ]),
                        ),
                      ),
                      InkWell(
                        onTap: () async {
                          //print(index);
                          if (index == screens.length - 1) {
                            await _storeOnboardInfo();
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (context) => WelcomePage()));
                          }

                          _pageController.nextPage(
                            duration: Duration(milliseconds: 600),
                            curve: Curves.ease,
                          );

                        },
                        child: Container(
                          padding:
                          EdgeInsets.symmetric(horizontal: 45.0, vertical: 6),
                          decoration: BoxDecoration(
                              color: AppColors.maintitleBackColor,
                              borderRadius: BorderRadius.circular(15.0)),
                          child: Row(mainAxisSize: MainAxisSize.min, children: [
                            Icon(Icons.arrow_forward_rounded, size: 18,),
                          ]),
                        ),
                      )
                    ],
                  )
                ],
              );
            }),
      ),
    );
  }
}
