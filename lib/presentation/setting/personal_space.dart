part of 'setting_view.dart';

class PersonalSpace extends StatelessWidget {
  const PersonalSpace({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Profile Information"),
        Text("Update your personal information"),

        vPad35,
        Text("Full Name"),
        vPad10,
        customInput(
          hintText: "Your name",
          isEnable: true,
          onChange: (e) {},
          isBig: false,
        ),
        vPad20,
        Text("Email Address"),
        vPad10,
        customInput(
          hintText: "Your email",
          isEnable: true,
          onChange: (e) {},
          isBig: false,
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
        Text("Current Password"),
        vPad10,
        customInput(
          hintText: "Your email",
          isEnable: true,
          onChange: (e) {},
          isBig: false,
        ),
        vPad20,
        Text("New Password"),
        vPad10,
        customInput(
          hintText: "Your email",
          isEnable: true,
          onChange: (e) {},
          isBig: false,
        ),
        vPad20,
        Text("Confirm Password"),
        vPad10,
        customInput(
          hintText: "Your email",
          isEnable: true,
          onChange: (e) {},
          isBig: false,
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
