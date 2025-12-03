part of 'setting_view.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          spacing: 10,
          children: [
            Icon(Icons.edit_document, color: customRed),
            Text("Privacy Policy", style: titleMedium()),
          ],
        ),
        vPad5,
        Text(
          "Define your app's privacy policy that users will see during signup and in the app",
          style: bodyLarge(),
        ),

        vPad20,
        customInput(
          hintText: "Write down your privacy text here...",
          applyBorder: true,
          isEnable: true,
          onChange: (e) {},
          isBig: true,
        ),

        vPad20,
        Align(
          alignment: Alignment.centerRight,
          child: FilledButton.icon(
            style: FilledButton.styleFrom(
              backgroundColor: Color(0xff4A136A),
              minimumSize: Size(120, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(8),
              ),
            ),
            onPressed: () {},
            label: Text("Save Changes"),
            icon: Icon(Icons.save),
          ),
        ),
        vPad35,
        Divider(),
        vPad35,
        Row(
          spacing: 10,
          children: [
            Icon(Icons.edit_document, color: customRed),
            Text("Terms & Condition", style: titleMedium()),
          ],
        ),
        vPad5,
        Text(
          "Define your app's terms and conditions that users must accept",
          style: bodyLarge(),
        ),

        vPad20,
        customInput(
          applyBorder: true,
          hintText: "Write down your terms & condition text here...",
          isEnable: true,
          onChange: (e) {},
          isBig: true,
        ),

        vPad20,
        Align(
          alignment: Alignment.centerRight,
          child: FilledButton.icon(
            style: FilledButton.styleFrom(
              backgroundColor: Color(0xff4A136A),
              minimumSize: Size(120, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(8),
              ),
            ),
            onPressed: () {},
            label: Text("Save Changes"),
            icon: Icon(Icons.save),
          ),
        ),
      ],
    );
  }
}
