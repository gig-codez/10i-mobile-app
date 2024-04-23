import "/exports/exports.dart";
import "dart:convert";

class UserService {
  static getUsers() async {
    try {} on ClientException catch (_, e) {
      debugPrint("Error $e");
    }
  }

  // contacts
  static getContactsList() async {
    StorageService storage = StorageService();
    var data = await storage.getData("user");
    try {
      var headers = {
        'Authorization': 'Basic YnJ1bm9sYWJzMjU2KzE4QGdtYWlsLmNvbTp0ZXN0MTIz'
      };
      var request = Request(
          'GET', Uri.parse("${Apis.allContatcts}${data['user']['id']}/"));
      request.headers.addAll(headers);
      StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        var d = json.decode(await response.stream.bytesToString());
        print(d);
      } else {
        print(response.reasonPhrase);
      }
    } on ClientException catch (_, e) {
      debugPrint("Error $e");
    }
  }

  static void createContactList(Map<String, dynamic> data) async {
    try {
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Basic c3dlZWRsZWdhbmdAZ21haWwuY29tOjEyMzQ1Njc4'
      };
      var request = Request('POST', Uri.parse(Apis.createContact));
      request.body = json.encode(
        {
          "user": data.get('user'),
          "contact": data.get('contact'),
        },
      );
      request.headers.addAll(headers);
      StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        var d = json.decode(await response.stream.bytesToString());
        if (kDebugMode) {
          print(d);
        }
      } else {
        showMessage(
            message: response.reasonPhrase ?? "Something went wrong",
            type: "error");
      }
    } on ClientException catch (_, e) {
      debugPrint("Error $e");
    }
  }
}
