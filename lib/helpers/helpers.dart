import "/exports/exports.dart";

// global messages
void showMessage({String message = "", String type = "default"}) {
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
                      : Colors.grey.shade600,
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
        content: Padding(
          padding: const EdgeInsets.fromLTRB(10, 15, 10, 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                text,
                style: Theme.of(context).textTheme.titleMedium!.apply(
                      fontSizeDelta: 2,
                    ),
              ),
              const CircularProgressIndicator.adaptive(),
            ],
          ),
        ),
      );
    },
  );
}

// show dialogs
void showDialogWindow(Widget widget) {
  showAdaptiveDialog(
    context: context,
    builder: (_) => Dialog(
      child: widget,
    ),
  );
}

// scaned user
var scanuser = {
  "user": {
    "id": 19,
    "username": "brunolabs256+16@gmail.com",
    "is_staff": false,
    "is_active": true,
    "date_joined": "2024-04-12T07:16:22.352590Z",
    "date_of_birth": "2024-04-12",
    "address": "Kampala",
    "gender": "Male",
    "tel": "+256750482089",
    "first_name": "Mugamba",
    "last_name": "Bruno",
    "email": "brunolabs256+16@gmail.com",
    "email_verified_time": "2024-04-12T07:16:48.845857Z",
    "tel_verified": true,
    "photo_url": "--image--",
    "confirmation_status": "ConfirmationStatus.UNVERIFIED",
    "confirmation_status_comment": null,
    "country": 226,
    "groups": [],
    "user_permissions": []
  },
  "token": "3668e48b9c2a9fa7c4e79e7915fe53b47dadead5"
};

UserModel getScannedUser() {
  return UserModel.fromJson(scanuser);
}
