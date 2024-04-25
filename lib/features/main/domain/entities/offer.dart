import 'package:equatable/equatable.dart';

class Offer extends Equatable {
  String? offerTitle;
  String? description;
  String? availableDateTime;
  String? flashIndicator;

  Offer({this.offerTitle, this.availableDateTime, this.description, this.flashIndicator});

  @override
  List<Object?> get props => [offerTitle, description, availableDateTime, flashIndicator];
}
