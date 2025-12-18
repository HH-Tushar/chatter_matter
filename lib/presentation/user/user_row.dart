part of 'user_list_view.dart';

class _UserRow extends StatelessWidget {
  const _UserRow({
    super.key,
    required this.onManage,
    required this.onView,
    required this.user,
  });
  final VoidCallback onManage;
  final VoidCallback onView;
  final AppUser user;
  @override
  Widget build(BuildContext context) {
    final subscription = _subscriptionTile(user.subscriptionType);
    return Card(
      color: customWhite,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(defaultRadius),
        side: BorderSide(color: primaryContainer),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(user.name),
                  Row(
                    spacing: 5,
                    children: [
                      Icon(Icons.email_outlined, size: 15),
                      Text(user.email),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [subscription],
              ),
            ),

            Expanded(
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("121 answers", style: bodyMedium()),
                    Text("23 favorite", style: bodySmall(color: customGrey)),
                  ],
                ),
              ),
            ),

            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(
                      horizontal: defaultPadding,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: customGreenContainer,
                      borderRadius: BorderRadius.circular(defaultRadius),
                    ),
                    child: Text(
                      "active",
                      style: bodySmall(
                        color: customGreen,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              child: Row(
                spacing: 20,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: onManage,
                    child: Container(
                      height: 45,
                      width: 50,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Color(0xffE0E0E0),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(Icons.edit),
                    ),
                  ),
                  MaterialButton(
                    minWidth: 50,
                    height: 45,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    color: Color(0xffE0E0E0),
                    onPressed: onView,
                    child: Row(
                      spacing: 10,
                      children: [
                        hPad5,
                        Icon(Icons.visibility),
                        Text(
                          "View",
                          style: bodyMedium(fontWeight: FontWeight.w600),
                        ),
                        hPad5,
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _subscriptionTile(String title) {
  return Container(
    alignment: Alignment.center,
    padding: EdgeInsets.symmetric(horizontal: defaultPadding, vertical: 6),
    decoration: BoxDecoration(
      color: title == "free"
          ? Color(0xffBDBDBD)
          : title == "standard"
          ? primaryContainer
          : null,
      gradient: title == "vip"
          ? LinearGradient(colors: vipGradient)
          : null,
      borderRadius: BorderRadius.circular(defaultRadius),
    ),
    child: Text(title, style: bodySmall(color: customWhite)),
  );
}
