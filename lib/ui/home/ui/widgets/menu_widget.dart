import 'package:rexar_shop/utils/tools/file_importers.dart';

// ignore: must_be_immutable
class MenuWidget extends StatelessWidget {
  MenuModel menus;
  Color color;
  VoidCallback ontap;
  MenuWidget(
      {required this.ontap,
      required this.menus,
      required this.color,
      super.key});

  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      onTap: ontap,
      child: Container(
        height: 54,
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        width: width(context),
        decoration: BoxDecoration(
            color: color,
            borderRadius: const BorderRadius.all(Radius.circular(12))),
        child: Row(
          children: [
            const SizedBox(width: 10),
            Icon(
              menus.icon,
              color: Colors.white,
              size: 30,
            ),
            const SizedBox(width: 15),
            Text(
              menus.title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
