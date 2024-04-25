import 'package:equatable/equatable.dart';

import 'merchant.dart';

class Subcategory extends Equatable {
  String? title;
  String? iconPath;
  List<Merchant>? merchants;

  Subcategory({this.title, this.iconPath, this.merchants});

  @override
  List<Object?> get props => [title, iconPath, merchants];
}
