import 'package:flutter/material.dart';

import '../Model/signDetail.dart';
import 'database.dart';


Future<List<SignDetail>> fetchDetailFromDatabase() async {
  //var dbHelper = DbHelper();
  final dbhelp = DbHelper.instance;
  Future<List<SignDetail>> detail = dbhelp.getUserDetail();
  //dbhelp.getDetail();
  return detail;
}

class DetailList extends StatefulWidget {
  @override
  MyDetailState createState() => MyDetailState();
}

class MyDetailState extends State<DetailList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Stored'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: FutureBuilder<List<SignDetail>>(
          future: fetchDetailFromDatabase(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:  <Widget>[
                          Text(snapshot.data![index].email,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18.0)),
                          Text(snapshot.data![index].firstname,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14.0)),
                          Divider()
                        ]);
                  });
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return Container(alignment: AlignmentDirectional.center,child: new CircularProgressIndicator(),);
          },
        ),
      ),

    );

  }
}