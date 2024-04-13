import "/exports/exports.dart";
class TextController with ChangeNotifier {

  Map<String,dynamic> _text = {};

  Map<String,dynamic> get text => _text;

  void setText(Map<String,dynamic> text) {
    _text = text;
    notifyListeners();
  }
}