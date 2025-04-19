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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: 'Scan QR Code to proceed',
                fontSize: 22.0.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryColor,
              ),
              SizedBox(height: 25.0.h),
              Container(
                width: double.infinity,
                height: 250.0.h,
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
                    size: 70.0.sp,
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
              SizedBox(height: 25.0.h),
              CustomText(
                textAlign: TextAlign.center,
                text:
                    ' Scan the QR code Make sure the QR code is clearly visible.',
                fontSize: 16.0.sp,
                color: AppColors.greyColor,
                maxLines: 2,
              ),
              SizedBox(height: 30.0.h),
              SimplifyButton(
                title: 'Scan QR Code',
                onTap: () {},
                fillColor: true,
              ),
              SizedBox(height: 15.0.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.help_outline,
                    size: 20.0.sp,
                    color: Colors.grey[600],
                  ),
                  SizedBox(width: 5.0.w),
                  CustomText(
                    text: 'Choose your Style For Scaning .',
                    fontSize: 14.0.sp,
                    color: AppColors.primaryColor,
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
