import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_json_parsing/providers/data_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    DataProvider providerT = Provider.of<DataProvider>(context);
    DataProvider providerF = Provider.of<DataProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text('User Posts Data'),
        elevation: 4,
        shadowColor: Colors.grey.withOpacity(0.5),
      ),
      body: FutureBuilder<String>(
        future: rootBundle.loadString('assets/json/json_data.json'),
        builder: (context, snapshot) {
          if (snapshot.data != null) {
            Map data = jsonDecode(snapshot.data!);
            providerF.convertToDataModel(data);
            return Center(
              child: ListView(
                children: [
                  ...List.generate(
                    providerT.dataModel!.postList.length,
                    (index) => ListTile(
                      title: Text(
                          'ID: ${providerT.dataModel!.postList[index].id}'),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return const Center(child: CupertinoActivityIndicator());
          }
        },
      ),
    );
  }
}
