import 'package:flash_market/screens/onboard/onboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('homePage'),
        actions: [
          IconButton(onPressed: () async {
            print('Resetting Shared Preference value');
            final prefs = await SharedPreferences.getInstance();
            prefs.setBool('isFirstTime', false);
            print(prefs.getBool('isFirstTime'));
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const OnboardScreen()));
          }, icon: const Icon(Icons.logout_outlined))
        ],
      ),
      body: const Center(
        child: Text('HomePage'),
      ),
    );
  }
}
