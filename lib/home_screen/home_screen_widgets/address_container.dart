import 'package:droon_flutter_ui/constant/color_constant.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddressContainer extends StatefulWidget {
  const AddressContainer({Key? key}) : super(key: key);

  @override
  State<AddressContainer> createState() => _AddressContainerState();
}

class _AddressContainerState extends State<AddressContainer> {
  int activeStep = 0;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 100.h,
      left: 65.w,
      right: 65.w,
      child: Container(
        height: 80.h,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(18.sp), color: const Color(0XFFC8D8FE)),
        child: Row(
          children: [
            SizedBox(
              height: 80.h,
              width: 40.w,
              child: EasyStepper(
                direction: Axis.vertical,
                activeStep: activeStep,
                lineLength: 25,
                stepShape: StepShape.rRectangle,
                stepBorderRadius: 15,
                borderThickness: 2,
                showTitle: false,
                padding: 1,
                stepRadius: 10,
                unreachedStepBackgroundColor: kBlackColor,
                activeStepBackgroundColor: kBlackColor,
                lineColor: kBlackColor,
                activeStepBorderColor: kBlackColor,
                unreachedStepBorderColor: kBlackColor,
                steps: const [
                  EasyStep(icon: Icon(Icons.add_task_rounded), title: 'Order Placed'),
                  EasyStep(icon: Icon(Icons.other_houses_outlined), title: 'Preparing'),
                ],
                onStepReached: (index) => setState(() => activeStep = index),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 17.h, bottom: 17.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('2715 Ash Dr, San Jose',
                      style: TextStyle(color: kBlackColor, fontSize: 10.sp, fontFamily: 'Poppins', fontWeight: FontWeight.bold)),
                  const Divider(thickness: 2, color: Colors.blue),
                  const Spacer(),
                  Text('3891 Ranchview Dr, Richardson',
                      style: TextStyle(color: kBlackColor, fontSize: 10.sp, fontFamily: 'Poppins', fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
