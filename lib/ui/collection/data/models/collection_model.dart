// ignore_for_file: public_member_api_docs, sort_constructors_first
class CollectionModel {
  final String amount;
  final String price;
  final String expiryDay;
  final String ussd;
  CollectionModel(
    this.amount, {
    required this.price,
    required this.expiryDay,
    required this.ussd,
  });
}
