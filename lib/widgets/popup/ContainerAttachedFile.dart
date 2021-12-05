

import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http_parser/http_parser.dart';
import 'package:mn_consultant/api/my_api.dart';
import 'package:path/path.dart';
import 'package:mn_consultant/globals/globals.dart' as globals;
import 'package:mn_consultant/widgets/button/myButton.dart';
import 'package:sizer/sizer.dart';
import 'package:http/http.dart' as http;

File? _file;
PlatformFile? _platformFile;


class ContainerAttachedFile extends StatefulWidget {
  const ContainerAttachedFile({Key? key}) : super(key: key);

  @override
  _ContainerAttachedFileState createState() => _ContainerAttachedFileState();
}

class _ContainerAttachedFileState extends State<ContainerAttachedFile> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.5)),
      content: Container(
        height: 15.6.h, //300
        width: 53.1.w, //400
        child: ListView(
            padding: EdgeInsets.all(8.0),
            children: [
              IconButton(onPressed:()async {
                selectFile();
              //   setState(() {
              //     globals.filePicked;
              // });
              }, icon: Icon(Icons.attach_file), iconSize: 48),
              //Text('File Name: ${globals.filePicked}'),

              Padding(
                padding: const EdgeInsets.all(38.0),
                child: myButton(btnText: "Submit",
                  onPress:(){
                  //_fileUpload();
                  } ,
                  ),
              ),


            ]
        ),
      ),
    );
  }

  Future selectFile() async {
    final file = await FilePicker.platform.pickFiles(
        type: FileType.custom
    );

    if (file != null) {
      setState(() {
        _file = File(file.files.single.path!); // file
        print(_file);
        _platformFile = file.files.first; //platformfile
        print(_platformFile);

      });
    }
  }



  //Future<void> _filePicker() async {

    // result= await FilePicker.platform.pickFiles(
    //   type: FileType.custom,
    //   allowedExtensions: ['txt', 'pdf', 'mp4'],
    //   //allowed extension to choose
    // );
    //
    // if (result!= null) {
    //   var cc=result!.files.single.path; //get the path of the choosen file
    //   globals.filePicked=cc;
    //   selectedfile = File(cc!);
    // print(cc);
    // print(selectedfile);
    // }

//     FilePickerResult? result = await FilePicker.platform.pickFiles();
//     if (result == null) return;
//   print(result);
//      file = result.files.first;
// //now do something with file selected
//   print(file); //PlatformFile(path C:\Users\Dana\Desktop\ttttt.txt, name: ttttt.txt,
//               // bytes: null, readStream: null, size: 0)
//     pathFile=file!.path;
//   }
  void uploadFileToServer(File imagePath) async {
    var request = new http.MultipartRequest(
        "POST", Uri.parse('http://127.0.0.1/moonLighters/Demo/Control/(Control)fileUpload.php'));
    request.fields['name'] = 'Rohan';
    request.fields['title'] = 'My first image';
    request.files.add(await http.MultipartFile.fromPath('profile_pic', imagePath.path));
    request.send().then((response) {
      http.Response.fromStream(response).then((onValue) {
        try {
          // get your response here...
        } catch (e) {
          // handle exeption
        }
      });
    });
  }



    // if (file == null) return;
    //
    // final fileName = basename(file!.path);
    // final destination = file!.path;
    //
    // FormData formData =
    // new FormData.fromMap(
    //     {"file":await MultipartFile.fromFile(
    //         destination,
    //     filename:fileName,
    //     contentType: MediaType("image", fileName.split(".").last))
    //     });
    //
    // var res = await CallApi()
    //     .postData(formData, 'Demo/Control/(Control)fileUpload.php');

    // var data = {
    //   'version': globals.version,
    //   'file':globals.selectedFile,
    // };

    // FormData formData =
    // new FormData.fromMap(
    //     {"file":await MultipartFile.fromFile(
    //     selectedfile!.path,
    //     filename: basename(selectedfile!.path),
    //     headers: _setHeaders())
    //     });

    // //multipart/form-data
    // var response = await Dio().post("http://127.0.0.1/moonLighters/Demo/Control/(Control)fileUpload.php",
    //   data: formData
    //     );
    // onSendProgress: (int sent, int total) {
    //   String percentage = (sent/total*100).toStringAsFixed(2);
    //   setState(() {
    //     var progress = "$sent" + " Bytes of " "$total Bytes - " +  percentage + " % uploaded";
    //     //update the progress
    //   });
    // },


  // Future<void>  _fileUpload(String filename) async {
  //     var request = http.MultipartRequest('POST',
  //         Uri.parse("http://127.0.0.1/moonLighters/Demo/Control/(Control)fileUpload.php"));
  //     request.files.add(
  //         http.MultipartFile(
  //             'file',
  //             File(filename).readAsBytes().asStream(),
  //             File(filename).lengthSync(),
  //             filename: filename.split("/").last
  //         )
  //     );
  //
  //     var res = await request.send();
  //     print("BBBBBBBBBBBBBBBBBBBBBB");
  //
  //
  //   }
  // void _uploadFile(filePath) async {
  //   // Get base file name
  //   String fileName = basename(filePath.path);
  //   print("File base name: $fileName");
  //
  //   try {
  //     FormData formData =
  //     new FormData.from({"file": new UploadFileInfo(filePath, fileName)});
  //
  //     Response response =
  //     await Dio().post("http://127.0.0.1/saveFile.php", data: formData);
  //     print("File upload response: $response");
  //
  //     // Show the incoming message in snakbar
  //   } catch (e) {
  //     print("Exception Caught: $e");
  //   }
  // }
  // _setHeaders() => {
  //   'Content-type' : 'multipart/form-data',
  //   'Accept' : 'application/json'
  // };
  }

