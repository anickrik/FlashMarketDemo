import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constrains/constants.dart';
import '../../../size_config.dart';

class NearMeItemCard extends StatelessWidget {

  final String saleImage;
  final String saleTitle;
  final String oldPrice;
  final String price;
  final String pricePercent;
  final String merchantLogo;
  final String merchantName;
  final String distance;

  const NearMeItemCard({Key? key, required this.saleImage, required this.saleTitle, required this.oldPrice, required this.price, required this.pricePercent, required this.merchantLogo, required this.merchantName, required this.distance}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String flashDel = "assets/icons/flash_del.svg";
    return Container(
      height: getProportionateScreenHeight(235),
      width: SizeConfig.screenWidth,
      margin: const EdgeInsets.only(top: 5, left: 5, right: 5),
      child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Spacer(),
                    pricePercent.isNotEmpty ?
                    Container(
                      margin:
                      const EdgeInsets.symmetric(vertical: 20),
                      height: getProportionateScreenHeight(22),
                      width: getProportionateScreenWidth(60),
                      decoration: BoxDecoration(
                          color: kPrimaryColor,
                          borderRadius: BorderRadius.circular(30)),
                      child: Center(
                        child: Text(
                          pricePercent,
                          style: TextStyle(
                              fontSize: 10,
                              color: kSecondaryColor,
                              fontStyle: FontStyle.italic),
                        ),
                      ),
                    ) : const SizedBox(),
                    const SizedBox(width: 6,),
                    SizedBox(height:getProportionateScreenHeight(22),
                    child: SvgPicture.asset(flashDel)),
                    const SizedBox(
                      width: 20,
                    ),
                    IconButton(onPressed: (){}, icon: const Icon(Icons.favorite_border, size: 32,))
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      // height: getProportionateScreenHeight(120),
                      width: getProportionateScreenWidth(120),
                      child: Image.network(saleImage, fit: BoxFit.cover,),
                      // FadeInImage.assetNetwork(placeholder: 'assets/images/loading_gif.gif', image: saleImage, fit: BoxFit.cover,)

                    ),
                    const VerticalDivider(
                      thickness: 1,
                      color: Colors.grey,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 150,
                                child: Text(saleTitle, maxLines: 1, style: const TextStyle(
                                      fontSize: 16,fontWeight: FontWeight.bold
                                  ),),
                              ),
                              const SizedBox(height: 5,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(price),
                                  const SizedBox(width: 5,),
                                  Text(oldPrice.toString(), style: const TextStyle(color: Colors.grey, decoration: TextDecoration.lineThrough),),
                                ],
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 12),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 20,
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(30),
                                      child: Image.network(merchantLogo, fit: BoxFit.cover,)),
                                ),
                                const SizedBox (width: 12,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                        width: 100,
                                        child: Text(merchantName, maxLines: 1,)),
                                    const SizedBox(height: 4,),
                                    Row(
                                      children: [
                                        Icon(Icons.pin_drop_rounded, color: kPrimaryColor, size: 12,),
                                        const SizedBox(width: 4,),
                                        Text(distance.toString(),style: const TextStyle(color: Colors.grey),),
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          )
      ),
    );
  }
}
