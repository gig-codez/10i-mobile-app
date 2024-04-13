import "/exports/exports.dart";
import "package:image_picker/image_picker.dart";
import "dart:io";

// import 'package:ripple_wave/ripple_wave.dart';
class FacePage extends StatefulWidget {
  const FacePage({super.key});

  @override
  State<FacePage> createState() => _FacePageState();
}

class _FacePageState extends State<FacePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: Text(
          "Face Recogntion",
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.w900,
                fontSize: 24,
              ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
        children: [
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text:
                      "\nAdd a face recognition to make your account more secure.\n",
                  style: Theme.of(context).textTheme.bodyMedium!.apply(
                        fontSizeFactor: 1.2,
                      ),
                ),
              ],
            ),
            textAlign: TextAlign.center,
          ),
          // image for verification
          Image.asset(
            "assets/pngs/face.png",
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.width / 1.3,
          ),

          Text(
            "\n. ",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SpaceWidget(
            space: 0.05,
          ),
          Row(children: [
            Flexible(
              child: CustomButton(
                text: "Skip",
                onPress: () {
                  Routes.replacePage(const LoginScreen());
                },
              ),
            ),
            const SpaceWidget(space: 0.05),
            Consumer<LoaderController>(builder: (context, controller, f) {
              return Flexible(
                child: CustomButton(
                  text: "Start",
                  loading: controller.loading,
                  onPress: controller.isLoading
                      ? () {}
                      : () async {
                          var picker = await ImagePicker()
                              .pickImage(source: ImageSource.camera);
                          if (picker != null) {
                            AuthService().captureFace({
                              'imageData': picker.readAsBytes().asStream(),
                              'size': File(picker.path).lengthSync(),
                              'fileName': picker.name
                            });
                            // Routes.routeTo(Routes.verify);
                          }
                        },
                  buttonColor: Theme.of(context).primaryColor,
                  textColor: Colors.white,
                ),
              );
            })
          ])
        ],
      ),
    );
  }
}
