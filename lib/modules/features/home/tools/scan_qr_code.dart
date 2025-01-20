
import 'package:textomize/core/exports.dart';

class ScanQrCodeView extends StatefulWidget {
  const ScanQrCodeView({super.key});

  @override
  State<ScanQrCodeView> createState() => _ScanQrCodeViewState();
}

class _ScanQrCodeViewState extends State<ScanQrCodeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Scan QR Code',
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            simplifyText(
              text: 'Scan QR Code to proceed',
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryColor,
            ),
            SizedBox(height: 20.0),
            Container(
              width: double.infinity,
              height: 300.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.grey[200],
              ),
              child: Center(
                child: Icon(
                  Icons.camera_alt,
                  size: 50.0,
                  color: AppColors.primaryColor,
                ),
              ),
            ),
            SizedBox(height: 20.0),
            simplifyText(
              text: 'Align the QR code inside the frame to scan.',
              fontSize: 14.0,
              color: Colors.grey[600],
            ),
            SizedBox(height: 30.0),
           SimplifyButton(title: 'Start Scaning', onTap: () {
             
           },
           fillColor: true,)
          ],
        ),
      ),
    );
  }
}