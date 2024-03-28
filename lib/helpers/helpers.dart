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
