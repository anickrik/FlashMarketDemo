
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flash_market/provider/auth.dart';

import '../../../components/custom_item_container_home_screen.dart';
import '../../../constrains/constants.dart';
import '../../../model/flash_market_model.dart';
import '../../../size_config.dart';

import 'banner_box.dart';
import 'featured_business_item_card.dart';
import 'item_card.dart';
import 'near_me_deals.dart';
import 'popular_category.dart';
import 'search_box.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  @override
  Widget build(BuildContext context) {
    Future<FlashMarketModel> getHomeScreenData =
    Provider.of<Auth>(context, listen: false).fetchDataFromServer();
    // print(getHomeScreenData{'result'})
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: FutureBuilder<FlashMarketModel>(
        future: getHomeScreenData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (snapshot.hasError) {
              return Center(
                child: Text('Error : ${snapshot.error}'),
              );
            } else {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //SearchBox
                    searchBox(),
                    SizedBox(
                      height: getProportionateScreenHeight(24),
                    ),

                    //Popular Categories
                    popularCategory(snapshot.data?.result?.popularCategories
                    as List<PopularCategories>),
                    SizedBox(
                      height: getProportionateScreenHeight(20),
                    ),

                    //horizontal banner
                    bannerBox(context,
                        snapshot.data?.result?.topBanners as List<TopBanners>),

                    //Featured Deals
                    CustomItemContainerHomeScreen(
                      containerTitle: "Featured Deals",
                      containerTitleColor: Colors.white,
                      containerBgColor: kPrimaryColor,
                      buttonColor: Colors.white,
                      buttonTextColor: kPrimaryColor,
                      containerHeight: getProportionateScreenHeight(480),
                      childWidget: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data!.result?.featuredDeals?.length,
                        itemBuilder: (context, index) =>
                            ItemCard(
                              showFlashHours: true,
                              saleImage: snapshot.data!.result
                                  ?.featuredDeals?[index].saleImage as String,
                              saleTitle: snapshot.data!.result
                                  ?.featuredDeals?[index].saleTitle as String,
                              price: snapshot.data!.result
                                  ?.featuredDeals?[index]
                                  .price as String,
                              oldPrice: snapshot.data!.result
                                  ?.featuredDeals?[index]
                                  .oldPrice as String,
                              pricePercentage: snapshot.data!.result
                                  ?.featuredDeals?[index]
                                  .pricePercent as String,
                              timeRemaining: snapshot.data!.result
                                  ?.featuredDeals?[index]
                                  .timeRemaining as String,
                              merchantName: snapshot.data!.result
                                  ?.featuredDeals?[index]
                                  .merchantName as String,
                              merchantLogo: snapshot.data!.result
                                  ?.featuredDeals?[index]
                                  .merchantLogo as String,
                              distance: snapshot.data!.result
                                  ?.featuredDeals?[index]
                                  .distance as String,
                            ),
                      ),
                    ),

                    //Latest Deals
                    CustomItemContainerHomeScreen(
                      containerTitle: "Latest Deals",
                      containerTitleColor: Colors.black,
                      containerBgColor: kGrayColor,
                      buttonColor: kPrimaryColor,
                      buttonTextColor: Colors.white,
                      containerHeight: getProportionateScreenHeight(480),
                      childWidget: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data!.result?.latestDeal?.length,
                        itemBuilder: (context, index) =>
                            ItemCard(
                              showFlashHours: false,
                              saleImage: snapshot.data!.result
                                  ?.latestDeal?[index]
                                  .saleImage as String,
                              saleTitle: snapshot.data!.result
                                  ?.latestDeal?[index]
                                  .saleTitle as String,
                              price: snapshot.data!.result?.latestDeal?[index]
                                  .price
                              as String,
                              oldPrice: snapshot.data!.result
                                  ?.latestDeal?[index]
                                  .oldPrice as String,
                              pricePercentage: snapshot.data!.result
                                  ?.latestDeal?[index].pricePercent as String,
                              timeRemaining: snapshot.data!.result
                                  ?.latestDeal?[index].timeRemaining as String,
                              merchantName: snapshot.data!.result
                                  ?.latestDeal?[index].merchantName as String,
                              merchantLogo: snapshot.data!.result
                                  ?.latestDeal?[index].merchantLogo as String,
                              distance: snapshot.data!.result
                                  ?.latestDeal?[index]
                                  .distance as String,
                            ),
                      ),
                    ),

                    //Recommended For You
                    //RecentViewed Products
                    CustomItemContainerHomeScreen(
                      containerTitle: "Recommended for you",
                      containerTitleColor: Colors.black,
                      containerBgColor: kGrayColor,
                      buttonColor: kPrimaryColor,
                      buttonTextColor: Colors.white,
                      containerHeight: getProportionateScreenHeight(450),
                      childWidget: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount:
                            snapshot.data!.result?.recentVisitedDeals?.length,
                        itemBuilder: (context, index) => ItemCard(
                          showFlashHours: false,
                          saleImage: snapshot.data?.result?.recentVisitedDeals?[index].saleImage as String,
                          saleTitle: snapshot.data?.result?.recentVisitedDeals?[index].saleTitle as String,
                          price: snapshot.data?.result?.recentVisitedDeals?[index].price as String,
                          oldPrice: snapshot.data?.result?.recentVisitedDeals?[index].oldPrice as String,
                          pricePercentage: snapshot.data?.result?.recentVisitedDeals?[index].pricePercent as String,
                          timeRemaining: snapshot.data?.result?.recentVisitedDeals?[index].timeRemaining as String,
                          merchantName: snapshot.data?.result?.recentVisitedDeals?[index].merchantName as String,
                          merchantLogo: snapshot.data?.result?.recentVisitedDeals?[index].merchantLogo as String,
                          distance: snapshot.data?.result?.recentVisitedDeals?[index].distance as String,
                        ),
                      ),
                    ),

                    //Featured Business
                    CustomItemContainerHomeScreen(
                      containerTitle: "Featured Business",
                      containerTitleColor: Colors.white,
                      containerBgColor: kPrimaryColor,
                      buttonColor: Colors.white,
                      buttonTextColor: kPrimaryColor,
                      containerHeight: getProportionateScreenHeight(390),
                      childWidget: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data!.result?.localBusiness?.length,
                        itemBuilder: (context, index) =>
                            FeaturedBusinessItemCard(
                              merchantBannerImage: snapshot
                                  .data!
                                  .result
                                  ?.localBusiness?[index]
                                  .merchantBannerImage as String,
                              merchantLogo: snapshot.data!.result
                                  ?.localBusiness?[index]
                                  .merchantLogo as String,
                              companyName: snapshot.data!.result
                                  ?.localBusiness?[index].companyName as String,
                              aboutMerchant: snapshot.data!.result
                                  ?.localBusiness?[index]
                                  .aboutMerchant as String,
                              distance: snapshot.data!.result
                                  ?.localBusiness?[index]
                                  .distance as String,
                              suburb: snapshot.data!.result
                                  ?.localBusiness?[index]
                                  .suburb as String,
                            ),
                      ),
                    ),

                    NearMeDeals(
                        nearMeDeals: snapshot.data?.result?.nearmeDeal
                        as List<NearmeDeal>),
                  ],
                ),
              );
            }
          }
        },
      ),
    );
  }
}
