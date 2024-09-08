import 'package:baseapp/app/theme.dart';
import 'package:baseapp/common/utils/size_utils.dart';
import 'package:baseapp/common/widgets/images/custom_cache_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CustomCarousel extends StatefulWidget {
  final double height;
  final double? imageWidth;
  final List<String> items;
  final double bottomMargin;
  final double topMargin;
  final String title;
  final Function(int)? onPressed;
  final bool showCarouselIndicator;

  const CustomCarousel({
    required this.height,
    super.key,
    this.imageWidth,
    required this.items,
    this.topMargin = 0,
    this.bottomMargin = 20,
    this.title = "",
    this.onPressed,
    this.showCarouselIndicator = true,
  }) : assert(items.length > 0);

  @override
  State<CustomCarousel> createState() => _CustomCarouselState();
}

class _CustomCarouselState extends State<CustomCarousel> {
  final ValueNotifier<int> _currentIndex = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: widget.topMargin.hp,
        bottom: widget.bottomMargin.hp,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.title.isNotEmpty)
            Container(
              margin: const EdgeInsets.only(
                bottom: 10,
                left: CustomTheme.symmetricHozPadding,
                right: CustomTheme.symmetricHozPadding,
              ),
              child: Text(
                widget.title,
                style: CustomTheme.titleLarge.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          AspectRatio(
            aspectRatio: 16 / 6,
            child: CarouselSlider(
              options: CarouselOptions(
                autoPlayInterval: const Duration(seconds: 2),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlay: true,
                initialPage: 0,
                onPageChanged: (index, _) {
                  _currentIndex.value = index;
                },
                viewportFraction: 0.85,
                enlargeCenterPage: true,
              ),
              items: List.generate(widget.items.length, (index) {
                return InkWell(
                  onTap: () {
                    if (widget.onPressed != null) {
                      widget.onPressed!(index);
                    }
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: SizedBox(
                      width: widget.imageWidth,
                      child: CustomCachedNetworkImage(
                        url: widget.items[index],
                        width: double.infinity,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
          if (widget.showCarouselIndicator) SizedBox(height: 10.hp),
          if (widget.showCarouselIndicator)
            ValueListenableBuilder<int>(
              valueListenable: _currentIndex,
              builder: (context, currentIndex, _) {
                return Align(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      widget.items.length,
                      (index) {
                        return AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          height: 8,
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          decoration: BoxDecoration(
                            color: currentIndex == index
                                ? CustomTheme.primaryColor
                                : CustomTheme.gray,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          width: currentIndex == index ? 16 : 8,
                        );
                      },
                    ),
                  ),
                );
              },
            )
        ],
      ),
    );
  }
}
