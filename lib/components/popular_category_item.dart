import 'package:flash_market/size_config.dart';
import 'package:flutter/material.dart';


Widget popularCategoryItem(BuildContext context, String categoryImage, String categoryName){
  return  Container( 
    margin: const EdgeInsets.only(right: 15.0),
    height: getProportionateScreenHeight(96),
    width: getProportionateScreenWidth(75),
    child: Card(
      elevation: 2,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: FittedBox(
        fit: BoxFit.contain,
        child: Column(
          children: [
            SizedBox(
              height: 60,
                width: 60,
                child: Image.network(categoryImage)),
            const SizedBox(height: 4.0,),
            SizedBox(
              width: 65,
              child: Text(categoryName, textAlign: TextAlign.center, style: const TextStyle(
                fontSize: 14, fontFamily: 'Roboto'
              ),),
            ),
          ],
        ),
      ),
    ),
    ),
  );
}