part of '../home_view.dart';

Widget quickStartLayout() {
  return Container(
    height: 330,

    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(defaultRadius),
      color: primaryContainer.withAlpha(50),
    ),
    padding: const EdgeInsets.all(defaultPadding),
    child: Column(
      spacing: 25,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Quick Starts", style: heading()),
            Text(
              "Key metrics at a glance",
              style: bodyMedium(color: customGrey),
            ),
          ],
        ),
        _quickTile(
          color: primaryColor,
          title: "Total Questions",
          value: "450",
          icon: Icons.chat_bubble_outline,
        ),
        _quickTile(
          color: Colors.red,
          title: "Total Questions",
          value: "450",
          icon: Icons.favorite_border,
        ),
        _quickTile(
          color: customBlue,
          title: "Total Questions",
          value: formatNumberWithComa(1500),
          icon: Icons.show_chart,
        ),
      ],
    ),
  );
}

_quickTile({
  required Color color,
  required IconData icon,
  required String title,
  required String value,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Row(
        spacing: 10,
        children: [
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(defaultRadius),
              color: color.withAlpha(20),
            ),
            child: Icon(icon, color: color),
          ),

          Text(title, style: titleMedium(fontWeight: FontWeight.w400)),
        ],
      ),

      Text(value, style: heading(color: primaryColor)),
    ],
  );
}
