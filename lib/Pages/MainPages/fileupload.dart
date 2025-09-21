import 'dart:io';
import 'dart:ui';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:leagese/Pages/MainPages/Document%20Info/docinfo.dart';

import 'package:leagese/colors.dart';
import 'package:leagese/models/lawyer.dart';

class FileUploadWidget extends StatefulWidget {
  const FileUploadWidget({super.key});

  @override
  State<FileUploadWidget> createState() => _FileUploadWidgetState();
}

class _FileUploadWidgetState extends State<FileUploadWidget>
    with SingleTickerProviderStateMixin {
  File? _file;
  PlatformFile? _platformFile;

  late AnimationController loadingController;

  @override
  void initState() {
    super.initState();
    loadingController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1))
          ..addListener(() {
            setState(() {});
          });
  }

  selectFile() async {
    final file = await FilePicker.platform.pickFiles();
    if (file != null) {
      setState(() {
        _file = File(file.files.single.path!);
        _platformFile = file.files.first;
      });
      loadingController.forward();
    }
  }

  @override
  void dispose() {
    loadingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Lawyer sachin = Lawyer(
      name: "General",
      type: "General Lawyer",
      image: "assets/img/1.png",
      description: "General legal assistance and inquiries.",
      analysisSpeed: "N/A",
      accuracyRate: "N/A",
      documentsProcessed: 0,
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Analyze Your Document Instantly ",
          style: GoogleFonts.cabin(
            fontSize: 24,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),

        Text(
          "Get AI-powered insights from your legal papers",
          style: GoogleFonts.cabin(fontSize: 14, color: Colors.grey),
        ),
        SizedBox(height: 20.h),
        GestureDetector(
          onTap: selectFile,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 0.h),
            child: CustomDottedBorder(
              borderRadius: BorderRadius.circular(10.w),
              dashWidth: 8,
              dashSpace: 4,
              color: MyColors.primary.withOpacity(0.7),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.w),
                  gradient: LinearGradient(
                    colors: [
                      MyColors.primary.withOpacity(0.15),
                      Colors.black.withOpacity(0.2),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.w),
                    child: Stack(
                      children: [
                        /// Grid overlay
                        Positioned.fill(
                          child: CustomPaint(painter: GridPainter()),
                        ),

                        /// Centered content
                        Center(
                          child: Column(
                            mainAxisSize:
                                MainAxisSize.min, // keeps content compact
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: const Color.fromARGB(255, 3, 67, 67),
                                  shape: BoxShape.circle,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Icon(
                                    Iconsax.folder_open,
                                    color: Colors.white,
                                    size: 40.w,
                                  ),
                                ),
                              ),
                              SizedBox(height: 15.h),
                              Text(
                                'Browse your file',
                                style: GoogleFonts.robotoMono(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white.withOpacity(0.85),
                                ),
                              ),
                              Text(
                                'Supported formats: PDF, DOCX, JPG.',
                                style: GoogleFonts.cabin(
                                  fontSize: 12.sp,
                                  color: Colors.white.withOpacity(0.6),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 20.h),
        if (_platformFile != null)
          Column(
            children: [
              Container(
                padding: EdgeInsets.all(0.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Selected File',
                          style: GoogleFonts.cabin(
                            color: Colors.grey.shade400,
                            fontSize: 15.sp,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _file = null;
                              _platformFile = null;
                            });
                          },
                          child: Icon(Icons.cancel, color: Colors.red),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    Container(
                      padding: EdgeInsets.all(8.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.w),
                        color: MyColors.textPrimary.withOpacity(0.09),
                        border: Border.all(
                          color: MyColors.textPrimary.withOpacity(0.1),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              _platformFile!.name.toLowerCase().endsWith(
                                        '.jpg',
                                      ) ||
                                      _platformFile!.name
                                          .toLowerCase()
                                          .endsWith('.jpeg') ||
                                      _platformFile!.name
                                          .toLowerCase()
                                          .endsWith('.png')
                                  ? Image.file(
                                      _file!,
                                      width: 70.w,
                                      height: 100.h,
                                    )
                                  : Icon(
                                      Icons.description,
                                      size: 70.w,
                                      color: Colors.grey,
                                    ),
                              SizedBox(width: 10.w),
                              Flexible(
                                child: Text(
                                  _platformFile!.name,
                                  style: GoogleFonts.cabin(
                                    fontSize: 13.sp,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 5.h),
                          Row(
                            children: [
                              Spacer(),
                              Text(
                                '${(_platformFile!.size / (1024 * 1024)).toStringAsFixed(2)} MB',
                                style: GoogleFonts.cabin(
                                  fontSize: 13.sp,
                                  color: Colors.grey.shade500,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 5.h),
                          Container(
                            height: 5.h,
                            clipBehavior: Clip.hardEdge,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.w),
                              color: MyColors.textPrimary.withOpacity(0.09),
                            ),
                            child: LinearProgressIndicator(
                              color: MyColors.primaryLight,
                              value: loadingController.value,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      // Handle send action
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => DocInfoPage(
                            lawyer: sachin,
                            filename: "Agreement",
                          ),
                        ),
                      );
                    },
                    child: Container(
                      width: double.infinity,
                      height: 56,
                      decoration: BoxDecoration(
                        color: MyColors.primary,
                        borderRadius: BorderRadius.circular(28),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 8,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          "Send Legal Document to General Lawyer",
                          style: GoogleFonts.cabin(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Note : If you want to send to a specific lawyer, please check at top of your screen and select the lawyer from the list.",
                      style: GoogleFonts.cabin(
                        color: Colors.grey.shade500,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
      ],
    );
  }
}

// Custom Dotted Border Widget
class CustomDottedBorder extends StatelessWidget {
  final Widget child;
  final BorderRadius borderRadius;
  final double dashWidth;
  final double dashSpace;
  final Color color;

  const CustomDottedBorder({
    super.key,
    required this.child,
    this.borderRadius = BorderRadius.zero,
    this.dashWidth = 5,
    this.dashSpace = 3,
    this.color = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _DottedBorderPainter(
        borderRadius: borderRadius,
        dashWidth: dashWidth,
        dashSpace: dashSpace,
        color: color,
      ),
      child: child,
    );
  }
}

class _DottedBorderPainter extends CustomPainter {
  final BorderRadius borderRadius;
  final double dashWidth;
  final double dashSpace;
  final Color color;

  _DottedBorderPainter({
    required this.borderRadius,
    required this.dashWidth,
    required this.dashSpace,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    final rrect = borderRadius.toRRect(rect);
    final path = Path()..addRRect(rrect);

    final paint = Paint()
      ..color = color
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke;

    final PathMetrics metrics = path.computeMetrics();
    for (final metric in metrics) {
      double distance = 0.0;
      while (distance < metric.length) {
        final extractPath = metric.extractPath(distance, distance + dashWidth);
        canvas.drawPath(extractPath, paint);
        distance += dashWidth + dashSpace;
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class GridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.05)
      ..strokeWidth = 0.5;

    for (var i = 0; i < size.width / 20; i++) {
      canvas.drawLine(Offset(i * 20, 0), Offset(i * 20, size.height), paint);
    }

    for (var i = 0; i < size.height / 20; i++) {
      canvas.drawLine(Offset(0, i * 20), Offset(size.width, i * 20), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
