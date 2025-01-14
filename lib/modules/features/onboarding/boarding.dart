
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:textomize/core/exports.dart';
import 'package:textomize/modules/features/auth/signIn_view.dart';
import 'package:textomize/modules/features/profile/profile_view.dart';

class Boarding extends StatefulWidget {
  const Boarding({Key? key}) : super(key: key);

  @override
  State<Boarding> createState() => _BoardingState();
}

class _BoardingState extends State<Boarding> {
  final PageController _controller = PageController();
  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [AppColors.scaffoldBackgroundColor,AppColors.scaffoldBackgroundColor,],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 50), // Spacing at the top
            Expanded(
              child: PageView(
                controller: _controller,
                onPageChanged: (index) {
                  setState(() {
                    onLastPage = (index == 2); // For 3 pages
                  });
                },
                children: [
                  _buildPage(
                    color: Colors.pink.shade100,
                    title: 'You can also edit and customize scan results',
                    description:
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor...',
                  ),
                  _buildPage(
                    color: Colors.blue.shade100,
                    title: 'Effortlessly Scan Your Documents',
                    description:
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor...',
                  ),
                  _buildPage(
                    color: Colors.green.shade100,
                    title: 'Organize Your Digital Files Seamlessly',
                    description:
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor...',
                  ),
                ],
              ),
            ),
            // Page indicator
            SmoothPageIndicator(
              controller: _controller,
              count: 3,
              effect: ScrollingDotsEffect(
                activeDotColor: Colors.blue,
                dotColor: Colors.grey.shade400,
                dotHeight: 10,
                dotWidth: 10,
                spacing: 8,
              ),
            ),
            SizedBox(height: 20),
            // Buttons Row
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Skip Button
                  TextButton(
                    onPressed: () {
                      _controller.jumpToPage(2); // Jump to the last page
                    },
                    child: Text(
                      'Skip',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey.shade700,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  // Next/Finish Button
                  ElevatedButton(
                    onPressed: () {
                      if (onLastPage) {
                       // Get.to(SignInView());
                        Get.to(ProfileView());

                      } else {
                        _controller.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30), // Increased radius
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 24,
                      ),
                      elevation: 3,
                    ),
                    child: Text(
                      onLastPage ? 'Finish' : 'Next',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30), // Bottom spacing
          ],
        ),
      ),
    );
  }

  Widget _buildPage({
    required Color color,
    required String title,
    required String description,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        children: [
          // Colorful container section
          Expanded(
            child: Center(
              child: Container(
               height: 420.h,
              width: double.infinity, // Simplified for better readability
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(60),
                  topRight: Radius.circular(60),
                  bottomLeft: Radius.circular(150),
                ),),
              ),
            ),
          ),
          // Text content
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey.shade600,
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
