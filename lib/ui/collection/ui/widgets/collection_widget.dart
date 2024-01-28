import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:rexar_shop/ui/collection/data/models/collection_model.dart';
import 'package:rexar_shop/ui/collection/ui/widgets/tarif_info_widget.dart';

import '../../../../utils/constants/app_snackbar.dart';
import '../../../../utils/tools/file_importers.dart';

// ignore: must_be_immutable
class CollectionWidget extends StatelessWidget {
  CompanyModel company;
  CollectionModel collection;

  CollectionWidget(
      {required this.collection, required this.company, super.key});

  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      onTap: () {
        showModalBottomSheet(
          context: context,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(25.0),
            ),
          ),
          builder: (context) {
            return Container(
              padding: const EdgeInsets.all(12),
              height: height(context) * 0.3,
              width: width(context),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Image.asset(
                        company.companyLogo,
                        width: width(context) * 0.14,
                      ),
                      SizedBox(height: height(context) * 0.02),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: height(context) * 0.035),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text("To'plam nomi:",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20,
                                    )),
                                Text(
                                  collection.amount,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20,
                                    color: company.color,
                                  ),
                                ),
                              ],
                            ),
                            TarifInfoWidget(
                                title: "Miqdor", subtitle: collection.amount),
                            TarifInfoWidget(
                                title: "Muddati",
                                subtitle: collection.expiryDay),
                          ],
                        ),
                      ),
                    ],
                  ),
                  ZoomTapAnimation(
                    onTap: () async {
                      await FlutterPhoneDirectCaller.callNumber(
                          collection.ussd);
                      // ignore: use_build_context_synchronously
                      Navigator.of(context);
                      // ignore: use_build_context_synchronously
                      AnimatedSnackBar(
                        duration: const Duration(seconds: 4),
                        builder: (context) => AppSnackBar(
                            text: "So'rovingiz yuborildi",
                            icon: company.companyLogo,
                            color: company.color),
                      ).show(context);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      height: height(context) * 0.06,
                      width: width(context),
                      decoration: BoxDecoration(
                        color: company.color,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        "Ulanish - ${collection.price}",
                        style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
        width: width(context),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: company.color),
        ),
        child: Row(
          children: [
            SizedBox(
              width: width(context) * 0.28,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    collection.amount,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 22,
                      color: company.color,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: height(context) * 0.13,
              width: 0.5,
              color: Colors.grey,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TarifInfoWidget(
                      title: "Narxi:",
                      subtitle: "${collection.price}",
                      isTarif: false,
                    ),
                    TarifInfoWidget(
                      title: "Muddati:",
                      subtitle: collection.expiryDay.length > 12
                          ? collection.expiryDay.substring(0, 11)
                          : collection.expiryDay,
                      isTarif: false,
                    ),
                    const Divider(),
                    Text(
                      collection.ussd,
                      style: const TextStyle(
                          fontWeight: FontWeight.w700, fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
