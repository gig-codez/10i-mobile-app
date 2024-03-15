import "/exports/exports.dart";

class Invoices extends StatefulWidget {
  const Invoices({super.key});

  @override
  State<Invoices> createState() => _InvoicesState();
}

class _InvoicesState extends State<Invoices> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Invoices",
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ],
    );
  }
}
// A1rq0@2022