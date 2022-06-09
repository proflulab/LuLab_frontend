import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import '../../common/values/values.dart';

class PFImageCropper {
  //剪裁
  static cropImage(imageFile) async {
    CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: imageFile.path,
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
      ],
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: '裁剪',
          toolbarColor: Colors.black87,
          toolbarWidgetColor: Colors.white,
          initAspectRatio: CropAspectRatioPreset.square,
          //lockAspectRatio: false,
          cropFrameStrokeWidth: 10,
          cropFrameColor: PFc.themeColor,
          cropGridColor: PFc.themeColor,
          statusBarColor: PFc.themeColor,
          activeControlsWidgetColor: PFc.themeColor,
          //backgroundColor: PFc.themeColor,
          //dimmedLayerColor: PFc.themeColor,
        ),
        IOSUiSettings(
          title: '裁剪',
        ),
      ],
    );
    return croppedFile;
  }
}
