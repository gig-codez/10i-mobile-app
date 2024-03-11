import "/exports/exports.dart";

class ScanDocument extends StatefulWidget {
  const ScanDocument({super.key});

  @override
  State<ScanDocument> createState() => _ScanDocumentState();
}

class _ScanDocumentState extends State<ScanDocument> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
      ),
      body: Column(
        children: [
          Text(
            "Photo ID Card",
          ),
        ],
      ),
    );
  }
}
