import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zarafa/core/theme/app_theme.dart';
import 'package:zarafa/features/main/domain/entities/offer.dart';

import 'dashed_line.dart';

class OfferWidget extends StatelessWidget {
  const OfferWidget({super.key, this.offer});

  final Offer? offer;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          height: MediaQuery.of(context).size.height * .15.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: AppTheme.primaryGradient,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Icon(
                  Icons.local_offer_outlined,
                  size: MediaQuery.of(context).size.height * .05.h,
                  color: AppTheme.whiteColor,
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(
                  8.0,
                ),
                child: CustomPaint(
                  size: Size(4.0, double.infinity),
                  painter: DashedLineVerticalPainter(
                    color: Colors.white,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    SizedBox(
                      width: MediaQuery.of(context).size.width * .65,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "${offer?.offerTitle ?? ""}",
                            style: AppTheme.textStyle(color: AppTheme.whiteColor, size: AppTheme.size18),
                          ),
                          Container(
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.grey),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8),
                              child: Text(
                                "${offer?.flashIndicator ?? ""}",
                                style: AppTheme.textStyle(color: AppTheme.whiteColor, size: AppTheme.size14),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      "Available from ${offer?.availableDateTime ?? ""}",
                      style: AppTheme.textStyle(color: AppTheme.whiteColor, size: AppTheme.size12),
                    ),
                    Container(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          buildDayText('S'),
                          buildDayText('M'),
                          buildDayText('T'),
                          buildDayText('W'),
                          buildDayText('T'),
                          buildDayText('F'),
                          buildDayText('S'),
                        ],
                      ),
                    ),
                    Text(
                      "View Offer",
                      style: AppTheme.textStyle(color: AppTheme.whiteColor, size: AppTheme.size12).copyWith(decoration: TextDecoration.underline),
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}

Widget buildDayText(String day) {
  return Padding(
    padding: const EdgeInsets.all(2),
    child: Container(
      width: 25,
      height: 25,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
      ),
      child: Center(
        child: Text(
          day,
          style: AppTheme.textStyle(
            size: AppTheme.size14,
            color: AppTheme.primaryColor,
          ),
        ),
      ),
    ),
  );
}
