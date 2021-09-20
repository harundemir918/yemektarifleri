import 'dart:async';
import 'dart:io';

import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

class CameraPreviewScreen {
  final picker = ImagePicker();

  Future<File?> takePicture() async {
    final imageFile = await picker.pickImage(
      source: ImageSource.camera,
    );
    if (imageFile == null) {
      return null;
    }
    final dir = await getTemporaryDirectory();
    final uniqueID = Uuid().v1();
    final imgExtension = extension(imageFile.path);
    var result = await FlutterImageCompress.compressAndGetFile(
      imageFile.path,
      "${dir.path}/${uniqueID}_compressed$imgExtension",
      quality: 50,
    );
    return result;
  }
}
