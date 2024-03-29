import 'package:flash_market/model/home/flash_market_model.dart';
import 'package:flash_market/size_config.dart';
import 'package:flutter/material.dart';

import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flash_market/constrains/constants.dart';


List banners = [];



Widget bannerBox(BuildContext context, List<TopBanners> topBanners) {

  return SizedBox(
    height: getProportionateScreenHeight(190),
    // width: double.infinity,
    child: ImageSlideshow(
      indicatorColor: kPrimaryColor,
      isLoop: true,
      onPageChanged: (value) {
        // debugPrint('Page changed: $value');
      },
      autoPlayInterval: 6000,
      children: [
        for (var i = 0; i < topBanners.length; i++)
        //   Image.network(
        //   topBanners[i].bannerImage as String,
        //   fit: BoxFit.cover,
        // ),
          FadeInImage.assetNetwork(placeholder: 'assets/images/loading_small.png', image: topBanners[i].bannerImage as String, fit: BoxFit.cover,),
        // Image.network(
        //   topBanners[1].bannerImage as String,
        //   fit: BoxFit.cover,
        // ),
        // Image.network(
        //   topBanners[2].bannerImage as String,
        //   fit: BoxFit.cover,
        // ),
        // Image.network(
        //   topBanners[3].bannerImage as String,
        //   fit: BoxFit.cover,
        // ),
      ],
    ),
  );
}
