import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class MediaService{
  MediaService(){}

  Future<PlatformFile?> pickImageFromLibrary() async{
    FilePickerResult? _result =
        await FilePicker.platform.pickFiles(type: FileType.image);
    if(_result!=null){
      return _result.files[0];
    }
    return null;
  }
}