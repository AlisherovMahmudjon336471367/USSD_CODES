import '../../../../utils/tools/file_importers.dart';

// ignore: must_be_immutable
class CompanyBox extends StatelessWidget {
  CompanyModel company;
  CompanyBox({required this.company, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height(context) * 0.9,
      child: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  CaruselWidget(images: company.images),
                  const SizedBox(height: 10),
                  ...List.generate(
                      menus.length,
                      (index) => MenuWidget(
                            ontap: () async {
                              if (index < 2) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => CollectionPage(
                                          isTarif: index == 0,
                                          company: company),
                                    ));
                              } else {
                                String ussd = '';
                                switch (index) {
                                  case 2:
                                    ussd = company.tarifDedectorCode;
                                    break;
                                  case 3:
                                    ussd = company.minuteBalance;
                                    break;
                                  case 4:
                                    ussd = company.internetBalance;
                                    break;
                                  case 5:
                                    ussd = company.smsBalance;
                                    break;
                                }
                                await FlutterPhoneDirectCaller.callNumber(ussd);
                                // ignore: use_build_context_synchronously
                                AnimatedSnackBar(
                                  snackBarStrategy: RemoveSnackBarStrategy(),
                                  duration: const Duration(seconds: 4),
                                  builder: (context) => AppSnackBar(
                                      text: "So'rovingiz yuborildi",
                                      icon: company.companyLogo,
                                      color: company.color),
                                ).show(context);
                              }
                            },
                            menus: menus[index],
                            color: company.color,
                          )),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
