import '/exports/exports.dart';

class SocialWidget extends StatelessWidget {
  final String image;
  final String text;
  final VoidCallback? onTap;
  const SocialWidget(
      {super.key, required this.image, required this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return TapEffect(
      onClick: onTap ?? () {},
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
          side: BorderSide(
            width: 1,
            color: Colors.grey.shade300,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(5, 15, 5, 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SvgPicture.asset(
                image,
                width: 30,
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                child: Text(
                  text,
                  style: Theme.of(context).textTheme.titleMedium!.apply(
                        fontWeightDelta: 15,
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
