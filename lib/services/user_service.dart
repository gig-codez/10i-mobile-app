import "/exports/exports.dart";
import "dart:convert";

class UserService {
  static Future<SingleUserModel> getUser(int id) async {
    try {
      var headers = {
        'Authorization': 'Basic YnJ1bm9sYWJzMjU2KzE4QGdtYWlsLmNvbTp0ZXN0MTIz'
      };
      var request = Request('GET', Uri.parse('${Apis.singleUser}/$id/'));

      request.headers.addAll(headers);
      StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        String body = await response.stream.bytesToString();
        // print(body);
        return singleUserModelFromJson(body);
      } else {
        return Future.error(response.reasonPhrase ?? "");
      }
    } on ClientException catch (_, e) {
      return Future.error("Error $e");
    }
  }

  // function to delete a user from the contact
  Future<void> deleteUser(int id) async {
    showLoader(text:"Deleting contact.. ");
    try {
      var headers = {
        'Authorization': 'Basic YnJ1bm9sYWJzMjU2KzE4QGdtYWlsLmNvbTp0ZXN0MTIz'
      };
      var request = Request('DELETE', Uri.parse('${Apis.deleteContact}/$id/'));

      request.headers.addAll(headers);
      StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        var d = json.decode(await response.stream.bytesToString());
        showMessage(message:"Contact deleted.",type:"success");
        Routes.pop();
      } else {
        Routes.pop();
        Routes.pop();
        showMessage(message: response.reasonPhrase ?? "", type: "error");
      }
    } on ClientException catch (_, e) {
      debugPrint("Error $e");
    }
  }

  static Future<List<ContactsModel>> getUsers({String query = ""}) async {
    try {
      var headers = {
        'Authorization': 'Basic YnJ1bm9sYWJzMjU2KzE4QGdtYWlsLmNvbTp0ZXN0MTIz'
      };
      var request = Request('GET', Uri.parse('${Apis.contactList}?q=$query'));
      request.headers.addAll(headers);
      StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        return contactsModelFromJson(await response.stream.bytesToString());
      } else {
        return Future.error(response.reasonPhrase ?? "");
      }
    } on ClientException catch (_, e) {
      return Future.error("Error $e");
    }
  }

  // contacts
  static Future<List<dynamic>> getContactsList() async {
    StorageService storage = StorageService();
    var data = await storage.getData("user");
    try {
      var headers = {
        'Authorization': 'Basic YnJ1bm9sYWJzMjU2KzE4QGdtYWlsLmNvbTp0ZXN0MTIz'
      };
      var request = Request(
          'GET', Uri.parse("${Apis.allContacts}${data['user']['id']}/"));
      request.headers.addAll(headers);
      StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        var d = json.decode(await response.stream.bytesToString()) as List;
        return d;
      } else {
        return Future.error(response.reasonPhrase ?? "");
      }
    } on ClientException catch (_, e) {
      return Future.error("Error $e");
    }
  }

  static void createContactList(Map<String, dynamic> data) async {
    try {
      StorageService storage = StorageService();
      var d = await storage.getData("user");
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Basic YnJ1bm9sYWJzMjU2KzE2QGdtYWlsLmNvbTp0ZXN0MTIz'
      };
      data.put("user", d["user"]["id"]);
      var request = Request('POST', Uri.parse(Apis.createContact));
      request.body = json.encode(data);
      request.headers.addAll(headers);
      StreamedResponse response = await request.send();
      if (response.statusCode == 200 || response.statusCode == 201) {
        var d = json.decode(await response.stream.bytesToString());
        if (kDebugMode) {
          print(d);
        }
        showMessage(message: "Added new contact", type: "success");
        Routes.pop();
      } else {
        Routes.pop();
        showMessage(
          message: response.reasonPhrase ?? "Something went wrong",
        );
      }
    } on ClientException catch (_, e) {
      debugPrint("Error $e");
    }
  }
}
