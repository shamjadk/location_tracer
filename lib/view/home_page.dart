import 'package:flutter/material.dart';
import 'package:location_tracer/view/widgets/button_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff333333),
        title: const Text(
          'Test App',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(bottom: 24),
              color: const Color(0xff333333),
              child: Column(
                children: [
                  ButtonWIdget(
                    buttonName: 'Request Location Permission',
                    onPressed: () {},
                    buttonColor: const Color(0xFF2f80ed),
                  ),
                  ButtonWIdget(
                    buttonName: 'Request Notification Permission',
                    onPressed: () {},
                    buttonColor: const Color(0xFFf2c94c),
                  ),
                  ButtonWIdget(
                    buttonName: 'Start Location Update',
                    onPressed: () {},
                    buttonColor: const Color(0xFF27ae60),
                  ),
                  ButtonWIdget(
                    buttonName: 'Stop Location Update',
                    onPressed: () {},
                    buttonColor: const Color(0xFFeb5757),
                  ),
                ],
              ),
            ),
            // SizedBox(
            //   height: MediaQuery.sizeOf(context).height,
            //   child: ListView.builder(
            //     shrinkWrap: true,
            //     // physics: const ClampingScrollPhysics(),
            //     itemCount: ref.watch(locationProvider).location.length,
            //     itemBuilder: (context, index) {
            //       final data = ref.watch(locationProvider).location[index];
            //       return Padding(
            //         padding: const EdgeInsets.symmetric(
            //             horizontal: 24, vertical: 12),
            //         child: Container(
            //           // height: 70,
            //           width: double.infinity,
            //           decoration: BoxDecoration(
            //             borderRadius: BorderRadius.circular(8),
            //             color: const Color(0xFFf2f2f2),
            //           ),
            //           padding: const EdgeInsets.symmetric(horizontal: 16),
            //           child: Column(
            //             crossAxisAlignment: CrossAxisAlignment.start,
            //             mainAxisAlignment: MainAxisAlignment.center,
            //             children: [
            //               Text(
            //                 "Request ${index + 1}",
            //                 style: const TextStyle(
            //                   fontSize: 18,
            //                   fontWeight: FontWeight.bold,
            //                 ),
            //               ),
            //               Row(
            //                 mainAxisAlignment:
            //                     MainAxisAlignment.spaceBetween,
            //                 children: [
            //                   Text(
            //                     "Lat :${data.lat.toString()}",
            //                   ),
            //                   Text(
            //                     "Lng :${data.lon.toString()}",
            //                   ),
            //                   Text(
            //                     "Speed : ${data.speed.toString()}",
            //                   )
            //                 ],
            //               )
            //             ],
            //           ),
            //         ),
            //       );
            //     },
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
