import 'package:auth_project/colour/colors.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';



// External Widget: CachedImageWidget (Placeholder for cached image widget)
class CachedImageWidget extends StatelessWidget {
  final String url;
  final double width;
  final double height;
  final BoxFit fit;
  final bool circle;

  CachedImageWidget({
    required this.url,
    required this.width,
    required this.height,
    required this.fit,
    required this.circle,
  });

  @override
  Widget build(BuildContext context) {
    return Image.network(
      url,
      width: width,
      height: height,
      fit: fit,
    );
  }
}

// External Widget: ImageBorder (Placeholder for image border widget)
class ImageBorder extends StatelessWidget {
  final String src;
  final double height;

  ImageBorder({
    required this.src,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Image.network(
        src,
        height: height,
        width: height,
        fit: BoxFit.cover,
      ),
    );
  }
}

// External Widget: OnlineServiceIconWidget (Placeholder for Online Service Icon Widget)
class OnlineServiceIconWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.online_prediction,
      color: Colors.green,
      size: 24,
    );
  }
}

// External Widget: PriceWidget (Placeholder for PriceWidget)
class PriceWidget extends StatelessWidget {
  final double price;
  final bool isHourlyService;
  final Color color;
  final Color hourlyTextColor;
  final double size;
  final bool isFreeService;
  final bool isLineThroughEnabled;

  PriceWidget({
    required this.price,
    required this.isHourlyService,
    required this.color,
    required this.hourlyTextColor,
    required this.size,
    required this.isFreeService,
    this.isLineThroughEnabled = false,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      '\$${price.toStringAsFixed(2)}',
      style: TextStyle(
        color: color,
        fontSize: size,
        decoration: isLineThroughEnabled ? TextDecoration.lineThrough : TextDecoration.none,
      ),
    );
  }
}

// Main Widget: ServiceDashboardComponent3
class ServiceDashboardComponent3 extends StatelessWidget {
  final String serviceImage;
  final String serviceName;
  final String subCategoryName;
  final String categoryName;
  final double price;
  final double discountedPrice;
  final String providerName;
  final String providerImage;
  final double totalRating;
  final bool isOnlineService;
  final bool isFavouriteService;

  final double? width;

  ServiceDashboardComponent3({
    required this.serviceImage,
    required this.serviceName,
    required this.subCategoryName,
    required this.categoryName,
    required this.price,
    required this.discountedPrice,
    required this.providerName,
    required this.providerImage,
    required this.totalRating,
    this.isOnlineService = false,
    this.isFavouriteService = false,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Define action for onTap if needed
      },
      child: Container(
        decoration: boxDecorationWithRoundedCorners(
          borderRadius: radius(),
          backgroundColor: context.cardColor,
        ),
        width: width ?? context.width(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 180,
              width: context.width(),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  CachedImageWidget(
                    url: serviceImage,
                    fit: BoxFit.cover,
                    height: 180,
                    width: width ?? context.width(),
                    circle: false,
                  ).cornerRadiusWithClipRRectOnly(topRight: defaultRadius.toInt(), topLeft: defaultRadius.toInt()),
                  if (isOnlineService)
                    Positioned(
                      top: 12,
                      left: 12,
                      child: OnlineServiceIconWidget(),
                    ),
                  if (isFavouriteService)
                    Positioned(
                      top: 8,
                      right: 0,
                      child: Container(
                        padding: EdgeInsets.all(8),
                        margin: EdgeInsets.only(right: 8),
                        decoration: boxDecorationWithShadow(boxShape: BoxShape.circle, backgroundColor: context.cardColor),
                        // child: ic_heart.iconImage(color: unFavouriteColor, size: 18),
                      ),
                    ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                16.height,
                Marquee(
                  directionMarguee: DirectionMarguee.oneDirection,
                  child: Text(
                    subCategoryName.isNotEmpty ? subCategoryName.toUpperCase() : categoryName.toUpperCase(),
                    // style: boldTextStyle(color: appStore.isDarkMode ? textSecondaryColorGlobal : primaryColor, size: 12),
                  ),
                ).paddingSymmetric(horizontal: 16),
                16.height,
                Text(
                  serviceName,
                  style: boldTextStyle(),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ).paddingSymmetric(horizontal: 16),
                16.height,
                Row(
                  children: [
                    if (discountedPrice != 0)
                      PriceWidget(
                        price: discountedPrice,
                        isHourlyService: false,
                        color: primaryColor,
                        hourlyTextColor: primaryColor,
                        size: 18,
                        isFreeService: false,
                      ),
                    if (discountedPrice != 0) 16.width,
                    PriceWidget(
                      price: price,
                      isLineThroughEnabled: discountedPrice != 0,
                      isHourlyService: false,
                      color: discountedPrice != 0 ? textSecondaryColorGlobal : primaryColor,
                      hourlyTextColor: discountedPrice != 0 ? textSecondaryColorGlobal : primaryColor,
                      size: discountedPrice != 0 ? 14 : 18,
                      isFreeService: false,
                    ),
                  ],
                ).paddingSymmetric(horizontal: 16),
                12.height,
                Row(
                  children: [
                    ImageBorder(src: providerImage, height: 30),
                    8.width,
                    if (providerName.isNotEmpty)
                      Text(
                        providerName,
                        // style: secondaryTextStyle(size: 12, color: appStore.isDarkMode ? Colors.white : appTextSecondaryColor),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ).expand()
                  ],
                ).paddingSymmetric(horizontal: 16),
                16.height,
              ],
            ),
          ],
        ),
      ),
    );
  }
}
