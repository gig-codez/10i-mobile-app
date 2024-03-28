import "/exports/exports.dart";

class PaymentSummary extends StatelessWidget {
  const PaymentSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.grey.shade100,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
        side: BorderSide(
          width: 0.5,
          color: Colors.blueGrey.shade100,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            const CircleAvatar(
              backgroundImage: AssetImage(
                "assets/pngs/dp.png",
              ),
              radius: 50,
            ),
            Divider(
              color: Colors.blueGrey.shade200,
            ),
            ListTile(
              title: Text(
                "Bill Amount",
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.w300,
                    ),
              ),
              trailing: Text(
                "\$1,000",
                style: Theme.of(context).textTheme.bodyLarge!.apply(
                      fontWeightDelta: 25,
                    ),
              ),
            ),
            ListTile(
              title: Text(
                "Name",
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.w300,
                    ),
              ),
              trailing: Text(
                "John Doe",
                style: Theme.of(context).textTheme.bodyLarge!.apply(
                      fontWeightDelta: 25,
                    ),
              ),
            ),
            ListTile(
              title: Text(
                "Customer ID",
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.w300,
                    ),
              ),
              trailing: Text(
                "0099900494",
                style: Theme.of(context).textTheme.bodyLarge!.apply(
                      fontWeightDelta: 25,
                    ),
              ),
            ),
            ListTile(
              title: Text(
                "Status",
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.w300,
                    ),
              ),
              trailing: Chip(
                label: Text(
                  "Unpaid",
                  style: Theme.of(context).textTheme.bodyMedium!.apply(
                        color: Colors.white,
                      ),
                ),
                backgroundColor: Colors.redAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: const BorderSide(
                    width: 0.1,
                    color: Colors.redAccent,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
