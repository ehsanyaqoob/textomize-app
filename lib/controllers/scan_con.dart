import 'dart:io';
import 'package:get/get.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:image_picker/image_picker.dart';
import 'package:translator/translator.dart';
import '../core/exports.dart';
import '../screens/scanned_doc_view.dart';

class TranslateTextController extends GetxController {
  var scannedDocument = Rx<File?>(null);
  var extractedText = ''.obs; // Store recognized text
  var translatedText = ''.obs; // Store translated text
  final TextRecognizer textRecognizer = TextRecognizer(); // Keep single instance

  /// Open Camera to capture image
  Future<void> openCamera() async => await _pickImage(ImageSource.camera);

  /// Pick Image from Gallery
  Future<void> pickGalleryImage() async => await _pickImage(ImageSource.gallery);

  /// Pick an image and process text extraction
  Future<void> _pickImage(ImageSource source) async {
    final ImagePicker picker = ImagePicker();
    Get.dialog(const Center(child: CircularProgressIndicator()), barrierDismissible: false);

    try {
      final XFile? photo = await picker.pickImage(source: source);
      if (photo != null) {
        scannedDocument.value = File(photo.path);

        // Extract text from image before navigating
        await _extractTextFromImage(scannedDocument.value!);

        // Navigate to ScannedDocumentView only if text extraction is successful
        if (extractedText.value.isNotEmpty) {
          Get.off(() => ScannedDocumentView());
        } else {
          Get.snackbar("Error", "No text found in the image!");
        }
      }
    } catch (e) {
      Get.snackbar("Error", "Failed to pick image: $e");
    } finally {
      Get.back(); // Remove loading indicator
    }
  }

  /// Extract text from an image using Google ML Kit
  Future<void> _extractTextFromImage(File imageFile) async {
    try {
      final inputImage = InputImage.fromFile(imageFile);
      final RecognizedText recognizedText = await textRecognizer.processImage(inputImage);

      extractedText.value = recognizedText.text.trim(); // Trim extra spaces
    } catch (e) {
      Get.snackbar("Error", "Failed to extract text: $e");
    }
  }

  /// Translate the extracted text
  Future<void> translateText(String targetLanguage) async {
    if (extractedText.value.isNotEmpty) {
      try {
        final translator = GoogleTranslator();
        final translation = await translator.translate(extractedText.value, to: targetLanguage);
        translatedText.value = translation.text;
      } catch (e) {
        Get.snackbar("Error", "Translation failed: $e");
      }
    } else {
      Get.snackbar("Error", "No text available for translation.");
    }
  }

  /// Clean up resources
  @override
  void onClose() {
    textRecognizer.close();
    super.onClose();
  }
}
