import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/e_sign_controller.dart';

class ScannedDocumentView extends StatelessWidget {
  final ESignPDFController controller = Get.find<ESignPDFController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Scanned Document')),
      body: Center(
        child: Obx(() {
          final document = controller.scannedDocument.value;

          if (document == null) {
            return Text('No document scanned!');
          }

          return document.path.endsWith('.pdf')
              ? Text('PDF Display Logic Here') 
              : Image.file(document);
        }),
      ),
    );
  }
}
