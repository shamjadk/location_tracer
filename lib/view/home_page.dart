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
              child: Column(
                children: [
                  ButtonWIdget(
                    buttonName: 'Request Location Permission',
                    onPressed: () async {
                      if (await isLocationEnabled()) {
                        /// Check if the app has permission
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
                        log("Hellow");
                        AwesomeNotifications()
                            .requestPermissionToSendNotifications();
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
                          title: 'Location update stoped',
                        ),
                      );
                    },
                    buttonColor: const Color(0xFFeb5757),
                  ),
                ],
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}
