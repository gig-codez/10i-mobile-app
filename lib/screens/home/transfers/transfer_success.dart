import '/exports/exports.dart';

class TransferSuccess extends StatelessWidget {
  const TransferSuccess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transfer Successful'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AspectRatio(
              aspectRatio: 2,
              child: SvgPicture.asset(
                'assets/svgs/success.svg',
              ),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Your \$1,000 is on its way',
              style: TextStyle(fontSize: 24.0),
            ),
            const SizedBox(height: 16.0),
            const Text('Estimated arrival: 3 business days'),
            const SizedBox(height: 16.0),
            const Text('You are transferring money to:'),
            const Text('Bank of America'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Routes.replacePage(const IndexPage()),
        child: const Icon(Icons.check),
      ),
    );
  }
}
