// ignore_for_file: public_member_api_docs, sort_constructors_first
class TarifModel {
  final String name;
  final String price;
  final String MB;
  final String minute;
  final String SMS;
  final String ussd;

  TarifModel(
    this.name, {
    required this.price,
    required this.MB,
    required this.minute,
    required this.SMS,
    required this.ussd,
  });
}
