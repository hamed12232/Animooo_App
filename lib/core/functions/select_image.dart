import 'dart:developer';
import 'dart:io';

import 'package:image_picker/image_picker.dart';

Future<void> selectImage(File? imageFile) async {
      try {
      final ImagePicker picker = ImagePicker();
      XFile? image = await picker.pickImage(source: ImageSource.camera);
      if (image != null) {
        imageFile = File(image.path);
      }
    } catch (e) {
      // Handle camera permission denied or other errors
      log('Error picking image: $e');
      // You might want to emit an error state here
    }
  }