import 'dart:async';
import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:insta_clone/model/unSplashModel.dart';

const String _clientId = "YOUR_API_KEY";
const String _endpoint = "api.unsplash.com";

class UnSplashService {
  factory UnSplashService() {
    return _singleton;
  }
  UnSplashService._internal();

  static final UnSplashService _singleton = new UnSplashService._internal();



  Future<UnSplashUser> getUser(String username) async {
    try {

      var uri = Uri.https(_endpoint, "/users/$username");

      final response = await http.get(uri,
          headers: {HttpHeaders.authorizationHeader: " Client-ID $_clientId "});
      if(response.statusCode == 200){
        Map userMap = jsonDecode(response.body);
        return UnSplashUser.fromJson(userMap);
      }




    } catch (e) {
      // No specified type, handles all
      print('Something really unknown: $e');
    }
    return null;
  }

  Future<Photo> getRandomPhoto() async {
    try {
      var uri = Uri.https(_endpoint, '/photos/rando');
      final response = await http.get(uri,
          headers: {HttpHeaders.authorizationHeader: " Client-ID $_clientId "});
      if(response.statusCode == 200){
        Map photoMap = jsonDecode(response.body);
        return Photo.fromJson(photoMap);
      }

    } catch (e) {
      // No specified type, handles all
      print('Something really unknown: $e');
    }
    return null;
  }

  Future<List<Photo>> getPhotos({int bulkSize=10, int page = 1}) async {

    try {
      Map<String, String> queryParam = {
        'order_by':'latest',
        'page':page.toString(),
        'per_page':bulkSize.toString()
      };

      var uri = Uri.https(_endpoint, '/photos', queryParam);


      final response = await http.get(uri,
          headers: {HttpHeaders.authorizationHeader: " Client-ID $_clientId "});
      if(response.statusCode == 200){
        Iterable l = json.decode(response.body);
        List<Photo> photoList = l.map((model)=> Photo.fromJson(model)).toList();

        return photoList;
      }

    } catch (e) {
      // No specified type, handles all
      print('Something really unknown: $e');
    }
    return null;
  }



}
