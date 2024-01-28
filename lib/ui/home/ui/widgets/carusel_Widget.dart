// ignore:ssssssssss
// ignore_for_file: file_names

import '../../../../utils/tools/file_importers.dart';

// ignore: must_be_immutable
class CaruselWidget extends StatelessWidget {
  List images;
  CaruselWidget({required this.images, super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterCarousel(
      options: CarouselOptions(
        height: height(context) * 0.3,
        physics: const BouncingScrollPhysics(),
        autoPlay: true,
        showIndicator: true,
        reverse: true,
        autoPlayAnimationDuration: const Duration(seconds: 3),
        slideIndicator: const CircularSlideIndicator(),
      ),
      items: images.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.amber,
                image: DecorationImage(
                  image: AssetImage(i),
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
