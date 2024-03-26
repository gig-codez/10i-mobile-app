import "/exports/exports.dart";

class OnboardSlide extends StatelessWidget {
  final String image;
  final String description;
  const OnboardSlide(
      {super.key, required this.image, required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          image.endsWith(".png")
              ? FittedBox(
                  child: Image.asset(
                    image,
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  ),
                )
              : SvgPicture.asset(image),
          Text(
            description,
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .apply(fontWeightDelta: 200),
          ),
        ],
      ),
    );
  }
}
