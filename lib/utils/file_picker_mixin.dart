import 'dart:io';

import 'package:image_picker/image_picker.dart';

mixin FilePickerMixin {
  Future<void> pickImage(
      {ImageSource? source, required Function(File) onImageSelect}) async {
    try {
      final ImagePicker imagePicker = ImagePicker();

      final pickedImage = await imagePicker.pickImage(
        source: source ?? ImageSource.gallery,
      );

      if (pickedImage != null) {
        File imageFile = File(pickedImage.path);
        onImageSelect(imageFile);
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
