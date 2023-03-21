import 'package:flutter/material.dart';
import 'package:flutter_study_app/widgets/app_circle_button.dart';
import 'package:get/get.dart';

class AppIntroductionScreen extends StatelessWidget {
  const AppIntroductionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Get.width * 0.2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.star,
                size: 65,
                color: Colors.amber,
              ),
              const SizedBox(height: 40),
              const Text(
                "This is a sturdy app. You can use it as you want. If you understand how it works, you will be able to scale it. With this you will master firebase backend and frontend ",
              ),
              const SizedBox(height: 40),
              AppCircleButton(
                onTap: () {},
                child: const Icon(
                  Icons.arrow_forward,
                  size: 35,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
