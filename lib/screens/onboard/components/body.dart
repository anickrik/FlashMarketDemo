import 'package:flash_market/screens/signup/signup_screen.dart';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'body_item.dart';
import 'onboard_model.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentIndex = 0;
  late PageController _pageController;
  List<OnboardModel> screens = <OnboardModel>[
    OnboardModel(
      img: 'assets/images/group_1241.png',
      text: "Browse Deals & Flash Sales",
      desc:
          "It was an old hand at the Pacific, the English adventurer Captain Peter Dillon, who was the first to pick up the trail left by castaways from the wrecked vessels who was the first to pick up the trail.",
    ),
    OnboardModel(
      img: 'assets/images/group_1242.png',
      text: "Shop From Businesses Around You",
      desc:
          "It was an old hand at the Pacific, the English adventurer Captain Peter Dillon, who was the first to pick up the trail left by castaways from the wrecked vessels who was the first to pick up the trail.",
    ),
    OnboardModel(
      img: 'assets/images/group_1243.png',
      text: "Save It For Later",
      desc:
          "It was an old hand at the Pacific, the English adventurer Captain Peter Dillon, who was the first to pick up the trail left by castaways from the wrecked vessels who was the first to pick up the trail.",
    ),
  ];

  void _skipOnboard() {
    _pageController.jumpToPage(2);
  }

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

  _getStarted() {
    _storeOnboardInfo();
    Navigator.pushReplacementNamed(context, SignupScreen.routeName);
    // Navigator.of(context).pushReplacement(
    //     MaterialPageRoute(builder: (context) => const SignupScreen()));
  }

  _storeOnboardInfo() async {
    // print("Shared pref called");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isFirstTime', true);
    // print(prefs.getBool('isFirstTime'));
  }

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(
    //     const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   backgroundColor: Colors.transparent,
        //   elevation: 0.0,
        //   actions: [
        //     IconButton(onPressed: _skipOnboard, icon: Image.asset('assets/icons/circle_close.png', height: 32, width: 32,)/*const Icon(Icons.close_rounded, color: Colors.black,)*/)
        //   ],
        // ),
        body: Stack(
              alignment: Alignment.topRight,
              children: [
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    PageView.builder(
                      itemCount: screens.length,
                      scrollDirection: Axis.horizontal,
                      controller: _pageController,
                      // physics: const NeverScrollableScrollPhysics(),
                      onPageChanged: (int index) {
                        setState(() {
                          currentIndex = index;
                        });
                      },
                      itemBuilder: (_, index) {
                        return BodyItem(
                            image: screens[index].img,
                            title: screens[index].text,
                            description: screens[index].desc);
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Stack(
                        children: [
                          SmoothPageIndicator(
                            controller: _pageController,
                            count: 3,
                            effect: const SlideEffect(
                                activeDotColor: Colors.black87,
                                dotHeight: 8.0,
                                dotWidth: 8.0),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5.0),
                      child: Stack(
                        children: [
                          IconButton(
                            onPressed: _skipOnboard,
                            icon: Image.asset(
                              'assets/icons/circle_close.png',
                              height: 32,
                              width: 32,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            (currentIndex == (screens.length - 1))
                ? _getStarted()
                : _pageController.nextPage(
                    duration: const Duration(microseconds: 500),
                    curve: Curves.easeInCirc);
          },
          icon: (currentIndex == (screens.length - 1))
              ? Text("Get Started", style: TextStyle(color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),)
              : Text('Next', style: TextStyle(color: Theme.of(context).primaryColor,fontWeight: FontWeight.bold, fontStyle: FontStyle.italic)),
          label: Icon(Icons.arrow_forward_ios,color: Theme.of(context).primaryColor),
          backgroundColor: Colors.white,
        ),
      ),
    );
  }
}
