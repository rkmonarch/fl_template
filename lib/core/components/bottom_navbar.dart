import 'package:fl_template/feature/home/home_screen.dart';
import 'package:fl_template/feature/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class PagesWidget extends StatefulWidget {
  dynamic currentTab;

  Widget currentPage = const HomeScreen();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  PagesWidget({
    super.key,
    this.currentTab,
  }) {
    if (currentTab != null) {
      currentTab = int.parse(currentTab.toString());
    } else {
      currentTab = 0;
    }
  }

  @override
  // ignore: library_private_types_in_public_api
  _PagesWidgetState createState() {
    return _PagesWidgetState();
  }
}

class _PagesWidgetState extends State<PagesWidget> {
  @override
  initState() {
    super.initState();
    _selectTab(widget.currentTab);
  }

  @override
  void didUpdateWidget(PagesWidget oldWidget) {
    _selectTab(oldWidget.currentTab);
    super.didUpdateWidget(oldWidget);
  }

  void _selectTab(int tabItem) {
    setState(() {
      widget.currentTab = tabItem;
      switch (tabItem) {
        case 0:
          widget.currentPage =
              HomeScreen(parentScaffoldKey: widget.scaffoldKey);
          break;
        case 1:
          widget.currentPage = ProfileScreen(
            parentScaffoldKey: widget.scaffoldKey,
          );
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return
        // storage.read("AToken") != null ?
        Scaffold(
      resizeToAvoidBottomInset: false,
      // floatingActionButtonLocation:
      //     FloatingActionButtonLocation.centerDocked,
      // floatingActionButton: Padding(
      //   padding: EdgeInsets.only(top: deviceHeight(context) * 0.0),
      //   child: GestureDetector(
      //     onTap: () {
      //       Navigator.push(
      //           context,
      //           MaterialPageRoute(
      //               builder: (builder) => const ScanAndPayScreen()));
      //     },
      //     child: CircleAvatar(
      //       backgroundColor: const Color(0xff2F77FF),
      //       radius: 30,
      //       // backgroundImage: AssetImage(kImgHomeScan),
      //       child: Image.asset(
      //         kImgHomeScan,
      //         height: 40,
      //         width: 40,
      //       ),
      //     ),
      //   ),
      // ),
      key: widget.scaffoldKey,
      body: widget.currentPage,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(255, 26, 33, 46),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.white,
        selectedLabelStyle: GoogleFonts.plusJakartaSans(
          fontWeight: FontWeight.w500,
          fontSize: 12,
          color: Colors.white,
        ),
        unselectedLabelStyle: GoogleFonts.plusJakartaSans(
          fontWeight: FontWeight.w500,
          fontSize: 12,
        ),
        selectedFontSize: 16,
        unselectedFontSize: 16,
        iconSize: 22,
        elevation: 0,
        unselectedItemColor: const Color(0xff676D75),
        showSelectedLabels: true,
        showUnselectedLabels: true,
        currentIndex: widget.currentTab,
        onTap: (int i) {
          _selectTab(i);
        },
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            activeIcon: const Icon(Icons.home),
            label: 'text00040'.tr,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.person),
            activeIcon: const Icon(Icons.person),
            label: 'text00041'.tr,
          ),
        ],
      ),
    );
    // : const OnboardingScreen();
  }
}
