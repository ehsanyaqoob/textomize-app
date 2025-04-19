import 'package:textomize/models/ai_services.dart';

import '../core/exports.dart';

class SmartAiController extends GetxController {
  final services = <AiService>[].obs;

  @override
  void onInit() {
    services.addAll([
      AiService(
        title: "CNIC Scanner",
        description: "Scan and extract info from CNICs using AI.",
        icon: Icons.perm_identity,
        onTap: () {
          Get.to(CnicScannerView());
        },
      ),
      AiService(
        title: "Document Reader",
        description: "Understand documents with AI-based OCR.",
        icon: Icons.description,
        onTap: () {
          Get.to(CnicScannerView());
        },
      ),
      AiService(
        title: "Text Summarizer",
        description: "Summarize long text using Smart AI.",
        icon: Icons.summarize,
        onTap: () {
          Get.to(CnicScannerView());
        },
      ),
      AiService(
        title: "QR/Barcode Scanner",
        description: "Read and analyze codes with intelligence.",
        icon: Icons.qr_code_scanner,
        onTap: () {
          Get.to(CnicScannerView());
        },
      ),
      AiService(
        title: "Chat Assistant",
        description: "Ask anything from your personal assistant.",
        icon: Icons.chat_bubble_outline,
        onTap: () {
          Get.to(CnicScannerView());
        },
      ),
    ]);
    super.onInit();
  }
}

class CnicScannerView extends StatelessWidget {
  const CnicScannerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("CNIC Scanner")),
      body: const Center(
        child: Text("CNIC Scanner Coming Soon..."),
      ),
    );
  }
}
