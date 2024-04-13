import "/exports/exports.dart";
import "package:image_picker/image_picker.dart";
import "dart:io";

class AvatarWidget extends StatefulWidget {
  const AvatarWidget({super.key});

  @override
  State<AvatarWidget> createState() => _AvatarWidgetState();
}

class _AvatarWidgetState extends State<AvatarWidget>
    with SingleTickerProviderStateMixin {
  String imagePath = "";
  AnimationController? controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this,
        duration: const Duration(
          milliseconds: 1000,
        ));
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  // helper methods
  void showOptionsMenu() {
    showModalBottomSheet(
      transitionAnimationController: controller,
      showDragHandle: true,
      context: context,
      builder: (context) {
        return BottomSheet(
            onClosing: () {},
            builder: (context) {
              return SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Card(
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100.0),
                              side: BorderSide(
                                color: Colors.grey.shade300,
                                width: 2.0,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: IconButton(
                                icon: const Icon(
                                  Icons.image,
                                  size: 35,
                                ),
                                onPressed: () {
                                  pickerPicture(options: "gallery");
                                },
                              ),
                            ),
                          ),
                          Text("Gallery",
                              style: Theme.of(context).textTheme.titleMedium),
                        ],
                      ),
                      Column(
                        children: [
                          Card(
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100.0),
                              side: BorderSide(
                                color: Colors.grey.shade300,
                                width: 2.0,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: IconButton(
                                icon: const Icon(
                                  Icons.camera_alt,
                                  size: 35,
                                ),
                                onPressed: () {
                                  pickerPicture(options: "camera");
                                },
                              ),
                            ),
                          ),
                          Text(
                            "Camera",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      ),
                    ],
                  ));
            });
      },
    );
  }

  void pickerPicture({String options = "camera"}) async {
    final pickedFile = await ImagePicker().pickImage(
        source:
            options == "gallery" ? ImageSource.gallery : ImageSource.camera);

    if (pickedFile != null) {
      setState(() {
        imagePath = pickedFile.path;
      });
      var data = {
        'imageData': pickedFile.readAsBytes().asStream(),
        'size': File(imagePath).lengthSync(),
        'fileName': pickedFile.name
      };
      // send post request to server
      AuthService().userProfile(data);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LoaderController>(builder: (context, controller, c) {
      return Center(
        child: Stack(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundColor: Theme.of(context).brightness == Brightness.light
                  ? Colors.grey.shade300
                  : Colors.white12,
              backgroundImage:
                  imagePath.isNotEmpty ? FileImage(File(imagePath)) : null,
              child: imagePath.isEmpty
                  ? Icon(
                      Icons.person,
                      size: 50,
                      color: Colors.grey[600],
                    )
                  : null,
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: CircleAvatar(
                backgroundColor: controller.loading
                    ? Colors.grey.shade200
                    : Theme.of(context).primaryColor,
                child: IconButton(
                  icon: controller.loading
                      ? const CircularProgressIndicator.adaptive()
                      : const Icon(
                          Icons.edit,
                          color: Colors.white,
                        ),
                  onPressed: () => showOptionsMenu(),
                ),
              ),
            )
          ],
        ),
      );
    });
  }
}
