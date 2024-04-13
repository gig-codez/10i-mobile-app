import "dart:io";

import "package:image_picker/image_picker.dart";
import "./widgets/image_add_card.dart";
import "/exports/exports.dart";

class ScanBackSide extends StatefulWidget {

  const ScanBackSide({super.key});

  @override
  State<ScanBackSide> createState() => _ScanBackSideState();
}

class _ScanBackSideState extends State<ScanBackSide> {
  String imagePath = "";
  Map<String, dynamic> d = {};
  // helper methods
  takePhoto() async {
    var file = await ImagePicker().pickImage(source: ImageSource.camera);
    if (file != null) {
      int size = await file.length();
      setState(() {
        // save the image
        imagePath = file.path;
        d = {
          "fileName": file.name,
          "imageData": file.readAsBytes().asStream(),
          "size": size
        };
      });
    }
  }

  @override
  Widget build(BuildContext context) {
       String option =
        Provider.of<TextController>(context, listen: false).text['key'];
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: Text(
          "Scan your $option",
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.w800,
                fontSize: 20,
              ),
        ),
      ),
      body: Consumer<LoaderController>(builder: (context, controller, c) {
        return ListView(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
          children: [
            ImageAddCard(
              option: option,
              imageUrl: imagePath,
              side: "Back Side",
              clickable: imagePath.isEmpty,
              onTap: () {
                takePhoto();
              },
            ),
            // if (imagePath.isNotEmpty) const SpaceWidget(space: 0.2),
            CustomButton(
              text: "Upload Back Image",
              loading: controller.isLoading,
              onPress: () {
                if (imagePath.isEmpty) {
                  showMessage(
                      message: "Please select an image first", type: 'error');
                  return;
                } else {
                  controller.isLoading = true;
                  AuthService().uploadBack(d).then((value) {
                    setState(() {
                      imagePath = "";
                      d = {};
                    });
                    // navigate to next screen
                    // Routes.replacePage()
                  });
                }
              },
            ),
          ],
        );
      }),
    );
  }
}
