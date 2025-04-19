import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:textomize/core/exports.dart';
import '../controllers/scan_con.dart';

class ScannedDocumentView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ScanDocumentController controller = Get.find<ScanDocumentController>();

    return Scaffold(
      appBar: CustomAppBar(title: 'Scanned Document', centerTitle: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Document Display / Edit Section
              Obx(() {
                return Container(
                  width: double.infinity,
                  height: 400.h,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                   color: AppColors.greyColor,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey.shade300),
                  
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primaryColor.withOpacity(0.2),
                      blurRadius: 8,
                      offset: Offset(0, 4),
                    ),
                  ],),
                  child: controller.isEditing.value
                      ? TextField(
                          controller: controller.textController,
                          maxLines: null,
                          expands: true,
                          style: TextStyle(fontSize: 16.sp, color: Colors.black87),
                          decoration: InputDecoration.collapsed(hintText: "Edit your document..."),
                        )
                      : SingleChildScrollView(
                          child: CustomText(
                            text: controller.scannedDocument.value.isNotEmpty
                                ? controller.scannedDocument.value
                                : "No document found",
                            fontSize: 16.sp,
                            color: controller.scannedDocument.value.isNotEmpty ? Colors.black : Colors.grey,
                          ),
                        ),
                );
              }),
        
              SizedBox(height: 20.h),
        
              // Language Translation Dropdown
              CustomText(text: "Translate to:", fontSize: 14.sp, fontWeight: FontWeight.w500),
              SizedBox(height: 8),
              DropdownButton<String>(
                isExpanded: true,
                value: null,
                hint: const Text("Select Language"),
                items: const [
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
        
              SizedBox(height: 20),
        
              Obx(() => CustomText(
                text: controller.translatedText.value.isNotEmpty
                    ? "Translated Text:\n${controller.translatedText.value}"
                    : "Translation will appear here",
                fontSize: 14.sp,
                textAlign: TextAlign.center,
              )),
        
              SizedBox(height: 20.h),
        
              // Action Buttons (Edit, Save, Share)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _ActionButton(
                    icon: controller.isEditing.value ? Icons.check : Icons.edit,
                    label: controller.isEditing.value ? "Done" : "Edit",
                    onTap: () {
                      controller.toggleEditMode();
                    },
                  ),
                  _ActionButton(
                    icon: Icons.save_alt,
                    label: "Save",
                    onTap: () {
                      Get.bottomSheet(
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                          ),
                          padding: EdgeInsets.all(20),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ListTile(
                                leading: Icon(Icons.picture_as_pdf),
                                title: Text("Save as PDF"),
                                onTap: () {
                                  Get.back();
                                  controller.saveAsPDF();
                                },
                              ),
                              ListTile(
                                leading: Icon(Icons.description),
                                title: Text("Save as Word (DOCX)"),
                                onTap: () {
                                  Get.back();
                                  controller.saveAsDocx();
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  _ActionButton(
                    icon: Icons.share,
                    label: "Share",
                    onTap: controller.shareDocument,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Custom Action Button Widget
class _ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _ActionButton({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onTap,
      child: Column(
        children: [
          CircleAvatar(
            radius: 26,
            backgroundColor: Colors.deepPurple.shade100,
            child: Icon(icon, color: Colors.deepPurple),
          ),
          const SizedBox(height: 6),
          Text(label, style: const TextStyle(fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}
