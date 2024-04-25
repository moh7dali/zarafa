import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:zarafa/core/constants/app_constants.dart';
import 'package:zarafa/core/theme/app_theme.dart';

import '../../domain/entities/merchant.dart';
import '../screens/merchant_page.dart';

class MerchantsWidget extends StatelessWidget {
  const MerchantsWidget({super.key, this.merchant});

  final Merchant? merchant;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => MerchantPage(
                    merchant: merchant,
                  )),
        );
      },
      child: Card(
        surfaceTintColor: AppTheme.whiteColor,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start, // Center contents
            children: [
              CachedNetworkImage(
                width: MediaQuery.of(context).size.width * .25,
                fit: BoxFit.cover,
                imageUrl: merchant?.merchantLogo ?? "",
                errorWidget: (context, url, error) => Image.asset(AppConstants.placeHolderImage),
                placeholder: (context, url) => Image.asset(AppConstants.placeHolderImage),
              ), // Adjust icon size as needed
              SizedBox(width: 16.0), // Spacing between icon and title
              Text(
                merchant?.merchantTitle ?? "",
                style: AppTheme.textStyle(color: AppTheme.primaryColor, size: AppTheme.size16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
