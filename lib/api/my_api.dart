import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mn_consultant/globals/globals.dart' as globals;


class CallApi{
  final String _url = globals.myIP;
  final String _imgUrl='http://mark.dbestech.com/uploads/';
  getImage(){
    return _imgUrl;
  }
  postData(data, apiUrl) async {
    var fullUrl = _url + apiUrl + await _getToken() ;
    print(fullUrl);
    return await http.post(   //post request
        Uri.parse(fullUrl),
        body: jsonEncode(data),
        headers: _setHeaders()
    );
  }
  getData(apiUrl) async {
    var fullUrl = _url + apiUrl + await _getToken();
    return await http.get(
        Uri.parse(fullUrl),
        headers: _setHeaders()
    );
  }

  _setHeaders() => {
    'Content-type' : 'application/json',
    'Accept' : 'application/json',

  };

  _getToken() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token = localStorage.getString('token');
    return '?token=$token';
  }


  getArticles(apiUrl) async {

  }
  getPublicData(apiUrl) async {

  }

  uploadFileRequest(){
    var uri = Uri.parse(
        "${_url}/Demo/Control/(Control)uploadFile.php");
    var request = new http.MultipartRequest("POST", uri);
    return request;

  }

}