import 'package:droon_flutter_ui/home_screen/home_screen_widgets/address_container.dart';
import 'package:droon_flutter_ui/constant/color_constant.dart';
import 'package:droon_flutter_ui/constant/custom_style_arrow.dart';
import 'package:droon_flutter_ui/home_screen/home_screen_widgets/live_button_bottom_sheet.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:percent_indicator/percent_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  bool isAnimation = false;

  double _height = 8.0.h;
  final double _width = 8.0.w;
  var _color = const Color(0XFFC8D8FE);

  bool showCircularPercentIndicator = true;

  bool showLiveButton = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('aseets/background_map.jpg'), fit: BoxFit.cover)),
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                /// ====================== Menu Icon ======================
                Positioned(
                  top: 45.h,
                  left: 20.w,
                  right: 20.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 45.h,
                        width: 45.w,
                        decoration: BoxDecoration(
                          color: Colors.white24,
                          borderRadius: BorderRadius.circular(15.r),
                        ),
                        child: const Icon(Icons.menu, color: kWhiteColor),
                      ),

                      /// ====================== Live ======================
                      showLiveButton ? const SizedBox() : const LiveButtonBottomSheet(),
                    ],
                  ),
                ),

                Positioned(
                  top: 290.h,
                  left: 290.w,
                  right: 20.w,
                  child: Column(
                    children: [
                      /// ====================== Add Icon ======================
                      Container(
                        height: 45.h,
                        width: 45.w,
                        decoration: BoxDecoration(
                          color: Colors.white24,
                          borderRadius: BorderRadius.circular(15.r),
                        ),
                        child: const Icon(Icons.add, color: kWhiteColor),
                      ),

                      /// ====================== Minus Icon ======================
                      SizedBox(height: 10.h),
                      Container(
                        height: 45.h,
                        width: 45.w,
                        decoration: BoxDecoration(
                          color: Colors.white24,
                          borderRadius: BorderRadius.circular(15.r),
                        ),
                        child: const Icon(Icons.remove, color: kWhiteColor),
                      ),

                      /// ====================== Near Me Icon ======================
                      SizedBox(height: 10.h),
                      Container(
                        height: 45.h,
                        width: 45.w,
                        decoration: BoxDecoration(
                          color: Colors.white24,
                          borderRadius: BorderRadius.circular(15.r),
                        ),
                        child: const Icon(Icons.near_me, color: Color(0XFFB8F38F)),
                      ),
                    ],
                  ),
                ),

                /// ====================== Address Container ======================
                const AddressContainer(),

                /// ====================== Home Container ======================
                Positioned(
                  top: 200.h,
                  left: 40.w,
                  child: CustomPaint(
                    painter: customStyleArrow(),
                    child: Container(
                      height: 30.h,
                      width: 80.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.r),
                        gradient: const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0XFFB8F38F),
                            Color(0XFFC8D8FE),
                          ],
                        ),
                      ),
                      child: Center(
                        child:
                            Text("⦿ Home", style: TextStyle(color: kBlackColor, fontSize: 10.sp, fontFamily: 'Poppins', fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ),
                ),

                /// ====================== House ======================
                Positioned(
                  top: 235.h,
                  left: 50.w,
                  child: Container(
                    height: 100.h,
                    width: 100.w,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('aseets/house_image.png'),
                      ),
                    ),
                  ),
                ),

                /// ====================== Line ======================
                Positioned(
                  top: 298.h,
                  left: 150.w,
                  child: AnimatedSize(
                    curve: Curves.fastOutSlowIn,
                    duration: const Duration(seconds: 4),
                    child: AnimatedContainer(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.r), color: _color),
                      width: _width,
                      height: _height,
                      duration: const Duration(seconds: 1),
                    ),
                  ),
                ),

                /// ====================== Arrow_up ======================
                Positioned(
                  top: 580.h,
                  left: 140.w,
                  right: 140.w,
                  child: Container(
                    height: 20.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(15.sp), topRight: Radius.circular(15.sp)),
                      gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0XFFB8F38F),
                          Color(0XFFC8D8FE),
                        ],
                      ),
                    ),
                    child: Icon(Icons.keyboard_arrow_up, size: 25.sp),
                  ),
                ),

                /// ====================== Bottom ======================
                Positioned(
                  top: 600.h,
                  left: 40.w,
                  right: 40.w,
                  child: Container(
                    height: 60.h,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(25.sp), color: Colors.white24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        /// ========== Map Icon ==========
                        Icon(Icons.map_outlined, color: kWhiteColor, size: 25.sp),

                        /// ========== Circular Percent Indicator ==========
                        showCircularPercentIndicator
                            ? const SizedBox()
                            : CircularPercentIndicator(
                                radius: 28.0.r,
                                lineWidth: 5.0,
                                animation: true,
                                backgroundColor: Colors.indigo.shade200,
                                percent: 1.0,
                                center: const Text(" 12 \nmin"),
                                circularStrokeCap: CircularStrokeCap.round,
                                progressColor: const Color(0XFFB8F38F),
                              ),

                        /// ========== Add Icon ==========
                        Icon(Icons.add, color: kWhiteColor, size: 25.sp),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          /// ========== Drone ==========
          AnimatedPositioned(
            duration: const Duration(seconds: 7),
            bottom: isAnimation ? 400 : 2,
            left: isAnimation ? 100 : 140,
            child: GestureDetector(
              child: Lottie.asset("aseets/drone.json", height: 125, width: 125),
              onLongPress: () {
                setState(() {
                  isAnimation = true;
                });
                setState(() {
                  _color = const Color(0XFFBBF3BF);
                  _height = 280.0.h;
                });
                Future.delayed(const Duration(seconds: 6), () {
                  setState(() {
                    _height = 0.0.h;
                  });
                  // print('Container dispose====$_height'); // Prints after 1 second.
                });

                Future.delayed(const Duration(seconds: 9), () {
                  showDialog(
                      context: context,
                      builder: (ctx) {
                        return AlertDialog(
                          actions: [
                            Container(
                              height: 150.h,
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.sp), color: kWhiteColor),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Text('your delivery is Successfully Done',
                                      style: TextStyle(color: kBlackColor, fontSize: 15.sp, fontFamily: 'Poppins', fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center),
                                  SizedBox(
                                    width: 130.w,
                                    height: 45.h,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: const Color(0XFFB8F38F),
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.sp)),
                                      ),
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => const HomeScreen(),
                                          ),
                                        );
                                      },
                                      child: Text(
                                        'DONE',
                                        style: TextStyle(color: kBlackColor, fontSize: 18.sp, fontFamily: 'Poppins', fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      });
                });

                setState(() {
                  showLiveButton = false;
                });
                setState(() {
                  showCircularPercentIndicator = false;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
