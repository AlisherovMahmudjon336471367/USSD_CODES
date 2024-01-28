import 'package:rexar_shop/ui/collection/data/models/tarif_model.dart';
import 'package:rexar_shop/ui/collection/ui/widgets/tarif_info_sheet.dart';

import '../../../../utils/tools/file_importers.dart';

// ignore: must_be_immutable
class TarifWidget extends StatelessWidget {
  CompanyModel company;
  int index;
  TarifWidget({required this.index, required this.company, super.key});

  @override
  Widget build(BuildContext context) {
    TarifModel tarif = company.tarifs[index];
    return ZoomTapAnimation(
      onTap: () {
        showTarifInfo(context, company, index);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
        height: height(context) * 0.13,
        width: width(context),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: company.color,
              offset: const Offset(
                0.2,
                0.2,
              ),
              blurRadius: 5.0,
              spreadRadius: 1.0,
            ),
            const BoxShadow(
              color: Colors.white,
              offset: Offset(
                0.0,
                0.0,
              ),
              blurRadius: 0.0,
              spreadRadius: 0.0,
            ),
          ],
        ),
        child: Row(
          children: [
            SizedBox(
              width: width(context) * 0.43,
              child: Center(
                child: Text(
                  tarif.name,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 22,
                    color: company.color,
                  ),
                ),
              ),
            ),
            Container(
              height: height(context) * 0.13,
              width: 0.5,
              color: Colors.grey,
            ),
            SizedBox(
              width: width(context) * 0.45,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      tarif.price,
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: company.color,
                        ),
                        child: SizedBox(
                          height: height(context) * 0.04,
                          child: const Center(
                            child: Text(
                              "Ulanish",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
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
