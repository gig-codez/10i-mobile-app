import "/exports/exports.dart";

class DataController with ChangeNotifier {
  bool _dataLoading = true;
  bool get dataLoading => _dataLoading;
  //
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

  // handle contacts
  List<dynamic> _contacts = [];
  List<dynamic> get contacts {
    _fetchContacts();
    return _contacts;
  }

  _fetchContacts() {
    UserService.getContactsList().then((value) {
      _contacts = value;
      _dataLoading = false;
      notifyListeners();
    });
  }

  // user info
  SingleUserModel? _singleUser;
  SingleUserModel? get singleUser => _singleUser;
  void fetchSingleUser(int id) {
    UserService.getUser(id).then((value) {
      _singleUser = value;

      notifyListeners();
    });
  }

  // search for new contacts
  List<dynamic> _searchResults = [];
  List<dynamic> get searchResults {
    return _searchResults;
  }

  // function to search for contacts
  void searchContacts(String query) {
    UserService.getUsers(query: query).then((value) {
      _searchResults = value;
      _dataLoading = false;
      notifyListeners();
    });
  }
}
