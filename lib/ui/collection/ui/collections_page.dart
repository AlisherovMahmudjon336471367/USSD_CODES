import 'package:rexar_shop/ui/collection/ui/widgets/collection_widget.dart';

import '../../../utils/tools/file_importers.dart';

// ignore: must_be_immutable
class CollectionPage extends StatelessWidget {
  CompanyModel company;
  bool isTarif;
  CollectionPage({required this.isTarif, required this.company, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          company.companyLogo,
          width: width(context) * 0.3,
        ),
      ),
      body: SizedBox(
        height: height(context),
        width: width(context),
        child: ListView(
          shrinkWrap: true,
          children: [
            if (isTarif)
              ...List.generate(
                  company.tarifs.length,
                  (index) => TarifWidget(
                        company: company,
                        index: index,
                      )),
            if (!isTarif)
              DefaultTabController(
                length: company.allInternetPakets.length,
                child: Column(
                  children: [
                    TabBar(indicatorColor: company.color, tabs: [
                      ...List.generate(
                        company.allInternetPakets.length,
                        (index) => Tab(
                          text: company.allInternetPakets[index][0].expiryDay,
                        ),
                      ),
                    ]),
                    SizedBox(
                      height: height(context) * 0.9,
                      child: TabBarView(
                        children: [
                          ...List.generate(
                              company.allInternetPakets.length,
                              (paketIndex) => ListView(
                                    children: [
                                      ...List.generate(
                                          company.allInternetPakets[paketIndex]
                                              .length,
                                          (index) => CollectionWidget(
                                              collection:
                                                  company.allInternetPakets[
                                                      paketIndex][index],
                                              company: company)),
                                    ],
                                  )),
                        ],
                      ),
                    ),
                  ],
                ),
              )
          ],
        ),
      ),
    );
  }
}
