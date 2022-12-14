import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:text_project/data/data_source/storage_helper.dart';
import 'package:text_project/domain/repository/storage_repo.dart';

class FirebaseStorageRepoImpl implements FirebaseStorageRepo {
  final FirebaseStorageHelper _helper;
  FirebaseStorageRepoImpl({required FirebaseStorageHelper helper})
      : _helper = helper;

  @override
  Future<String> uploadFile(String path, File file) async {
    return _helper.uploadFile(path, file);
  }

  @override
  Future<String> getDownloadUrl(String path) async {
    return _helper.getDownloadUrl(path);
  }

  @override
  Future<void> deleteFile(String path) async {
    return _helper.deleteFile(path);
  }

  @override
  Future<Map<String, Image?>> getUserPhotos(List<String> uids) async {
    return _helper.getUserPhotos(uids);
  }

  @override
  Future<void> updateUserPhoto(Uint8List photo) async {
    return _helper.updateUserPhoto(photo);
  }

  @override
  Future<void> deleteUserPhoto() async {
    return _helper.deleteUserPhoto();
  }
}
