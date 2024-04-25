import '../../domain/entities/offer.dart';

class OfferModel extends Offer {
  OfferModel({
    required super.offerTitle,
    required super.description,
    required super.availableDateTime,
    required super.flashIndicator,
  });

  factory OfferModel.fromJson(Map<String, dynamic> json) => OfferModel(
        offerTitle: json["OfferTitle"],
        description: json["Description"],
        availableDateTime: json["AvailableDateTime"],
        flashIndicator: json["FlashIndicator"],
      );
}
