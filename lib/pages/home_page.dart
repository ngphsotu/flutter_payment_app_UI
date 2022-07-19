import 'package:get/get.dart';
import 'package:payment_app/pages/payment_page.dart';
import 'package:payment_app/widgets/buttons.dart';
import 'package:payment_app/widgets/large_button.dart';
import 'package:payment_app/widgets/text_size.dart';

import '../component/colors.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColor.backGroundColor,
      body: Container(
        height: h,
        child: Stack(
          children: [
            _headSection(),
            _listBills(),
            _payButton(),
          ],
        ),
      ),
    );
  }

  _headSection() {
    return Container(
      height: 310,
      child: Stack(
        children: [
          _mainBackground(),
          _curveImageContainer(),
          _buttonContainer(),
          _textContainer(),
        ],
      ),
    );
  }

  _mainBackground() {
    return Positioned(
      bottom: 10,
      left: 0,
      child: Container(
        height: 300,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage("assets/images/background.png"),
          ),
        ),
      ),
    );
  }

  _curveImageContainer() {
    return Positioned(
      left: 0,
      right: -2,
      bottom: 10,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.1,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage("assets/images/curve.png"),
          ),
        ),
      ),
    );
  }

  _buttonContainer() {
    return Positioned(
      right: 58,
      bottom: 15,
      child: GestureDetector(
        onTap: () {
          showModalBottomSheet<dynamic>(
            isScrollControlled: true,
            barrierColor: Colors.transparent,
            backgroundColor: Colors.transparent,
            context: context,
            builder: (BuildContext bc) {
              return Container(
                height: MediaQuery.of(context).size.height - 240,
                child: Stack(
                  children: [
                    Positioned(
                        bottom: 0,
                        child: Container(
                          color: const Color(0xFFeef1f4).withOpacity(0.7),
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height - 300,
                        )),
                    Positioned(
                      top: 0,
                      right: 58,
                      child: Container(
                        padding: const EdgeInsets.only(top: 5, bottom: 25),
                        width: 60,
                        height: 250,
                        decoration: BoxDecoration(
                          color: AppColor.mainColor,
                          borderRadius: BorderRadius.circular(29),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppButtons(
                              icon: Icons.cancel,
                              iconColor: AppColor.mainColor,
                              textColor: Colors.white,
                              backgroundColor: Colors.white,
                              onTap: () {
                                Navigator.pop(context);
                              },
                            ),
                            AppButtons(
                              icon: Icons.add,
                              iconColor: AppColor.mainColor,
                              textColor: Colors.white,
                              backgroundColor: Colors.white,
                              onTap: () {},
                              text: "Add Bill",
                            ),
                            AppButtons(
                              icon: Icons.history,
                              iconColor: AppColor.mainColor,
                              textColor: Colors.white,
                              backgroundColor: Colors.white,
                              onTap: () {},
                              text: "History",
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
        child: Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            image: const DecorationImage(
                image: AssetImage("assets/images/lines.png")),
            boxShadow: [
              BoxShadow(
                blurRadius: 15,
                offset: const Offset(0, 1),
                color: const Color(0xFF11324d).withOpacity(0.2),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _listBills() {
    return Positioned(
      top: 320,
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView.separated(
          itemCount: 3,
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
          ),
          physics: const AlwaysScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return Container(
              height: 130,
              width: MediaQuery.of(context).size.width - 20,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFFd8dbe0),
                    offset: Offset(1, 1),
                    blurRadius: 20.0,
                    spreadRadius: 10,
                  ),
                ],
              ),
              child: Container(
                margin: const EdgeInsets.only(top: 10, left: 18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(width: 3, color: Colors.red),
                                image: const DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage("assets/images/brand1.png"),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "KenGen Power",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: AppColor.mainColor,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  "ID: 844594",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: AppColor.idColor,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizeText(
                          text: "Auto pay on 24th May 18",
                          color: AppColor.green,
                        ),
                        const SizedBox(height: 5),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 80,
                              height: 30,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: AppColor.selectBackground),
                              child: Center(
                                child: Text(
                                  "Select",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: AppColor.selectColor,
                                  ),
                                ),
                              ),
                            ),
                            const Spacer(),
                            const Text(
                              "\$ 1248.00",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w900,
                                color: AppColor.mainColor,
                              ),
                            ),
                            Text(
                              "Due in 3 days",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: AppColor.idColor,
                              ),
                            ),
                            const SizedBox(height: 10)
                          ],
                        ),
                        const SizedBox(width: 5),
                        Container(
                          width: 5,
                          height: 40,
                          margin: const EdgeInsets.only(bottom: 8.0),
                          decoration: BoxDecoration(
                            color: AppColor.halfOval,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(30),
                              bottomLeft: Radius.circular(30),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            );
          },
        ),
      ),
    );
  }

  _payButton() {
    return Positioned(
        bottom: 20,
        child: AppLargeButton(
          text: "Pay all bills",
          textColor: Colors.white,
          onTap: () {
            Get.to(() => const PaymentPage());
          },
        ));
  }

  _textContainer() {
    return Stack(
      children: const [
        Positioned(
          left: 0,
          top: 100,
          child: Text(
            "My Bills",
            style: TextStyle(
                fontSize: 70,
                fontWeight: FontWeight.bold,
                color: Color(0xFF293952)),
          ),
        ),
        Positioned(
          left: 40,
          top: 80,
          child: Text(
            "My Bills",
            style: TextStyle(
                fontSize: 50, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ],
    );
  }
}
