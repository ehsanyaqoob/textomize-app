import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:textomize/core/exports.dart';

import 'all_tools.dart';
import 'compress_pdf.dart';
import 'e_sign_pdf.dart';
import 'merge_pdf.dart';
import 'protect_pdf.dart';
import 'scan_qr_code.dart';
import 'split_pdf.dart';
import 'watermark_view.dart';

class ToolsSection extends StatelessWidget {
  final List<Map<String, dynamic>> tools = [
    {'label': 'Scan Code', 'icon': Icons.qr_code, 'view': ScanQrCodeView()},
    {'label': 'Watermark', 'icon': Icons.water, 'view': WaterMarkView()},
    {'label': 'eSign PDF', 'icon': Icons.edit, 'view': ESignPDFView()},
    {'label': 'Split PDF', 'icon': Icons.splitscreen, 'view': SplitPdfView()},
    {'label': 'Merge PDF', 'icon': Icons.merge_type, 'view': MergePDFView()},
    {'label': 'Protect PDF', 'icon': Icons.lock, 'view': ProtectPDFView()},
    {
      'label': 'Compress PDF',
      'icon': Icons.compress,
      'view': CompressPDFView()
    },
    {'label': 'All Tools', 'icon': Icons.grid_view, 'view': AllToolsView()},
  ];

  final List<Color> containerColors = [
    Color(0xFFFFCDD2), // Light Red
    Color(0xFFC8E6C9), // Light Green
    Color(0xFFBBDEFB), // Light Blue
    Color(0xFFFFF9C4), // Light Yellow
    Color(0xFFE1BEE7), // Light Purple
    Color(0xFFB2EBF2), // Light Cyan
    Color(0xFFFFE0B2), // Light Orange
    Color(0xFFF0F4C3), // Light Lime
  ];

  final List<Color> iconColors = [
    Color(0xFFD32F2F), // Dark Red
    Color(0xFF388E3C), // Dark Green
    Color(0xFF1976D2), // Dark Blue
    Color(0xFFFBC02D), // Dark Yellow
    Color(0xFF7B1FA2), // Dark Purple
    Color(0xFF00838F), // Dark Cyan
    Color(0xFFF57C00), // Dark Orange
    Color(0xFFAFB42B), // Dark Lime
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          childAspectRatio: 0.8,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
        ),
        itemCount: tools.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Get.to(() => tools[index]['view']);
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 70.0,
                  height: 70.0,
                  decoration: BoxDecoration(
                    color: containerColors[index % containerColors.length],
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        blurRadius: 6,
                        offset: Offset(2, 2),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Icon(
                      tools[index]['icon'],
                      color: iconColors[index % iconColors.length],
                      size: 32.0,
                    ),
                  ),
                ),
                SizedBox(height: 8.0),
                simplifyText(
                  text: tools[index]['label'],
                  textAlign: TextAlign.center,
                  fontSize: 8.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey[800],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
