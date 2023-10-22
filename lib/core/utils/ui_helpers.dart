import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:logger/logger.dart';
import 'package:intl/intl.dart';

double deviceWidth(BuildContext context) => MediaQuery.of(context).size.width;
double deviceHeight(BuildContext context) => MediaQuery.of(context).size.height;

Widget hSpaceTiny(BuildContext context) =>
    SizedBox(width: deviceWidth(context) * 0.001);
Widget hSpaceSmall(BuildContext context) =>
    SizedBox(width: deviceWidth(context) * 0.01);
Widget hSpaceMedium(BuildContext context) =>
    SizedBox(width: screenWidth(context) * 0.03);
Widget hSpaceLarge(BuildContext context) =>
    SizedBox(width: deviceWidth(context) * 0.05);
Widget hSpaceMassive(BuildContext context) =>
    SizedBox(width: deviceWidth(context) * 0.1);

Widget vSpaceTiny(BuildContext context) =>
    SizedBox(height: screenHeight(context) * 0.001);
Widget vSpaceSmall(BuildContext context) =>
    SizedBox(height: screenHeight(context) * 0.01);
Widget vSpaceMedium(BuildContext context) =>
    SizedBox(height: screenHeight(context) * 0.03);
Widget vSpaceLarge(BuildContext context) =>
    SizedBox(height: screenHeight(context) * 0.05);
Widget vSpaceMassive(BuildContext context) =>
    SizedBox(height: screenHeight(context) * 0.1);

Widget verticalSpace(double height) => SizedBox(height: height);

extension CustomContext on BuildContext {
  double screenHeight({double percent = 1}) =>
      MediaQuery.of(this).size.height * percent;

  double screenWidth({double percent = 1}) =>
      MediaQuery.of(this).size.width * percent;
}

Widget emptyBox() => const SizedBox.shrink();

class ShimmerWidget extends StatelessWidget {
  final bool isCircle;
  final double? radius;

  const ShimmerWidget({
    Key? key,
    required this.isCircle,
    this.radius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.white,
      highlightColor: Colors.orange,
      child: isCircle
          ? CircleAvatar(
              radius: radius ?? 30,
              backgroundColor: Colors.white,
            )
          : const SizedBox(
              height: 20,
              width: 50,
            ),
    );
  }
}

class ShimmerView extends StatelessWidget {
  const ShimmerView({
    Key? key,
    required this.thumbHeight,
    required this.thumbWidth,
  }) : super(key: key);

  final double thumbHeight;
  final double thumbWidth;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
            baseColor: Colors.white,
            highlightColor: Colors.orange,
            child: Container(
              height: thumbHeight,
              width: thumbWidth,
              color: Colors.white,
            ))
        .decorated(borderRadius: const BorderRadius.all(Radius.circular(12)))
        .padding(all: 8);
  }
}

// Screen Size helpers
Logger lg = Logger();

double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;

double screenHeight(BuildContext context) => MediaQuery.of(context).size.height;

double screenHeightPercentage(BuildContext context, {double percentage = 1}) =>
    screenHeight(context) * percentage;

double screenWidthPercentage(BuildContext context, {double percentage = 1}) =>
    screenWidth(context) * percentage;

showErrorMessage({required String message, title = 'Error'}) {
  Get.snackbar(
    title,
    message,
    backgroundColor: Colors.red,
    colorText: Colors.white,
    shouldIconPulse: true,
    snackPosition: SnackPosition.BOTTOM,
    animationDuration: const Duration(microseconds: 25),
    icon: GestureDetector(
      onTap: () => Get.back(),
      child: const Icon(
        Icons.cancel,
        size: 18,
        color: Colors.white,
      ),
    ),
  );
}

showInfoMessage(
    {required message,
    title = 'Info',
    int duration = 25,
    void Function()? onTap}) {
  Get.snackbar(
    title,
    message,
    backgroundColor: Colors.green,
    colorText: Colors.white,
    shouldIconPulse: true,
    snackPosition: SnackPosition.TOP,
    animationDuration: const Duration(microseconds: 25),
    icon: GestureDetector(
      onTap: () {
        Get.back();
      },
      child: const Icon(
        Icons.cancel,
        size: 18,
        color: Colors.white,
      ),
    ),
  );
}

getCustomFormattedDateTime(String givenDateTime, String dateFormat) {
  final DateTime docDateTime = DateTime.parse(givenDateTime).toLocal();
  return DateFormat(dateFormat).format(docDateTime);
}
