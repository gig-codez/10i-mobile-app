import "/exports/exports.dart";

// global messages
void showMessage({String message = "", String type = "info"}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      backgroundColor: type == "info"
          ? Colors.blue
          : type == "error"
              ? Colors.red
              : type == "success"
                  ? Colors.green
                  : type == "warning"
                      ? Colors.orange
                      : Colors.grey.shade300,
    ),
  );
}

// processing
void showLoader({String text = ""}) {
  showAdaptiveDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog.adaptive(
        content: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const CircularProgressIndicator.adaptive(),
          ],
        ),
      );
    },
  );
}
