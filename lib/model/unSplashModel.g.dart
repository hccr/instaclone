// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unSplashModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UnSplashUser _$UnSplashUserFromJson(Map<String, dynamic> json) {
  return UnSplashUser(
    json['id'] as String,
    json['username'] as String,
    json['name'] as String,
    (json['profile_image'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

Map<String, dynamic> _$UnSplashUserToJson(UnSplashUser instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'name': instance.name,
      'profile_image': instance.profileImage,
    };

Photo _$PhotoFromJson(Map<String, dynamic> json) {
  return Photo(
    json['id'] as String,
    json['updated_at'] == null
        ? null
        : DateTime.parse(json['updated_at'] as String),
    json['width'] as int,
    json['height'] as int,
    json['color'] as String,
    json['downloads'] as int,
    json['likes'] as int,
    json['description'] as String,
    (json['tags'] as List)
        ?.map((e) => (e as Map<String, dynamic>)?.map(
              (k, e) => MapEntry(k, e as String),
            ))
        ?.toList(),
    (json['urls'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    (json['links'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    json['user'] == null
        ? null
        : UnSplashUser.fromJson(json['user'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PhotoToJson(Photo instance) => <String, dynamic>{
      'id': instance.id,
      'updated_at': instance.updatedAt?.toIso8601String(),
      'width': instance.width,
      'height': instance.height,
      'color': instance.color,
      'downloads': instance.downloads,
      'likes': instance.likes,
      'description': instance.description,
      'tags': instance.tags,
      'urls': instance.urls,
      'links': instance.links,
      'user': instance.user,
    };
