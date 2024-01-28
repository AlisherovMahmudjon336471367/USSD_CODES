import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:rexar_shop/ui/collection/data/models/tarif_model.dart';
import 'package:rexar_shop/ui/collection/ui/widgets/tarif_info_widget.dart';

import '../../../../utils/constants/app_snackbar.dart';
import '../../../../utils/tools/file_importers.dart';

void showTarifInfo(context, CompanyModel company, index) {
  TarifModel tarif = company.tarifs[index];
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
        height: height(context) * 0.36,
        width: width(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Image.asset(
                  company.companyLogo,
                  width: width(context) * 0.25,
                ),
                SizedBox(height: height(context) * 0.02),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: height(context) * 0.035),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Ta'rif nomi:",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                              )),
                          Text(
                            tarif.name,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                              color: company.color,
                            ),
                          ),
                        ],
                      ),
                      TarifInfoWidget(
                          title: "Daqiqa", subtitle: "${tarif.minute} daq"),
                      TarifInfoWidget(title: "Internet", subtitle: tarif.MB),
                      TarifInfoWidget(title: "SMS", subtitle: "${tarif.SMS}"),
                    ],
                  ),
                ),
              ],
            ),
            ZoomTapAnimation(
              onTap: () async {
                await FlutterPhoneDirectCaller.callNumber(tarif.ussd);
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
                padding: const EdgeInsets.all(7),
                height: height(context) * 0.042,
                width: width(context),
                decoration: BoxDecoration(
                  color: company.color,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  "Ulanish - ${tarif.minute}",
                  style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                      color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}
