import 'package:droon_flutter_ui/constant/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:rulers/rulers.dart';
import 'package:video_player/video_player.dart';

class LiveButtonBottomSheet extends StatefulWidget {
  const LiveButtonBottomSheet({Key? key}) : super(key: key);

  @override
  State<LiveButtonBottomSheet> createState() => _LiveButtonBottomSheetState();
}

class _LiveButtonBottomSheetState extends State<LiveButtonBottomSheet> {
  late VideoPlayerController _videoPlayerController;
  @override
  void initState() {
    super.initState();
    _videoPlayerController =
        VideoPlayerController.network('https://joy1.videvo.net/videvo_files/video/free/2018-01/small_watermarked/171124_F1_001_preview.webm')
          ..initialize()
          ..play()
          ..setLooping(true);
    super.initState();
  }

  bool isAnimation = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        /// ====================== BottomSheet ======================
        showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusDirectional.only(
              topEnd: Radius.circular(30.sp),
              topStart: Radius.circular(30.sp),
            ),
          ),
          builder: (context) => Container(
            padding: EdgeInsets.only(top: 5.h, left: 20.w, right: 20.w),
            height: 550.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// ====================
                Center(
                  child: Container(
                    height: 3.h,
                    width: 70.w,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.sp), color: kBlackColor),
                  ),
                ),

                /// ========== Live ==========
                const Text('🔴 LIVE', style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.bold, color: kBlackColor)),

                /// ========== Quadcopter ==========
                Text('Quadcopter #2347', style: TextStyle(fontWeight: FontWeight.bold, color: kBlackColor, fontSize: 20.sp)),

                /// ========== MP4 Video ==========
                Stack(
                  children: [
                    SizedBox(
                      height: 300.h,
                      width: MediaQuery.of(context).size.width,
                      child: ClipRRect(borderRadius: BorderRadius.circular(15.sp), child: VideoPlayer(_videoPlayerController)),
                    ),
                    Positioned(top: 10.h, left: 10.w, child: Text('22:26 PM', style: TextStyle(fontSize: 12.sp))),
                    Positioned(
                      top: 110.h,
                      left: 10.w,
                      child: Container(
                        height: 200.h,
                        alignment: Alignment.centerLeft,
                        child: RulerWidget(
                            scaleBackgroundColor: Colors.transparent,
                            height: 80.h,
                            largeScaleBarsInterval: 10,
                            smallScaleBarsInterval: 4,
                            lowerIndicatorLimit: 0,
                            lowerMidIndicatorLimit: 0,
                            upperMidIndicatorLimit: 0,
                            upperIndicatorLimit: 0,
                            barsColor: kWhiteColor,
                            axis: Axis.vertical),
                      ),
                    ),
                    Positioned(
                      top: 130.h,
                      left: 140.w,
                      child: Container(
                        height: 50.h,
                        width: 50.w,
                        decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: kWhiteColor, width: 2.w)),
                        child: const Icon(Icons.near_me, color: kWhiteColor),
                      ),
                    ),
                    Positioned(
                      top: 240.h,
                      left: 200.w,
                      child: Row(
                        children: [
                          Container(
                            height: 45.h,
                            width: 50.w,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.sp), color: Colors.white24),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text('P'),
                                Icon(Icons.camera_alt_outlined, color: kWhiteColor),
                              ],
                            ),
                          ),
                          SizedBox(width: 8.w),
                          Container(
                            height: 45.h,
                            width: 50.w,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.sp), color: Colors.white24),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text('R'),
                                Text('🔴'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                /// ========== Time left ==========
                Text('Time left', style: TextStyle(fontWeight: FontWeight.bold, color: kBlackColor, fontSize: 15.sp)),

                /// ========== Container ==========
                Stack(
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 10.h, left: 10.w, right: 10.w),
                      height: 70.h,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.sp), color: Colors.black12),
                      child: Stack(
                        children: [
                          /// ========== 6km to 12min ==========
                          SizedBox(
                            width: 150.w,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('6km',
                                    style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.bold, color: kBlackColor, fontSize: 13.sp)),
                                Text('12min',
                                    style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.bold, color: kBlackColor, fontSize: 13.sp)),
                              ],
                            ),
                          ),

                          /// ========== ProgressBar ==========
                          Positioned(
                            top: 30.h,
                            child: Row(
                              children: [
                                Container(
                                  width: 50.w,
                                  height: 5.h,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(topLeft: Radius.circular(15.sp), bottomLeft: Radius.circular(15.sp)),
                                      color: Colors.grey),
                                ),
                                Container(
                                  width: 100.w,
                                  height: 5.h,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(topRight: Radius.circular(15.sp), bottomRight: Radius.circular(15.sp)),
                                      color: const Color(0XFFB8F38F)),
                                ),
                              ],
                            ),
                          ),

                          /// ========== Drone Json ==========
                          Positioned(
                            // top: 0.1.h,
                            left: 10.w,
                            child: Container(
                              child: Lottie.asset("aseets/drone.json", height: 70.h, width: 70.w),
                            ),
                          ),

                          /// ====================
                          Positioned(
                            top: 4.h,
                            left: 170.w,
                            child: Container(
                              height: 45.h,
                              width: 50.w,
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.sp), border: Border.all(color: kBlackColor)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    height: 10.h,
                                    width: 10.w,
                                    decoration: const BoxDecoration(shape: BoxShape.circle, color: Color(0XFFB8F38F)),
                                  ),
                                  Container(
                                    height: 10.h,
                                    width: 10.w,
                                    decoration: const BoxDecoration(shape: BoxShape.circle, color: Color(0xffC8D8FE)),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          /// ========== $50 ==========
                          Positioned(
                            top: 10.h,
                            left: 240.w,
                            child: Text('\$50',
                                style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.bold, color: kBlackColor, fontSize: 20.sp)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(),
              ],
            ),
          ),
        );
      },
      child: Container(
        height: 45.h,
        width: 80.w,
        decoration: BoxDecoration(
          color: Colors.white24,
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: const Center(child: Text('🔴 LIVE', style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.bold))),
      ),
    );
  }
}
