import 'package:image_picker/image_picker.dart';

class PFImagePicker {
  static final ImagePicker _picker = ImagePicker();

  ///拍照
  static Future takePhoto() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    return image;
  }

  ///打开相册
  static Future openPhotoAlbum() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    return image;
  }
}
