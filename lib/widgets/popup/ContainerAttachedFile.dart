import 'dart:convert';
import 'dart:io';
import 'package:async/async.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mn_consultant/api/my_api.dart';
import 'package:path/path.dart';
import 'package:mn_consultant/globals/globals.dart' as globals;
import 'package:mn_consultant/widgets/button/myButton.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:http/http.dart' as http;

var file;
var filepath;
var contratId;


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
                SharedPreferences localStorage = await SharedPreferences.getInstance();
                contratId= localStorage.getString('contrat_Id');
                selectFile();
                setState(() {
                 globals.filePicked;
               });
              }, icon: Icon(Icons.attach_file), iconSize: 48),
              Text('File Name: ${globals.filePicked}'),

              Padding(
                padding: const EdgeInsets.all(38.0),
                child: myButton(btnText: "Submit",
                  onPress:(){
                    uploadFile('file', File('${filepath}'));
                  } ,
                  ),
              ),


            ]
        ),
      ),
    );
  }

  Future selectFile() async {
    final result=await FilePicker.platform.pickFiles();
    if(result==null)return;
    file = result.files.first;
    filepath=file.path;
    globals.filePicked=file.name;
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
uploadFile(String title, File file) async {
  //edit
// open a bytestream
  var stream = http.ByteStream(DelegatingStream.typed(file.openRead()));
  var length = await file.length();


  // var uri = Uri.parse(
  //     "http://127.0.0.1/moonLighters_php/Demo/Control/(Control)uploadFile.php");
  // var request = new http.MultipartRequest("POST", uri);
  // var multipartFile = new http.MultipartFile('file', stream, length,
  //     filename: basename(file.path));
  var request= await CallApi().uploadFileRequest();

  var multipartFile = new http.MultipartFile(title, stream, length,
      filename: basename(file.path));

  request.fields["version"] = globals.version;
  request.fields["contratId"] = contratId;
  request.files.add(multipartFile);

  // send
  var response = await request.send();
  print(response.statusCode);

  // listen for response
  response.stream.transform(utf8.decoder).listen((value) {
    print(value);
  });
}
