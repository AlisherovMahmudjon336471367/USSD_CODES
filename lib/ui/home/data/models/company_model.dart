import 'package:rexar_shop/ui/collection/data/models/collection_model.dart';
import 'package:rexar_shop/ui/collection/data/models/tarif_model.dart';

import '../../../../utils/tools/file_importers.dart';

class CompanyModel {
  final List images;
  final String companyLogo;
  final Color color;
  final List<TarifModel> tarifs;
  final List<List<CollectionModel>> allInternetPakets;
  final String tarifDedectorCode;
  final String internetBalance;
  final String smsBalance;
  final String minuteBalance;

  CompanyModel({
    required this.images,
    required this.companyLogo,
    required this.allInternetPakets,
    required this.tarifDedectorCode,
    required this.internetBalance,
    required this.smsBalance,
    required this.minuteBalance,
    required this.color,
    required this.tarifs,
  });
}
