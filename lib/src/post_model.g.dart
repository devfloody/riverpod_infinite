// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Post _$$_PostFromJson(Map<String, dynamic> json) => _$_Post(
      title: json['sr'] as String,
      body: json['en'] as String,
      author: json['author'] as String,
      rating: json['rating'] as int,
    );

Map<String, dynamic> _$$_PostToJson(_$_Post instance) => <String, dynamic>{
      'sr': instance.title,
      'en': instance.body,
      'author': instance.author,
      'rating': instance.rating,
    };
