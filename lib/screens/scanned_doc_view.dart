import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/scan_con.dart';

class ScannedDocumentView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TranslateTextController controller = Get.find<TranslateTextController>();

    return Scaffold(
      appBar: AppBar(title: const Text('Scanned Document')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),

            // Display scanned document
            controller.scannedDocument.value != null
                ? Expanded(
                    child: Image.file(
                      controller.scannedDocument.value!,
                      fit: BoxFit.contain,
                    ),
                  )
                : const Text("No document found", style: TextStyle(fontSize: 16)),

            const SizedBox(height: 20),

            // Display extracted text
            Obx(() => Text(
                  controller.extractedText.value.isNotEmpty
                      ? "Extracted Text:\n${controller.extractedText.value}"
                      : "No text detected",
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                )),

            const SizedBox(height: 20),

            // Language selection dropdown
            DropdownButton<String>(
              hint: const Text("Select Language"),
              value: null, // Default to no selection
              items: [
                DropdownMenuItem(value: "en", child: Text("English")),
                DropdownMenuItem(value: "es", child: Text("Spanish")),
                DropdownMenuItem(value: "fr", child: Text("French")),
                DropdownMenuItem(value: "de", child: Text("German")),
                DropdownMenuItem(value: "ur", child: Text("Urdu")),
              ],
              onChanged: (selectedLanguage) {
                if (selectedLanguage != null) {
                  controller.translateText(selectedLanguage);
                }
              },
            ),

            const SizedBox(height: 20),

            // Display translated text
            Obx(() => Text(
                  controller.translatedText.value.isNotEmpty
                      ? "Translated Text:\n${controller.translatedText.value}"
                      : "Translation will appear here",
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                )),
          ],
        ),
      ),
    );
  }
}
