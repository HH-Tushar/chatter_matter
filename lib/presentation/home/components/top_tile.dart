part of '../home_view.dart';



Widget topTile({
  required String title,
  required String value,
  required String backgroundIcon,
  required String foregroundIcon,
  bool isPrimary = false,
  required double tileWidth,
}) {
  return Container(
    height: 160,
    width: tileWidth,

    decoration: BoxDecoration(
      color: isPrimary ? primaryColor : primaryContainer,
      borderRadius: BorderRadius.circular(defaultRadius),
    ),

    child: Stack(
      children: [
        Positioned(
          right: 0,
          child: SvgPicture.asset(backgroundIcon, color: customBlack),
        ),
        Padding(
          padding: EdgeInsets.all(defaultPadding),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: customWhite,
                child: SvgPicture.asset(foregroundIcon, color: primaryColor),
              ),
              Text(
                title,
                style: bodyLarge(color: isPrimary ? customWhite : primaryColor),
              ),
              Text(
                value,
                style: heading(color: isPrimary ? customWhite : primaryColor),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
