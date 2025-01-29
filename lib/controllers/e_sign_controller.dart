import 'dart:io';
import 'package:textomize/core/exports.dart';
import 'package:image_picker/image_picker.dart';
import '../screens/scanned_doc_view.dart';

class ESignPDFController extends GetxController {
  // Observables
  var scannedDocument = Rx<File?>(null);

  // Pick an image using the camera
  Future<void> openCamera() async {
    final ImagePicker picker = ImagePicker();
    Get.dialog(Center(child: CircularProgressIndicator()), barrierDismissible: false);
    try {
      final XFile? photo = await picker.pickImage(source: ImageSource.camera);
      if (photo != null) {
        scannedDocument.value = File(photo.path);
        Get.to(() => ScannedDocumentView());
      }
    } finally {
      Get.back(); 
    }
  }

  // Pick a PDF or image from the gallery
  Future<void> pickPDF() async {
    final ImagePicker picker = ImagePicker();
    Get.dialog(Center(child: CircularProgressIndicator()), barrierDismissible: false);
    try {
      final XFile? file = await picker.pickImage(source: ImageSource.gallery);
      if (file != null) {
        scannedDocument.value = File(file.path);
        Get.to(() => ScannedDocumentView());
      }
    } finally {
      Get.back(); 
    }
  }
}
