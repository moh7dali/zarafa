import 'dart:core';

import 'package:equatable/equatable.dart';
import 'package:zarafa/features/main/domain/entities/offer.dart';

class Merchant extends Equatable {
  String? merchantTitle;
  String? merchantBrandImage;
  String? phoneNumber;
  String? emailAddress;
  double? locationLat;
  double? locationLong;
  String? merchantLogo;
  List? tags;
  List<Offer>? offers;
  double? rating;

  Merchant(
      {this.merchantTitle,
      this.merchantBrandImage,
      this.phoneNumber,
      this.emailAddress,
      this.locationLat,
      this.locationLong,
      this.merchantLogo,
      this.offers,
      this.rating,
      this.tags});

  @override
  List<Object?> get props => [
        merchantTitle,
        merchantBrandImage,
        phoneNumber,
        emailAddress,
        locationLat,
        locationLong,
        merchantLogo,
        tags,
        offers,
        rating,
      ];
}
