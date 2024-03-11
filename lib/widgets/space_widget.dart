import '/exports/exports.dart';
class SpaceWidget extends StatelessWidget {
  final double space;
  const SpaceWidget({super.key, this.space = 0.03});

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: MediaQuery.of(context).size.width * space,
    );
  }
}
