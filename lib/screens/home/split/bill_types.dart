import "/exports/exports.dart";

class BillTypesPage extends StatefulWidget {
  final List<BillTypeModel> billTypes;
  final ValueChanged<Map<String,dynamic>> onSelect;
  const BillTypesPage(
      {super.key, required this.billTypes, required this.onSelect});

  @override
  State<BillTypesPage> createState() => _BillTypesPageState();
}

class _BillTypesPageState extends State<BillTypesPage> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding:const EdgeInsets.fromLTRB(15,8,15,8),
        itemCount: widget.billTypes.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(widget.billTypes[index].name),
            subtitle: Text(widget.billTypes[index].description),
            onTap: () {
              setState(() {
                widget.onSelect({"value":widget.billTypes[index].id,"label":widget.billTypes[index].name});
              });
              Routes.pop();
            },
          );
        });
  }
}
