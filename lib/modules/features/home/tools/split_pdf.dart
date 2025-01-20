import 'package:textomize/core/exports.dart';

class SplitPdfView extends StatefulWidget {
  const SplitPdfView({super.key});

  @override
  State<SplitPdfView> createState() => _SplitPdfViewState();
}

class _SplitPdfViewState extends State<SplitPdfView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Split PDF',
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            simplifyText(
              text: 'Split your PDF document into multiple parts',
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryColor,
            ),
            SizedBox(height: 20.0),
            Container(
              width: double.infinity,
              height: 200.0,
              decoration: BoxDecoration(
                color: Colors.blueAccent.withOpacity(0.1),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.blue.withOpacity(0.2), width: 1),
              ),
              child: Center(
                child: Icon(
                  Icons.content_cut,
                  size: 80.0,
                  color: AppColors.primaryColor,
                ),
              ),
            ),
            SizedBox(height: 30.0),
            simplifyText(
              text: 'Upload a PDF to split it into separate pages or sections.',
              fontSize: 16.0,
              color: Colors.grey[600],
            ),
            SizedBox(height: 30.0),
            SimplifyButton(
              title: 'Upload PDF',
              onTap: () {
                // Add your logic here
              },
              fillColor: true,
            ),
            SizedBox(height: 25.0),
            simplifyText(
              text: 'Alternatively, you can select page ranges to split.',
              fontSize: 14.0,
              color: Colors.grey[600],
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.pages,
                  size: 20.0,
                  color: Colors.grey[600],
                ),
                SizedBox(width: 5.0),
                simplifyText(
                  text: 'Select Page Ranges',
                  fontSize: 14.0,
                  color: Colors.grey[600],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
