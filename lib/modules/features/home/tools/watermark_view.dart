import 'package:textomize/core/exports.dart';

class WaterMarkView extends StatefulWidget {
  const WaterMarkView({super.key});

  @override
  State<WaterMarkView> createState() => _WaterMarkViewState();
}

class _WaterMarkViewState extends State<WaterMarkView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Add Watermark',
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            simplifyText(
              text: 'Apply a Watermark to Your Documents',
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
              text: 'Upload a document and add a watermark to it.',
              fontSize: 16.0,
              color: Colors.grey[600],
            ),
            SizedBox(height: 30.0),
            SimplifyButton(
              title: 'Select Document to Watermark',
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
                  text: 'Choose your watermark style.',
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
