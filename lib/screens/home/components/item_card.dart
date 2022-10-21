import 'package:flash_market/constrains/constants.dart';
import 'package:flash_market/size_config.dart';
import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
      final bool showFlashHours;
      final String saleImage;
      final String saleTitle;
      final String price;
      final String oldPrice;
      final String pricePercentage;
      final String timeRemaining;
      final String merchantName;
      final String merchantLogo;
      final String distance;
  const ItemCard({Key? key, required this.showFlashHours, required this.saleImage, required this.saleTitle, required this.price, required this.oldPrice, required this.pricePercentage, required this.timeRemaining, required this.merchantName, required this.merchantLogo, required this.distance}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15, left: 10, bottom: 20),
      // height: getProportionateScreenHeight(345),
      width: getProportionateScreenWidth(197),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    height: getProportionateScreenHeight(186),
                    width: getProportionateScreenWidth(195),
                    child: saleImage.isNotEmpty ? Image.network(
                      saleImage,
                      fit: BoxFit.cover,
                    ) : Image.asset("assets/images/noimage.png", fit: BoxFit.cover,),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        pricePercentage.isNotEmpty ?
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
                              pricePercentage,
                              style: TextStyle(
                                  fontSize: 10,
                                  color: kSecondaryColor,
                                  fontStyle: FontStyle.italic),
                            ),
                          ),
                        ) : const SizedBox(),
                        const Spacer(),
                        CircleAvatar(
                          backgroundColor: const Color.fromRGBO(255, 245, 255, 90),
                           child: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.favorite_border_outlined,
                                  size: 26,
                                  color: Colors.black,
                                )),
                          ),
                      ],
                    ),
                  ),
                  showFlashHours ? Padding(
                    padding: const EdgeInsets.only(left: 11.0, top: 140, right: 11),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: getProportionateScreenHeight(22),
                          width: getProportionateScreenWidth(70),
                          decoration: BoxDecoration(
                            color: kPrimaryColor.withOpacity(0.7),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(30),
                              bottomLeft: Radius.circular(30),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              "Flast Sale",
                              style: TextStyle(
                                  fontSize: 10,
                                  color: kSecondaryColor,
                                  fontStyle: FontStyle.italic),
                            ),
                          ),
                        ),
                        Container(
                          height: getProportionateScreenHeight(22),
                          width: getProportionateScreenWidth(70),
                          decoration: BoxDecoration(
                            color: kSecondaryColor.withOpacity(0.7),
                            borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(30),
                              bottomRight: Radius.circular(30),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              timeRemaining.toString(),
                              style: TextStyle(
                                  fontSize: 10,
                                  color: kPrimaryColor,
                                  fontStyle: FontStyle.italic),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ) :
                  const SizedBox(),
                ],
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6),
                child: Column(
                  children: [
                    Text(saleTitle, maxLines: 2,style: const TextStyle(
                        fontSize: 16,fontWeight: FontWeight.bold
                    ),),
                    const SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(price.toString()),
                        const SizedBox(width: 5,),
                        Text(oldPrice.toString(), style: const TextStyle(color: Colors.grey, decoration: TextDecoration.lineThrough),)
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(height: 8,),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(left : 10.0, right: 10.0, bottom: 20.0),
                child: FittedBox(
                  fit: BoxFit.contain,
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
                        children: [
                          SizedBox(width: 80,child: Text(merchantName, maxLines: 2,style: const TextStyle(fontSize: 12),)),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}


// Widget itemCard(
//     bool showFlashHours,
//     String saleImage,
//     String saleTitle,
//     String price,
//     String oldPrice,
//     String pricePercentage,
//     String timeRemaining,
//     String merchantName,
//     String merchantLogo,
//     String distance,
//     ) {
//   return Container(
//     margin: const EdgeInsets.only(top: 15, left: 10, bottom: 20),
//     height: getProportionateScreenHeight(345),
//     width: getProportionateScreenWidth(197),
//     child: Card(
//       elevation: 5,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(10),
//         child: Column(
//           children: [
//             Stack(
//               children: [
//                 SizedBox(
//                   height: getProportionateScreenHeight(186),
//                   width: getProportionateScreenWidth(195),
//                   child: Image.network(
//                     saleImage,
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 16),
//                   child: Row(
//                     children: [
//                       Container(
//                         margin:
//                         const EdgeInsets.symmetric(vertical: 20),
//                         height: getProportionateScreenHeight(22),
//                         width: getProportionateScreenWidth(60),
//                         decoration: BoxDecoration(
//                             color: kPrimaryColor,
//                             borderRadius: BorderRadius.circular(30)),
//                         child: Center(
//                           child: Text(
//                             pricePercentage,
//                             style: TextStyle(
//                                 fontSize: 10,
//                                 color: kSecondaryColor,
//                                 fontStyle: FontStyle.italic),
//                           ),
//                         ),
//                       ),
//                       const Spacer(),
//                       CircleAvatar(
//                         backgroundColor: const Color.fromRGBO(255, 245, 255, 90),
//                         child: IconButton(
//                             onPressed: () {},
//                             icon: const Icon(
//                               Icons.favorite_border_outlined,
//                               size: 30,
//                               color: Colors.black,
//                             )),
//                       ),
//                     ],
//                   ),
//                 ),
//                 showFlashHours ? Padding(
//                   padding: const EdgeInsets.only(left: 11.0, top: 130, right: 11),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Container(
//                         height: getProportionateScreenHeight(22),
//                         width: getProportionateScreenWidth(70),
//                         decoration: BoxDecoration(
//                           color: kPrimaryColor,
//                           borderRadius: const BorderRadius.only(
//                             topLeft: Radius.circular(30),
//                             bottomLeft: Radius.circular(30),
//                           ),
//                         ),
//                         child: Center(
//                           child: Text(
//                             "Flast Sale",
//                             style: TextStyle(
//                                 color: kSecondaryColor,
//                                 fontStyle: FontStyle.italic),
//                           ),
//                         ),
//                       ),
//                       Container(
//                         height: getProportionateScreenHeight(22),
//                         width: getProportionateScreenWidth(70),
//                         decoration: BoxDecoration(
//                           color: kSecondaryColor,
//                           borderRadius: const BorderRadius.only(
//                             topRight: Radius.circular(30),
//                             bottomRight: Radius.circular(30),
//                           ),
//                         ),
//                         child: Center(
//                           child: Text(
//                             timeRemaining.toString(),
//                             style: TextStyle(
//                                 color: kPrimaryColor,
//                                 fontStyle: FontStyle.italic),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ) :
//                 const SizedBox(),
//               ],
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 8.0),
//               child: Column(
//                 children: [
//                   Text(saleTitle, maxLines: 2,style: const TextStyle(
//                       fontSize: 16,fontWeight: FontWeight.bold
//                   ),),
//                   const SizedBox(height: 5,),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text(price.toString()),
//                       const SizedBox(width: 5,),
//                       Text(oldPrice.toString(), style: const TextStyle(color: Colors.grey, decoration: TextDecoration.lineThrough),)
//                     ],
//                   )
//                 ],
//               ),
//             ),
//             const Spacer(),
//             Padding(
//               padding: const EdgeInsets.all(14.0),
//               child: FittedBox(
//                 fit: BoxFit.contain,
//                 child: Row(
//                   children: [
//                     CircleAvatar(
//                       radius: 20,
//                       child: ClipRRect(
//                           borderRadius: BorderRadius.circular(30),
//                           child: Image.network(merchantLogo, fit: BoxFit.cover,)),
//                     ),
//                     const SizedBox (width: 12,),
//                     Column(
//                       children: [
//                         SizedBox(width: 80,child: Text(merchantName, maxLines: 2,style: TextStyle(fontSize: 12),)),
//                         const SizedBox(height: 4,),
//                         Row(
//                           children: [
//                             const Icon(Icons.pin_drop_rounded, size: 12,),
//                             const SizedBox(width: 4,),
//                             Text(distance.toString(),style: const TextStyle(color: Colors.grey),),
//                           ],
//                         ),
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     ),
//   );
// }
