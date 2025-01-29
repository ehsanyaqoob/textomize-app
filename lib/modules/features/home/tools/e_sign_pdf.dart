
import 'package:textomize/controllers/e_sign_controller.dart';
import 'package:textomize/core/exports.dart';

class ESignPDFView extends StatelessWidget {
  final ESignPDFController controller = Get.put(ESignPDFController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'E-Sign PDF',
        centerTitle: true,
        onLeadingPressed: () {
          Get.back();
        },
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.0),
              simplifyText(
                text: 'Sign your PDF document electronically',
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryColor,
              ),
              SizedBox(height: 20.0),
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
                      Icon(
                        Icons.edit_document,
                        size: 100.0,
                        color: Colors.green,
                      ),
                      SizedBox(height: 10),
                      simplifyText(
                        text: "Ready to sign?",
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.green[700],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30.0),
              simplifyText(
                text: 'Choose one of the options below to continue.',
                fontSize: 16.0,
                color: Colors.grey[700],
              ),
              SizedBox(height: 20.0),
              SimplifyButton(
                title: 'Open Camera',
                topMargin: 10.0,
                fillColor: true,
                onTap: controller.openCamera,
              ),
              SizedBox(height: 15.0),
              SimplifyButton(
                title: 'Pick PDF from Gallery',
                topMargin: 10.0,
                fillColor: true,
                onTap: controller.pickPDF,
              ),
              SizedBox(height: 40.0),
              Center(
                child: Column(
                  children: [
                    simplifyText(
                      text: 'Your documents are secure.',
                      fontSize: 14.0,
                      color: Colors.grey[500],
                    ),
                    SizedBox(height: 5),
                    Icon(
                      Icons.lock_rounded,
                      size: 20.0,
                      color: Colors.grey[500],
                    ),
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
