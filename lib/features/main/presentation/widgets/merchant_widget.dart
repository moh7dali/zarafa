import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start, // Center contents
            children: [
              CachedNetworkImage(
                imageUrl: merchant?.merchantLogo ?? "",
                errorWidget: (context, url, error) => Container(
                  width: 100,
                  height: 100,
                  color: AppTheme.primaryColor,
                ),
                placeholder: (context, url) => Container(
                  width: 100,
                  height: 100,
                  color: AppTheme.primaryColor,
                ),
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
