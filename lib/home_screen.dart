import 'package:droon_flutter_ui/contsnt/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('aseets/background_map.jpg'), fit: BoxFit.cover)),
        child: Stack(
          children: [
            /// ====================== Menu Icon ======================
            Positioned(
              top: 45.h,
              left: 20.w,
              right: 292.w,
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  height: 45.h,
                  width: 45.w,
                  decoration: BoxDecoration(
                    color: Colors.white24,
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                  child: const Icon(Icons.menu, color: kWhiteColor),
                ),
              ),
            ),

            Positioned(
              top: 250.h,
              left: 290.w,
              right: 20.w,
              child: Column(
                children: [
                  /// ====================== Add Icon ======================
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 45.h,
                      width: 45.w,
                      decoration: BoxDecoration(
                        color: Colors.white24,
                        borderRadius: BorderRadius.circular(15.r),
                      ),
                      child: const Icon(Icons.add, color: kWhiteColor),
                    ),
                  ),

                  /// ====================== Minus Icon ======================
                  SizedBox(height: 10.h),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 45.h,
                      width: 45.w,
                      decoration: BoxDecoration(
                        color: Colors.white24,
                        borderRadius: BorderRadius.circular(15.r),
                      ),
                      child: const Icon(Icons.remove, color: kWhiteColor),
                    ),
                  ),

                  /// ====================== Send Icon ======================
                  SizedBox(height: 10.h),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 45.h,
                      width: 45.w,
                      decoration: BoxDecoration(
                        color: Colors.white24,
                        borderRadius: BorderRadius.circular(15.r),
                      ),
                      child: const Icon(Icons.send, color: kWhiteColor),
                    ),
                  ),
                ],
              ),
            ),

            Positioned(
              top: 600.h,
              left: 40.w,
              right: 40.w,
              child: Container(
                height: 60.h,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.sp), color: Colors.white24),
                child: Row(
                  children: const [
                    Icon(Icons.add,color: kWhiteColor),
                    Icon(Icons.add,color: kWhiteColor),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
