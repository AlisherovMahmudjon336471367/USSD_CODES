import 'package:rexar_shop/ui/home/ui/widgets/company_box.dart';
import 'package:rexar_shop/utils/tools/file_importers.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: height(context),
          width: width(context),
          child: DefaultTabController(
            length: 4,
            child: Column(
              children: [
                TabBar(tabs: [
                  Tab(child: Image.asset(AppImage.mobiUzLogo)),
                  Tab(child: Image.asset(AppImage.beelineLogo)),
                  Tab(child: Image.asset(AppImage.ucellLogo)),
                  Tab(child: Image.asset(AppImage.uzmobileLogo)),
                ]),
                Expanded(
                  child: TabBarView(
                    children: [
                      CompanyBox(company: companies[0]),
                      CompanyBox(company: companies[1]),
                      CompanyBox(company: companies[2]),
                      CompanyBox(company: companies[3]),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
