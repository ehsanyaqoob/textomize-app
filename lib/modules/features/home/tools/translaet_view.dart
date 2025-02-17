import 'package:textomize/controllers/scan_con.dart';
import 'package:textomize/core/exports.dart';

class TranslateTextView extends StatelessWidget {
  final TranslateTextController controller = Get.put(TranslateTextController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Translate Text',
        centerTitle: true,
        onLeadingPressed: () => Get.back(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20.0),

              // Heading
              simplifyText(
                text: 'Translate Text to your preferred language',
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryColor,
              ),

              const SizedBox(height: 20.0),

              // Translation Card
              Center(
                child: Container(
                  width: double.infinity,
                  height: 250.0,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.greenAccent.withOpacity(0.3),
                        Colors.green.withOpacity(0.1),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.green.withOpacity(0.1),
                        spreadRadius: 5,
                        blurRadius: 10,
                      ),
                    ],
                    border: Border.all(
                      color: Colors.green.withOpacity(0.8),
                      width: 1.5,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.edit_document, size: 100.0, color: Colors.green),
                      const SizedBox(height: 10),
                      simplifyText(
                        text: "Ready to translate?",
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.green[700],
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 30.0),

              // Subheading
              simplifyText(
                text: 'Choose one of the options below to continue.',
                fontSize: 16.0,
                color: Colors.grey[700],
              ),

              const SizedBox(height: 20.0),

              // Buttons
              SimplifyButton(
                title: 'Open Camera',
                topMargin: 10.0,
                fillColor: true,
                onTap: controller.openCamera,
              ),

              const SizedBox(height: 15.0),

              SimplifyButton(
                title: 'Pick PDF from Gallery',
                topMargin: 10.0,
                fillColor: true,
                onTap: controller.pickGalleryImage, 
              ),

              const SizedBox(height: 40.0),

              // Security Notice
              Center(
                child: Column(
                  children: [
                    simplifyText(
                      text: 'Your documents are secure.',
                      fontSize: 14.0,
                      color: Colors.grey[500],
                    ),
                    const SizedBox(height: 5),
                    Icon(Icons.lock_rounded, size: 20.0, color: Colors.grey[500]),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
