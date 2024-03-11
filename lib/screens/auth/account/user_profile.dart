import '/exports/exports.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 19.0, right: 19.0, top: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: "Fill Your Profile\n ",
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontWeight: FontWeight.w900,
                          fontSize: 24,
                        ),
                  ),
                  TextSpan(
                    text:
                        "We want to provide the best experience according to the your needs.",
                    style: Theme.of(context).textTheme.bodyMedium!.apply(
                          fontSizeFactor: 1.2,
                        ),
                  ),
                ],
              ),
            ),
            const SizedBox.square(
              dimension: 20,
            ),
            Center(
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor:
                        Theme.of(context).brightness == Brightness.light
                            ? Colors.grey.shade300
                            : Colors.white12,
                    child: Icon(
                      Icons.person,
                      size: 50,
                      color: Colors.grey[600],
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: CircleAvatar(
                      backgroundColor: Theme.of(context).primaryColor,
                      child: IconButton(
                        icon: const Icon(
                          Icons.edit,
                          color: Colors.white,
                        ),
                        onPressed: () {},
                      ),
                    ),
                  )
                ],
              ),
            ),
            CommonTextField(
              hintText: "John Doe",
              enableBorder: true,
              icon: Icons.person,
              titleText: "Full Name",
              keyboardType: TextInputType.name,
              contentPadding: const EdgeInsets.only(
                left: 16,
                right: 16,
                top: 16,
                bottom: 10,
              ),
              validate: (value) {
                if (value!.isEmpty) {
                  return "Please enter name";
                }
                return null;
              },
            ),
            const SizedBox.square(
              dimension: 20,
            ),
            CommonTextField(
              hintText: "+256-7XX-XXXX",
              enableBorder: true,
              icon: Icons.phone,
              titleText: "Phone Number",
              keyboardType: TextInputType.phone,
              contentPadding: const EdgeInsets.only(
                left: 16,
                right: 16,
                top: 16,
                bottom: 10,
              ),
              validate: (value) {
                if (value!.isEmpty) {
                  return "Please enter location";
                }
                return null;
              },
            ),
            const SizedBox.square(
              dimension: 20,
            ),
            CommonTextField(
              hintText: "XX/XX/XXXX",
              enableBorder: true,
              icon: Icons.calendar_month,
              titleText: "Date Of Birth",
              keyboardType: TextInputType.streetAddress,
              contentPadding: const EdgeInsets.only(
                left: 16,
                right: 16,
                top: 16,
                bottom: 10,
              ),
              validate: (value) {
                if (value!.isEmpty) {
                  return "Please enter location";
                }
                return null;
              },
            ),
            const SizedBox.square(
              dimension: 20,
            ),
            CommonTextField(
              hintText: "your location",
              enableBorder: true,
              icon: Icons.location_on_rounded,
              titleText: "Address",
              keyboardType: TextInputType.streetAddress,
              contentPadding: const EdgeInsets.only(
                left: 16,
                right: 16,
                top: 16,
                bottom: 10,
              ),
              validate: (value) {
                if (value!.isEmpty) {
                  return "Please enter location";
                }
                return null;
              },
            ),
            // dropdown for selecting gender
            Text(
              "Gender",
              style: TextStyles(context).getDescriptionStyle(),
            ),
            Row(
              children: [
                Expanded(
                  child: RadioListTile(
                    title: const Text("Male"),
                    value: "male",
                    groupValue: "",
                    onChanged: (value) {},
                  ),
                ),
                Expanded(
                  child: RadioListTile(
                    title: const Text("Female"),
                    value: "female",
                    groupValue: "gender",
                    onChanged: (value) {},
                  ),
                ),
              ],
            ),
            const SizedBox.square(
              dimension: 20,
            ),
            CustomButton(
              // width: MediaQuery.of(context).size.width / 2.5,
              onPress: () => Routes.routeTo(Routes.createPin),
              opacity: 1,
              textColor: Colors.white,
              text: "Save & Continue",
              buttonRadius: 50,
            ),
          ],
        ),
      ),
    );
  }
}
