import "package:flutter/material.dart";

import "/exports/exports.dart";

class BillName extends StatelessWidget {
  final int id;
  final String amount;
  final int billId;
  const BillName(
      {super.key,
      required this.id,
      required this.amount,
      required this.billId});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: BillService().getBillName(id),
      builder: (context, snapshot) {
        var data = snapshot.data ?? "";
        return snapshot.hasData
            ? ListTile(
                leading: const Icon(
                  Icons.money,
                ),
                title: Text(
                  data,
                  style: Theme.of(context).textTheme.bodyLarge!.apply(
                        fontWeightDelta: 1,
                        fontSizeFactor: 1.2,
                      ),
                ),
                subtitle: Text(
                  amount,
                ),
                onLongPress: () {
                  showAdaptiveDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog.adaptive(
                          title: const Text("Delete Bill"),
                          content: const Text(
                              "Are you sure you want to delete this bill?"),
                          actions: [
                            TextButton(
                              onPressed: () {
                                BillService().deleteBill(billId);
                              },
                              child: Text(
                                "Yes",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .apply(
                                      color: Colors.red,
                                    ),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text("No"),
                            ),
                          ],
                        );
                      });
                },
                onTap: () {
                  Routes.pushPageWithRouteAndAnimation(
                    SplitBill(
                      amount: amount,
                      billId: billId,
                    ),
                  );
                },
              )
            : const Center(
                child: LinearProgressIndicator(),
              );
      },
    );
  }
}
