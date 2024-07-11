import 'package:flutter/material.dart';
import 'package:jiocinema_clone/Utilities/AppStyling.dart';
import 'package:jiocinema_clone/Utilities/Utilites.dart';

class EventFilterScreen extends StatelessWidget {
  const EventFilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
          title: "Filter",
          titleColor: AppColor.black,
          leadingIconOnTap: (){}
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [


          ],
        ),
      ),
    );
  }
}
