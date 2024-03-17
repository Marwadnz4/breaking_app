import '../theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';

Widget loading() => const Center(
      child: CircularProgressIndicator(
        color: AppColors.yellow,
      ),
    );

Widget offline(Widget onlineWidget) => OfflineBuilder(
      connectivityBuilder: (
        BuildContext context,
        ConnectivityResult connectivity,
        Widget child,
      ) {
        final bool connected = connectivity != ConnectivityResult.none;
        return connected
            ? onlineWidget
            : Center(
                child: Container(
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'Can\'t connect .. check internet',
                        style: TextStyle(
                          fontSize: 22,
                          color: AppColors.gray,
                        ),
                      ),
                      Image.asset('assets/images/no_internet.png')
                    ],
                  ),
                ),
              );
      },
      child: loading(),
    );
