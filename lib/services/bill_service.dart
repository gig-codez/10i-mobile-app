// ignore_for_file: use_build_context_synchronously

import "/exports/exports.dart";

import "dart:convert";

class BillService {
  // function to get bill types
  static Future<List<BillTypeModel>> getBillTypes() async {
    try {
      var headers = {
        'Authorization': 'Basic YnJ1bm9sYWJzMjU2KzE4QGdtYWlsLmNvbTp0ZXN0MTIz'
      };
      var request = Request(
        'GET',
        Uri.parse(Apis.getBillTypes),
      );

      request.headers.addAll(headers);
      StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var result = await response.stream.bytesToString();
        return billTypeModelFromJson(result);
      } else {
        return Future.error(response.reasonPhrase ?? "Something went wrong");
      }
    } on ClientException catch (_, e) {
      return Future.error("Error $e");
    }
  }

  // function to create a bill split
  void createBill(Map<String, dynamic> data) async {
    context.read<LoaderController>().isLoading = true;
    StorageService storage = StorageService();
    var u = await storage.getData("user");

    try {
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Basic YnJ1bm9sYWJzMjU2KzE4QGdtYWlsLmNvbTp0ZXN0MTIz'
      };
      var request = Request(
        'POST',
        Uri.parse(
          Apis.createBill,
        ),
      );
      request.body = json.encode({
        "owner": u["user"]["id"],
        "bill_type": data.get("billType"),
        "amount": data.get("amount"),
        "customer_id": '1',
        "split_bill": 'false',
        "fully_paid": 'false',
        "deposit_paid": 'false'
      });
      request.headers.addAll(headers);
      StreamedResponse response = await request.send();
      print("Status code ${response.statusCode}");
      if (response.statusCode == 200 || response.statusCode == 201) {
        context.read<LoaderController>().isLoading = false;
        var k = json.decode(await response.stream.bytesToString());
        showMessage(
          message: "Bill created successfully.",
          type: "success",
        );
        Routes.pushPageWithRouteAndAnimation(
          SplitBill(
            amount: data.get("amount"),
            billId: int.parse(
              k['id'].toString(),
            ),
          ),
        );
      } else {
        print(await response.stream.bytesToString());
        context.read<LoaderController>().isLoading = false;
        showMessage(message: "${response.reasonPhrase}", type: "error");
      }
    } on Exception catch (_, e) {
      context.read<LoaderController>().isLoading = false;
      return Future.error(_.toString());
    }
  }

  // function to update bill
  void updateBill(int billId, String money) async {
    showLoader(text: "Bill Splitting in prpgress..");
    try {
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Basic YnJ1bm9sYWJzMjU2KzE4QGdtYWlsLmNvbTp0ZXN0MTIz'
      };
      var request =
          Request('PUT', Uri.parse('${Apis.updateBill}$billId/update/'));
      request.body = json.encode({
        "split_bill": 'true',
      });
      request.headers.addAll(headers);

      StreamedResponse response = await request.send();

      if (response.statusCode == 200 || response.statusCode == 201) {
        debugPrint(await response.stream.bytesToString());
        Routes.pop();
        showMessage(message: "Bill split successfully");
        Routes.pushPageWithRouteAndAnimation(
          SplitSuccess(amount: money),
        );
      } else {
        Routes.pop();
        debugPrint(await response.stream.bytesToString());
        showMessage(
            message: "Error in bill splitting ${response.reasonPhrase}",
            type: "error");
      }
    } on Exception catch (_, e) {
      Routes.pop();
      debugPrint("Error $_");
    }
  }

  // fetching bills for a particular person
  Future<List<BillsModel>> getBills() async {
    try {
      var headers = {
        'Authorization': 'Basic YnJ1bm9sYWJzMjU2KzE4QGdtYWlsLmNvbTp0ZXN0MTIz'
      };
      StorageService storage = StorageService();
      var d = await storage.getData("user");
      var request =
          Request('GET', Uri.parse("${Apis.userBills}/${d['user']['id']}/"));
      request.headers.addAll(headers);
      StreamedResponse response = await request.send();
      if (response.statusCode == 200 || response.statusCode == 201) {
        return billsModelFromJson(await response.stream.bytesToString());
      } else {
        debugPrint(await response.stream.bytesToString());
        return Future.error(response.reasonPhrase ?? "");
      }
    } on Exception catch (_, e) {
      return Future.error("Error $_");
    }
  }

  Future<String> getBillName(int id) async {
    try {
      var headers = {
        'Authorization': 'Basic YnJ1bm9sYWJzMjU2KzE4QGdtYWlsLmNvbTp0ZXN0MTIz'
      };
      var request =
          Request('GET', Uri.parse('${Apis.getSingleBillType}${id}/'));
      request.headers.addAll(headers);
      StreamedResponse response = await request.send();
      if (response.statusCode == 200 || response.statusCode == 201) {
        String res = await response.stream.bytesToString();
        var result = json.decode(res);
        return BillTypeModel.fromJson(result).name;
      } else {
        return Future.error(response.reasonPhrase ?? "");
      }
    } on Exception catch (_, e) {
      return Future.error("Error $_");
    }
  }

// function to delete a bill
  void deleteBill(int billId) async {
    var headers = {
      'Authorization': 'Basic YnJ1bm9sYWJzMjU2KzE4QGdtYWlsLmNvbTp0ZXN0MTIz'
    };
    // first pop off the dialog box
    Routes.pop();
    // then show the loader
    showLoader(text: "Deleting Bill..");
    try {
      var request = Request(
        'DELETE',
        Uri.parse('${Apis.deleteBill}/$billId/delete/'),
      );
      request.headers.addAll(headers);
      StreamedResponse response = await request.send();
      if (response.statusCode == 200 || response.statusCode == 204) {
        Routes.pop();
        // String rs = (await response.stream.bytesToString());
        showMessage(message: "Bill deleted successfully", type: "success");
      } else {
        String rs = (await response.stream.bytesToString());
        print(rs);
        Routes.pop();
        showMessage(message: response.reasonPhrase ?? "", type: "error");
      }
    } on Exception catch (_, e) {
      debugPrint("Error $_");
    }
  }
}
