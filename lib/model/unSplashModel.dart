import 'package:json_annotation/json_annotation.dart';

part 'unSplashModel.g.dart';

@JsonSerializable()
class UnSplashUser{


  UnSplashUser(this.id, this.username, this.name, this.profileImage);

  factory UnSplashUser.fromJson(Map<String, dynamic> json) => _$UnSplashUserFromJson(json);

  Map<String, dynamic> toJson() => _$UnSplashUserToJson(this);

  final String id;
  final String username;
  final String name;

  @JsonKey(name: 'profile_image')
  final Map<String,String> profileImage;



}


@JsonSerializable()
class Photo{


  Photo(this.id, this.updatedAt, this.width, this.height, this.color,
      this.downloads, this.likes, this.description, this.tags, this.urls,
      this.links, this.user);



  factory Photo.fromJson(Map<String, dynamic> json) => _$PhotoFromJson(json);

  Map<String, dynamic> toJson() => _$PhotoToJson(this);



  final String id;
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;
  final int width;
  final int height;
  final String color;
  final int downloads;
  final int likes;
  final String description;
  final List<Map<String,String>>tags; // an array of maps
  final Map<String,String>urls; // a map of strings
  final Map<String,String>links; // a map of strings
  final UnSplashUser user;


}