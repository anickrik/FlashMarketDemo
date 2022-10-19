import 'package:flutter/material.dart';

import '../../../size_config.dart';

class BodyItem extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  const BodyItem({Key? key, required this.image, required this.title, required this.description}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(image),
              fit: BoxFit.cover
        )
      ),
      child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: getProportionateScreenHeight(260),),
              Padding(
                padding: const EdgeInsets.all(9.0),
                child: Text(title,textAlign: TextAlign.center,style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w600, color: Colors.white),),
              ),
              const SizedBox(height: 15.0,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22.0, vertical: 12.0),
                child: Text(description,style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400,color: Colors.white),textAlign: TextAlign.center),
              ),
            ],
          ),
      ),
    );
  }
}
