// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NoteItem _$$_NoteItemFromJson(Map<String, dynamic> json) => _$_NoteItem(
      word: json['word'] as String,
      isFavorite: json['isFavorite'] as bool,
      meanings:
          (json['meanings'] as List<dynamic>).map((e) => e as String).toList(),
      savedAt: DateTime.parse(json['savedAt'] as String),
    );

Map<String, dynamic> _$$_NoteItemToJson(_$_NoteItem instance) =>
    <String, dynamic>{
      'word': instance.word,
      'isFavorite': instance.isFavorite,
      'meanings': instance.meanings,
      'savedAt': instance.savedAt.toIso8601String(),
    };
