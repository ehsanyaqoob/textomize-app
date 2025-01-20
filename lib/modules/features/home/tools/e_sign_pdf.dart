import 'package:textomize/core/exports.dart';

class ESignPDFView extends StatefulWidget {
  const ESignPDFView({super.key});

  @override
  State<ESignPDFView> createState() => _ESignPDFViewState();
}

class _ESignPDFViewState extends State<ESignPDFView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'E-Sign PDF',
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            simplifyText(
              text: 'Sign your PDF document electronically',
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryColor,
            ),
            SizedBox(height: 20.0),
            Container(
              width: double.infinity,
              height: 220.0,
              decoration: BoxDecoration(
                color: Colors.greenAccent.withOpacity(0.1),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.green.withOpacity(0.2), width: 1),
              ),
              child: Center(
                child: Icon(
                  Icons.edit,
                  size: 80.0,
                  color: AppColors.primaryColor,
                ),
              ),
            ),
            SizedBox(height: 30.0),
            simplifyText(
              text: 'Upload a PDF and apply your signature.',
              fontSize: 16.0,
              color: Colors.grey[600],
            ),
            SizedBox(height: 35.0),
            SimplifyButton(
              title: 'Upload PDF',
              onTap: () {
                // Add your logic here
              },
              fillColor: true,
            ),
            SizedBox(height: 25.0),
            simplifyText(
              text: 'Or sign by drawing directly on the screen.',
              fontSize: 14.0,
              color: Colors.grey[600],
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.style,
                  size: 20.0,
                  color: Colors.grey[600],
                ),
                SizedBox(width: 5.0),
                simplifyText(
                  text: 'Draw Signature',
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
