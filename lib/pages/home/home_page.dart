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
        title: const Text('User Posts'),
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
                  ListTile(
                    title: Column(
                      children: [
                        Text('Total: ${providerT.dataModel!.total}'),
                        Text('Skips: ${providerT.dataModel!.skip}'),
                        Text('Limit: ${providerT.dataModel!.limit}'),
                      ],
                    ),
                  ),
                  ...List.generate(
                    providerT.dataModel!.postList.length,
                    (index) => ListTile(
                      // id, user id
                      leading: Column(
                        children: [
                          Text(
                            '${providerT.dataModel!.postList[index].id}',
                          ),
                          Text(
                            '${providerT.dataModel!.postList[index].userId}',
                          ),
                        ],
                      ),
                      // title
                      title: Text(
                        overflow: TextOverflow.ellipsis,
                        providerT.dataModel!.postList[index].title,
                      ),

                      // body, tags
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            overflow: TextOverflow.ellipsis,
                            providerT.dataModel!.postList[index].body,
                          ),
                          Text(
                            overflow: TextOverflow.ellipsis,
                            '# ${providerT.dataModel!.postList[index].tags.join(', ')}',
                          ),
                        ],
                      ),

                      // reactions, view
                      trailing: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            overflow: TextOverflow.ellipsis,
                            'L: ${providerT.dataModel!.postList[index].reactions.likes.toString()}',
                          ),
                          Text(
                            overflow: TextOverflow.ellipsis,
                            'D: ${providerT.dataModel!.postList[index].reactions.dislikes.toString()}',
                          ),
                          Text(
                            overflow: TextOverflow.ellipsis,
                            'V: ${providerT.dataModel!.postList[index].views.toString()}',
                          ),
                        ],
                      ),
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
