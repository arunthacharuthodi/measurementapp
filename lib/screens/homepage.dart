import 'dart:convert';

import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:measurementapp/api/models.dart';
import 'package:measurementapp/screens/datashowingpage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  File? _image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("measurement"),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                child: Text(_image == null ? "Select image" : _image!.path),
              ),
              RaisedButton(
                onPressed: () async {
                  getImage();
                },
                child: Text("Select image"),
              ),
              RaisedButton(
                onPressed: () async {
                  final ref =
                      FirebaseStorage.instance.ref().child("${_image!.path}");
                  ref.putFile(File(_image!.path)).whenComplete(() {
                    var url = ref.child(_image!.path).getDownloadURL();
                    print(url);
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => DataShowPage(
                              url: url,
                            )));
                  });
                },
                child: Text("upload image"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
