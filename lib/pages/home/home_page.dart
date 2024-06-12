import 'package:flutter/material.dart';
import 'package:flutter_json_parsing/providers/data_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    Provider.of<DataProvider>(context, listen: false).convertJsonToString();
    Provider.of<DataProvider>(context, listen: false).convertToDataModel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    DataProvider provider = Provider.of<DataProvider>(context);

    return Scaffold(

      appBar: AppBar(
        title: const Text('User Posts Data'),
        elevation: 4,
        shadowColor: Colors.grey.withOpacity(0.5),
      ),


      body: ListView(
        children: [
          ListTile(
            title: Text('${provider.dataModel!.total}',),)
        ],
      ),

    );
  }
}
