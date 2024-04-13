import '/exports/exports.dart';
import "./widgets/avatar_widget.dart";
import 'package:intl/intl.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  // form  controllers
  final _nameController = TextEditingController();
  final _genderController = TextEditingController();
  final _phoneController = TextEditingController();
  final _dobController = TextEditingController();
  final _addressController = TextEditingController();
// gender
  int male = 0, female = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          forceMaterialTransparency: true,
          title: const Text("Fill Your Profile")),
      body: Consumer<LoaderController>(builder: (context, controller, c) {
        return ListView(
          padding: const EdgeInsets.only(left: 19.0, right: 19.0, top: 12.0),
          children: [
            Text.rich(
              TextSpan(
                children: [
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
            const AvatarWidget(),
            const SizedBox.square(
              dimension: 20,
            ),

            CommonTextField(
              hintText: "John Doe",
              enableBorder: true,
              icon: Icons.person,
              readOnly: controller.isLoading,
              controller: _nameController,
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
              readOnly: controller.isLoading,
              controller: _phoneController,
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
            TapEffect(
              onClick: () async {
                var result = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1900),
                  lastDate: DateTime(4000),
                );
                result != null
                    ? _dobController.text =
                        DateFormat("yyy-MM-dd").format(result)
                    : null;
              },
              child: CommonTextField(
                hintText: "XX/XX/XXXX",
                enableBorder: true,
                icon: Icons.calendar_month,
                titleText: "Date Of Birth",
                readOnly: true,
                controller: _dobController,
                keyboardType: TextInputType.streetAddress,
                contentPadding: const EdgeInsets.only(
                  left: 16,
                  right: 16,
                  top: 16,
                  bottom: 10,
                ),
                validate: (value) {
                  if (value!.isEmpty) {
                    return "Please enter your date of birth";
                  }
                  return null;
                },
              ),
            ),
            const SizedBox.square(
              dimension: 20,
            ),
            CommonTextField(
              hintText: "Enter your address",
              enableBorder: true,
              icon: Icons.location_on_rounded,
              readOnly: controller.isLoading,
              titleText: "Address",
              controller: _addressController,
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
                    value: male,
                    groupValue: 9,
                    onChanged: (value) {
                      setState(() {
                        female = 0;
                        male = 9;
                        _genderController.text = "Male";
                      });
                    },
                  ),
                ),
                Expanded(
                  child: RadioListTile(
                    title: const Text("Female"),
                    value: female,
                    groupValue: 9,
                    onChanged: (value) {
                      setState(() {
                        female = 9;
                        male = 0;
                        _genderController.text = "Female";
                      });
                    },
                  ),
                ),
              ],
            ),
            const SizedBox.square(
              dimension: 20,
            ),
            CustomButton(
              loading: controller.isLoading,
              // width: MediaQuery.of(context).size.width / 2.5,
              onPress: () {
                AuthService().completeProfile({
                  "first_name":
                      _nameController.text.trim().split(" ").first.trim(),
                  "last_name":
                      _nameController.text.trim().split(" ").last.trim(),
                  "phone": _phoneController.text,
                  "date_of_birth": _dobController.text,
                  "address": _addressController.text,
                  "gender": _genderController.text,
                  "tel": _phoneController.text,
                });
              },
              opacity: 1,
              textColor: Colors.white,
              text: "Save & Continue",
              buttonRadius: 50,
            ),
            const SpaceWidget(
              space: 0.1,
            )
          ],
        );
      }),
    );
  }
}
