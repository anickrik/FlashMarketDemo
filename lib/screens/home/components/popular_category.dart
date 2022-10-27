import 'package:flash_market/model/home/flash_market_model.dart';
import 'package:flutter/material.dart';

import '../../../components/label_title.dart';
import '../../../components/popular_category_item.dart';
import '../../../size_config.dart';


Widget popularCategory(List<PopularCategories> popularCategories){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: LabelTitle(
          title: "Popular Category",
          textColor: Colors.black,
        ),
      ),
      SizedBox(
        height: getProportionateScreenHeight(13),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SizedBox(
          // width: SizeConfig.screenWidth,
          height: 90,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: popularCategories.length,
            itemBuilder: (context, index) {
              return popularCategoryItem(
                  context,
                  popularCategories[index]
                      .categoryImage as String,
                  popularCategories[index]
                      .categoryName as String);
            },
          ),
        ),
      ),
    ],
  );
}