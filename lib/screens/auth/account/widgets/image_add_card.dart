import "/exports/exports.dart";
import "dart:io";

class ImageAddCard extends StatelessWidget {
  final String option;
  final String imageUrl;
  final String side;
  final bool clickable;
  final VoidCallback onTap;
  const ImageAddCard(
      {super.key,
      required this.option,
      required this.onTap,
      this.imageUrl = "",
      this.side = "",
      this.clickable = true});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TapEffect(
        onClick: onTap,
        child: Card(
            margin: const EdgeInsets.all(10),
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
              side: BorderSide(
                width: 1.3,
                color: Colors.grey.shade400,
              ),
            ),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.5,
              width: MediaQuery.of(context).size.width,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SpaceWidget(space: 0.05),
                    if (imageUrl.isNotEmpty)
                      Flexible(
                        child: Image.file(
                          File(imageUrl),
                          fit: BoxFit.cover,
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.5,
                        ),
                      ),
                    if (imageUrl.isEmpty)
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: "Upload the $side of your \n$option here",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(),
                            ),
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                    if (imageUrl.isEmpty)
                      const Icon(Icons.add_a_photo_rounded,
                          size: 50, color: Colors.grey),
                  ]),
            )),
      ),
    );
  }
}
