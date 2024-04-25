import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zarafa/features/main/presentation/provider/merchant_provider.dart';
import 'package:zarafa/features/main/presentation/widgets/offer_widget.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/theme/app_theme.dart';
import '../../domain/entities/merchant.dart';

class MerchantPage extends StatelessWidget {
  const MerchantPage({super.key, this.merchant});

  final Merchant? merchant;

  @override
  Widget build(BuildContext context) {
    return Consumer<MerchantProvider>(
      builder: (context, controller, child) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.35,
                  child: Stack(
                    children: [
                      Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        height: MediaQuery.of(context).size.height * 0.3,
                        child: Container(
                            child: CachedNetworkImage(
                          fit: BoxFit.cover,
                          imageUrl: merchant?.merchantBrandImage ?? "",
                          errorWidget: (context, url, error) => Image.asset(AppConstants.placeHolderImage),
                          placeholder: (context, url) => Image.asset(AppConstants.placeHolderImage),
                        )),
                      ),
                      Positioned(
                          top: MediaQuery.of(context).size.height * 0.25,
                          left: 10,
                          width: MediaQuery.of(context).size.width * 0.35,
                          bottom: 0,
                          child: Container(
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                            child: CachedNetworkImage(
                              fit: BoxFit.fitHeight,
                              imageUrl: merchant?.merchantLogo ?? "",
                              errorWidget: (context, url, error) => Image.asset(AppConstants.placeHolderImage),
                              placeholder: (context, url) => Image.asset(AppConstants.placeHolderImage),
                            ),
                          )),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Container(
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), border: Border.all(color: AppTheme.primaryColor)),
                        width: MediaQuery.of(context).size.width * .15,
                        child: Row(children: [
                          const Icon(
                            Icons.star_outline_sharp,
                            color: AppTheme.primaryColor,
                          ),
                          Text(
                            "${merchant?.rating ?? 0}",
                            style: AppTheme.textStyle(color: AppTheme.primaryColor, size: AppTheme.size12),
                          )
                        ]),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Text(
                        "${merchant?.merchantTitle}",
                        style: AppTheme.textStyle(color: AppTheme.blackColor, size: AppTheme.size18, isBold: true),
                      ),
                    )
                  ],
                ),
                if ((merchant?.tags ?? []).isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Row(
                      children: [
                        Wrap(
                            spacing: 5.0,
                            children: controller.showMore
                                ? (merchant?.tags ?? [])
                                    .map(
                                      (tag) => Text(tag, style: AppTheme.textStyle(color: Colors.grey, size: AppTheme.size12)),
                                    )
                                    .toList()
                                : (merchant?.tags ?? [])
                                    .sublist(0, 4)
                                    .map((tag) => Text(
                                          tag,
                                          style: AppTheme.textStyle(color: Colors.grey, size: AppTheme.size12),
                                        ))
                                    .toList()),
                        Visibility(
                          visible: (merchant?.tags?.length ?? 0) > 3,
                          child: TextButton(
                            onPressed: () {
                              controller.showMore = !controller.showMore;
                              controller.notifyListeners();
                            },
                            child: Text(
                              controller.showMore ? '.Show Less' : '.All Tags',
                              style: AppTheme.textStyle(color: AppTheme.primaryColor, size: AppTheme.size12),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Icon(Icons.follow_the_signs_outlined),
                        SizedBox(height: 10),
                        Text(
                          "Follow",
                          style: AppTheme.textStyle(color: AppTheme.blackColor, size: 12),
                        )
                      ],
                    ),
                    GestureDetector(
                      onTap: () async {
                        String url = "tel://${merchant?.phoneNumber ?? ""}";
                        if (await canLaunchUrl(Uri.parse(url))) {
                          await launchUrl(Uri.parse(url));
                        } else {
                          throw 'Could not launch $url';
                        }
                      },
                      child: Column(
                        children: [
                          Icon(Icons.call),
                          SizedBox(height: 10),
                          Text(
                            "Call",
                            style: AppTheme.textStyle(color: AppTheme.blackColor, size: 12),
                          )
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Icon(Icons.email),
                        SizedBox(height: 10),
                        Text(
                          "Email",
                          style: AppTheme.textStyle(color: AppTheme.blackColor, size: 12),
                        )
                      ],
                    ),
                    GestureDetector(
                      onTap: () async {
                        String destination = "${merchant?.locationLat ?? 0.0},${merchant?.locationLong ?? 0.0}";
                        String url = "http://www.google.com/maps/place/$destination";
                        if (await canLaunchUrl(Uri.parse(url))) {
                          await launchUrl(Uri.parse(url));
                        } else {
                          throw 'Could not launch $url';
                        }
                      },
                      child: Column(
                        children: [
                          Icon(Icons.location_on_outlined),
                          SizedBox(height: 10),
                          Text(
                            "Location",
                            style: AppTheme.textStyle(color: AppTheme.blackColor, size: 12),
                          )
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Icon(Icons.flag_outlined),
                        SizedBox(height: 10),
                        Text(
                          "Report",
                          style: AppTheme.textStyle(color: AppTheme.blackColor, size: 12),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Icon(Icons.share),
                        SizedBox(height: 10),
                        Text(
                          "share",
                          style: AppTheme.textStyle(color: AppTheme.blackColor, size: 12),
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      child: Text(
                        "Available Offers",
                        style: AppTheme.textStyle(color: AppTheme.blackColor, size: AppTheme.size18),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "Amman",
                      style: AppTheme.textStyle(color: AppTheme.blackColor, size: AppTheme.size12),
                    ),
                  ],
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: merchant?.offers?.length ?? 0,
                  itemBuilder: (context, index) {
                    return OfferWidget(offer: merchant?.offers?[index]);
                  },
                ),
                SizedBox(height: 20)
              ],
            ),
          ),
        );
      },
    );
  }
}
