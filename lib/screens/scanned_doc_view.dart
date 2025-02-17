import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/e_sign_controller.dart';

class ScannedDocumentView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ESignPDFController controller = Get.find<ESignPDFController>();

    return Scaffold(
      appBar: AppBar(title: Text('Scanned Document')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 20),

          // Display scanned document
          controller.scannedDocument.value != null
              ? Expanded(
                  child: Image.file(
                    controller.scannedDocument.value!,
                    fit: BoxFit.contain,
                  ),
                )
              : Text("No document found"),

          SizedBox(height: 20),

          // Display extracted text
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Obx(() => Text(
              controller.extractedText.value.isNotEmpty
                  ? "Extracted Text:\n${controller.extractedText.value}"
                  : "No text detected",
              style: TextStyle(fontSize: 16),
            )),
          ),
        ],
      ),
    );
  }
}