import "/exports/exports.dart";

class DataController with ChangeNotifier {
  double _balance = 0;
  double get balance {
    _setBalance();
    return _balance;
  }

  void _setBalance() {
    PaymentService().getWalletBalance().then((value) {
      _balance = value.walletBalance;
      notifyListeners();
    });
  }
}
