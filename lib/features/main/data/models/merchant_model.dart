import 'package:zarafa/features/main/data/models/offer_model.dart';
import 'package:zarafa/features/main/domain/entities/merchant.dart';

import '../../domain/entities/offer.dart';

class MerchantModel extends Merchant {
  MerchantModel({
    required super.merchantTitle,
    required super.merchantBrandImage,
    required super.phoneNumber,
    required super.emailAddress,
    required super.locationLat,
    required super.locationLong,
    required super.merchantLogo,
    required super.tags,
    required super.offers,
    required super.rating,
  });

  factory MerchantModel.fromJson(Map<String, dynamic> json) => MerchantModel(
        merchantTitle: json["MerchantTitle"],
        merchantBrandImage: json["MerchantBrandImage"],
        phoneNumber: json["PhoneNumber"],
        emailAddress: json["EmailAddress"],
        locationLat: json["LocationLat"],
        locationLong: json["LocationLong"],
        merchantLogo: json["MerchantLogo"],
        tags: json["Tags"] ?? [],
        offers: json["Offers"] == null ? [] : List<Offer>.from(json["Offers"]!.map((x) => OfferModel.fromJson(x))),
        rating: json["Rating"],
      );
}
