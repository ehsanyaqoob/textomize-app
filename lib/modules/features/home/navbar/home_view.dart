import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:textomize/widgets/simplifyText.dart';
import '../../../../controllers/controllers.dart';
import '../../../../core/constatnts.dart';
import '../../../../models/tool_model.dart';
import '../tools/tools_section.dart';

class HomeView extends StatefulWidget {
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading ? _buildShimmerEffect() : _buildHomeContent(),
    );
  }

  Widget _buildShimmerEffect() {
    return SingleChildScrollView(
      child: Column(
        children: [
          _shimmerBox(height: 200, width: double.infinity),
          SizedBox(height: 16),
          _shimmerBox(height: 100, width: double.infinity),
          SizedBox(height: 16),
          _shimmerGrid(),
        ],
      ),
    );
  }

  Widget _buildHomeContent() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 16),
          ToolsSection(
            tools: tools.map((tool) => Tool.fromMap(tool)).toList(),
          ),
          SizedBox(height: 20),
          RecentFilesSection(recentFiles: recentFiles),
        ],
      ),
    );
  }

  Widget _shimmerBox({required double height, required double width}) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        height: height,
        width: width,
        margin: EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }

  Widget _shimmerGrid() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 1.0,
        ),
        itemCount: 6,
        itemBuilder: (context, index) {
          return Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          );
        },
      ),
    );
  }
}

class RecentFilesSection extends StatelessWidget {
  final List<Map<String, String>> recentFiles;

  RecentFilesSection({required this.recentFiles});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              simplifyText(
                  text: AppConstants.recent_files,
                  fontWeight: FontWeight.bold,
                  fontSize: 22.0),
              IconButton(
                icon: Icon(Icons.arrow_forward_ios_rounded,
                    color: Colors.black, size: 22),
                onPressed: () {},
              ),
            ],
          ),
          SizedBox(height: 10.0),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: recentFiles.length,
            itemBuilder: (context, index) {
              final file = recentFiles[index];
              return Container(
                height: 80.h,
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(bottom: 10.0),
                padding: EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Colors.blueAccent.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(Icons.description,
                          size: 30, color: Colors.blueAccent),
                    ),
                    SizedBox(width: 12.0),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            file['title'] ?? 'Untitled',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                              color: Colors.black87,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 4.0),
                          Row(
                            children: [
                              simplifyText(
                                  text: file['date'] ?? '??',
                                  fontSize: 14.0,
                                  color: Colors.grey),
                              SizedBox(width: 10.0),
                              simplifyText(
                                  text: file['time'] ?? '??',
                                  fontSize: 14.0,
                                  color: Colors.grey),
                            ],
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.share, color: Colors.grey),
                      onPressed: () {},
                    ),
                    PopupMenuButton(
                      itemBuilder: (context) => [
                        PopupMenuItem(
                            child: simplifyText(text: "Open"), value: "open"),
                        PopupMenuItem(
                            child: simplifyText(text: "Delete"),
                            value: "delete"),
                      ],
                      icon: Icon(Icons.more_vert, color: Colors.grey),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
