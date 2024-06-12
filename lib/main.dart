
import 'package:flutter/material.dart';
import 'package:flutter_json_parsing/pages/home/home_page.dart';
import 'package:flutter_json_parsing/providers/data_provider.dart';
import 'package:provider/provider.dart';


void main(){

  runApp(
    ChangeNotifierProvider(create: (context) => DataProvider(),
    child: const JsonDataApp(),),
  );

}


class JsonDataApp extends StatelessWidget {
  const JsonDataApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
