import 'package:flutter/material.dart';
import 'package:jiocinema_clone/Utilities/AppStyling.dart';
import 'package:jiocinema_clone/Utilities/Utilites.dart';

// class EventFilterScreen extends StatelessWidget {
//   const EventFilterScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: customAppBar(
//           title: "Filter",
//           titleColor: AppColor.black,
//           leadingIconOnTap: (){}
//       ),
//       body: const SingleChildScrollView(
//         padding: EdgeInsets.symmetric(horizontal: 25),
//         child: Column(
//           children: [
//
//           ],
//         ),
//       ),
//     );
//   }
// }

class EventFilterScreen extends StatefulWidget {
  const EventFilterScreen({super.key});

  @override
  State<EventFilterScreen> createState() => _EventFilterScreenState();
}

class _EventFilterScreenState extends State<EventFilterScreen> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return LayoutFilterScreen(
        mobileBody: Scaffold(
          appBar: AppBar(title: Text("Mobile View" , style: appTextStyle(fontType: FontType.bold , fontSize:  22 , textColor: AppColor.black),)
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AspectRatio(
                    aspectRatio: 16 / 9,
                    child: Container(
                     margin: const EdgeInsets.all(20),
                     color: AppColor.primaryColor.withOpacity(0.6),
                    ),
                  ),

                  Column(
                    children: List.generate(3, (index) {
                      return Container(
                        margin: const EdgeInsets.all(20),
                        height: 150,
                        color: index == 1 ?  AppColor.orange.withOpacity(0.6):AppColor.secondaryColor.withOpacity(0.6),
                      );
                    },)
                  )


                ],
              ),
            ),
          ),
        ),
        desktopBody: desktopBody()
    );
  }
}


class LayoutFilterScreen extends StatelessWidget {

  Widget mobileBody;
  Widget desktopBody;

  LayoutFilterScreen({super.key , required this.mobileBody , required this.desktopBody});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < 700 ) {
        return mobileBody;
      } else{
        return desktopBody;
      }
    },);
  }
}


Widget desktopBody() {
  return Scaffold(
    appBar: AppBar(title: Text("Desktop View" , style: appTextStyle(fontType: FontType.bold , fontSize:  22 , textColor: AppColor.black),)
    ),
    body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    child: Column(
                      children: [
                        AspectRatio(
                          aspectRatio: 16 / 9,
                          child: Container(
                            margin: const EdgeInsets.all(20),
                            color: AppColor.primaryColor.withOpacity(0.6),
                          ),
                        ),

                        Column(
                            children: List.generate(2, (index) {
                              return Container(
                                margin: const EdgeInsets.all(20),
                                height: 150,
                                color: AppColor.secondaryColor.withOpacity(0.6),
                              );
                            },)
                        )
                      ],
                    )
                ),

                Container(
                  margin: const EdgeInsets.all(20),
                  height: 600,
                  width: 150,
                  color: AppColor.orange.withOpacity(0.6)
                )
              ],
            ),
          ],
        ),
      ),
    ),
  );
}