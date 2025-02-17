import 'package:textomize/core/exports.dart';

class ScanQRCodeView extends StatefulWidget {
  const ScanQRCodeView({super.key});

  @override
  State<ScanQRCodeView> createState() => _ScanQRCodeViewState();
}

class _ScanQRCodeViewState extends State<ScanQRCodeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Scan QR Code',
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            simplifyText(
              text: 'Scan QR Code to proceed',
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryColor,
            ),
            SizedBox(height: 25.0),
            Container(
              width: double.infinity,
              height: 250.0,
              decoration: BoxDecoration(
                color: Colors.purpleAccent.withOpacity(0.1),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    blurRadius: 10.0,
                    offset: Offset(3, 3),
                  ),
                ],
              ),
              child: Center(
                child: Icon(
                  Icons.water_damage_outlined,
                  size: 70.0,
                  color: AppColors.primaryColor,
                ),
              ),
            ),
            SizedBox(height: 25.0),
            simplifyText(
              text: 'Upload a document and scan the QR code.',
              fontSize: 16.0,
              color: Colors.grey[600],
            ),
            SizedBox(height: 30.0),
            SimplifyButton(
              title: 'Select Document to Scan',
              onTap: () {
                // Add your logic here
              },
              fillColor: true,
            ),
            SizedBox(height: 15.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.help_outline,
                  size: 20.0,
                  color: Colors.grey[600],
                ),
                SizedBox(width: 5.0),
                simplifyText(
                  text: 'Choose your Style For Scaning .',
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
