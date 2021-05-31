// import 'dart:html';

import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart';
import 'package:measurementapp/api/api_requests.dart';
import 'package:measurementapp/api/models.dart';

class DataShowPage extends StatefulWidget {
  Future<String> url;
  DataShowPage({required this.url});
  @override
  _DataShowPageState createState() => _DataShowPageState();
}

class _DataShowPageState extends State<DataShowPage> {
  Future<MeasurementData>? futuredata;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(this.widget.url.toString());
    futuredata = getdata(this.widget.url.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("measurement"),
      ),
      body: Center(
        child: FutureBuilder<MeasurementData>(
          future: futuredata,
          builder: (context, AsyncSnapshot<MeasurementData> snapshot) {
            return GridView.builder(
              itemCount:
                  snapshot.hasData ? snapshot.data!.d.toJson().length : 0,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1, childAspectRatio: 3),
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(snapshot.data!.d
                        .toJson()
                        .entries
                        .elementAt(index)
                        .key
                        .toString()),
                    subtitle: Text(snapshot.data!.d
                        .toJson()
                        .entries
                        .elementAt(index)
                        .value
                        .toString()),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
