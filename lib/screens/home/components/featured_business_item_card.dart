import 'package:flutter/material.dart';

import '../../../size_config.dart';

class FeaturedBusinessItemCard extends StatelessWidget {

  final String merchantBannerImage;
  final String merchantLogo;
  final String companyName ;
  final String aboutMerchant;
  final String distance;
  final String suburb;

  const FeaturedBusinessItemCard({Key? key, required this.merchantBannerImage, required this.merchantLogo, required this.companyName, required this.aboutMerchant, required this.distance, required this.suburb}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        // height: getProportionateScreenHeight(200),
        width: getProportionateScreenWidth(300),
        margin: const EdgeInsets.only(top: 15, left: 8, bottom: 20),
        child: Card(
            elevation: 4,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.topRight,
                    children: [
                      SizedBox(
                        height: getProportionateScreenHeight(120),
                        width: double.infinity,
                        child: Image.network(
                          merchantBannerImage,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: CircleAvatar(
                          radius: 23,
                          backgroundColor: const Color.fromRGBO(255, 245, 255, 90),
                          child: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.share,
                                size: 30,
                                color: Colors.black,
                              )),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        CircleAvatar(
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: Image.network(merchantLogo, fit: BoxFit.cover,)),
                        ),
                        const SizedBox (width: 12,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 140,
                              child: Text(companyName,
                                maxLines: 1,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                              ),),
                            ),
                            const SizedBox(height: 4,),
                            Row(
                              children: [
                                Text(distance,style: const TextStyle(color: Colors.black45),),
                                const SizedBox(width: 4,),
                                Text(suburb,style: const TextStyle(color: Colors.black45),),
                              ],
                            ),
                          ],
                        ),
                        const Spacer(),
                        IconButton(onPressed: (){}, icon: const Icon(Icons.favorite_border, size: 32,))
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10, bottom: 15),
                    child: Text(aboutMerchant,
                      maxLines: 2,
                      textAlign: TextAlign.start,
                      style: const TextStyle(color: Colors.black45, fontSize: 12),
                    ),
                  ),
                ],
              ),
            )
        ),
      ),
    );
  }
}