
import 'package:textomize/core/exports.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            SizedBox(height: 50.h), // Add spacing at the top
            Container(
              height: 420.h,
              width: double.infinity, // Simplified for better readability
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(60),
                  topRight: Radius.circular(60),
                  bottomLeft: Radius.circular(150),
                ),
              ),
              // Column for the layout inside the container
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Image
                  Image.asset(
                    'assets/png/login.png',
                    height: 150.h, // Adjust size for responsiveness
                  ),
                  SizedBox(height: 20.h), // Add spacing between elements
                  // Text: "Chose The Route"
                  simplifyText(
                    text: 'Choose The Route',
                    color: Colors.grey[700],
                    fontWeight: FontWeight.bold,
                    fontSize: 30.sp,
                  ),
                  // Text: "Easily"
                  simplifyText(
                    text: 'Easily',
                    color: Colors.grey[700],
                    fontSize: 30.sp,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
