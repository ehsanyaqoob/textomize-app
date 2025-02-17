import 'dart:io';
import 'package:get/get.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:image_picker/image_picker.dart';
import '../screens/scanned_doc_view.dart';
import 'package:textomize/core/exports.dart';
class ESignPDFController extends GetxController {
  var scannedDocument = Rx<File?>(null);
  var extractedText = ''.obs; // Store recognized text

  Future<void> openCamera() async {
    final ImagePicker picker = ImagePicker();
    Get.dialog(Center(child: CircularProgressIndicator()), barrierDismissible: false);

    try {
      final XFile? photo = await picker.pickImage(source: ImageSource.camera);
      if (photo != null) {
        scannedDocument.value = File(photo.path);

        // Extract text
        await _extractTextFromImage(scannedDocument.value!);

        await Future.delayed(Duration(milliseconds: 500));
        Get.off(() => ScannedDocumentView());
      }
    } finally {
      Get.back();
    }
  }

  Future<void> pickPDF() async {
    final ImagePicker picker = ImagePicker();
    Get.dialog(Center(child: CircularProgressIndicator()), barrierDismissible: false);

    try {
      final XFile? file = await picker.pickImage(source: ImageSource.gallery);
      if (file != null) {
        scannedDocument.value = File(file.path);

        // Extract text
        await _extractTextFromImage(scannedDocument.value!);

        await Future.delayed(Duration(milliseconds: 500));
        Get.off(() => ScannedDocumentView());
      }
    } finally {
      Get.back();
    }
  }

  Future<void> _extractTextFromImage(File imageFile) async {
    final textRecognizer = TextRecognizer();
    final inputImage = InputImage.fromFile(imageFile);
    final RecognizedText recognizedText = await textRecognizer.processImage(inputImage);

    extractedText.value = recognizedText.text; // Save extracted text
    textRecognizer.close();
  }
}
