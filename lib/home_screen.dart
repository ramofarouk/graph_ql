import 'dart:io';

import 'package:flutter/material.dart';
import 'package:graph_ql/headphone.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'graphql/graphql_config.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    getData();
  }

  List<HeadPhone> headphoneList = [];

  getData() async {
    String query = '''
query{
  headphones{

    image
  }
}
''';
    GraphQLService service = GraphQLService();
    try {
      QueryResult result = await service.performQuery(query);
      print(result.data!['headphones']);
      setState(() {
        headphoneList = (result.data!['headphones'] as List).map((e) {
          return HeadPhone.fromJson(e);
        }).toList();
      });
    } on SocketException catch (exeption) {
      print(exeption);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: headphoneList.length,
          itemBuilder: (context, index) {
            HeadPhone headPhone = headphoneList[index];

            return Column(
              children: [
                Card(
                  child: Container(
                    height: MediaQuery.of(context).size.height / 5,
                    width: MediaQuery.of(context).size.width,
                    child: Image(
                        image: NetworkImage(
                            'http://192.168.43.122:8000${headPhone.image}')),
                  ),
                ),
                SizedBox(
                  height: 15,
                )
              ],
            );
          }),
    );
  }
}
