import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:location_tracer/controller/location_controller.dart';
import 'package:location_tracer/controller/provider/location_provider.dart';
import 'package:location_tracer/view/widgets/button_widget.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
              child: GridView(
                physics: const ClampingScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 500, mainAxisExtent: 65),
                children: [
                  ButtonWIdget(
                    buttonName: 'Request Location Permission',
                    onPressed: () async {
                      if (await isLocationEnabled()) {
                        if (await requestLocationPermission()) {
                          log('Location permission granted');
                        } else {
                          log('Location permission denied');
                        }
                      } else {
                        log('Location not enabled');
                      }
                    },
                    buttonColor: const Color(0xFF2f80ed),
                  ),
                  ButtonWIdget(
                    buttonName: 'Request Notification Permission',
                    onPressed: () {
                      {
                        AwesomeNotifications()
                            .requestPermissionToSendNotifications();
                        log("Notification permission granted");
                      }
                    },
                    buttonColor: const Color(0xFFf2c94c),
                  ),
                  ButtonWIdget(
                    buttonName: 'Start Location Update',
                    onPressed: () async {
                      if (await requestLocationPermission()) {
                        /// Check if the app has permission
                        Future.sync(() => showDialog(
                              context: context,
                              builder: ((context) {
                                return AlertDialog(
                                  title: const Text(
                                    'Do you want to start location tracing',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  actions: [
                                    TextButton(
                                        onPressed: (() {
                                          Navigator.pop(context);
                                        }),
                                        child: const Text('No')),
                                    TextButton(
                                      onPressed: () {
                                        ref
                                            .read(locationProvider.notifier)
                                            .startLocationTracing();
                                        AwesomeNotifications()
                                            .createNotification(
                                          content: NotificationContent(
                                            id: 10,
                                            channelKey: 'location-update',
                                            actionType: ActionType.Default,
                                            title: 'Location update started',
                                          ),
                                        );
                                        Navigator.pop(context);
                                      },
                                      child: const Text('Yes'),
                                    )
                                  ],
                                );
                              }),
                            ));
                      } else {
                        Future.sync(() => showDialog(
                              context: context,
                              builder: ((context) {
                                return const AlertDialog(
                                  title: Text('Alert'),
                                  content:
                                      Text('Place Enable Location permission'),
                                );
                              }),
                            ));
                      }
                    },
                    buttonColor: const Color(0xFF27ae60),
                  ),
                  ButtonWIdget(
                    buttonName: 'Stop Location Update',
                    onPressed: () {
                      ref.read(locationProvider.notifier).stopLocationTracing();
                      AwesomeNotifications().createNotification(
                        content: NotificationContent(
                          id: 11,
                          channelKey: 'location-update',
                          actionType: ActionType.Default,
                          title: 'Location updating stoped',
                        ),
                      );
                    },
                    buttonColor: const Color(0xFFeb5757),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 500, mainAxisExtent: 90),
                physics: const ClampingScrollPhysics(),
                shrinkWrap: true,
                itemCount: ref.watch(locationProvider).locations.length,
                itemBuilder: (context, index) {
                  final data = ref.watch(locationProvider).locations[index];
                  return Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    padding: const EdgeInsets.only(
                        left: 8, right: 56, top: 8, bottom: 8),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: const Color(0xFFf2f2f2),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Request ${index + 1}",
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Lat :${data.latitude.toStringAsFixed(3)}",
                            ),
                            Text(
                              "Lng :${data.longitude.toStringAsFixed(3)}",
                            ),
                            Text(
                              "Speed : ${data.speed.toStringAsFixed(0)}m",
                            )
                          ],
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
