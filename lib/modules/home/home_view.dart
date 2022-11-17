import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:theme_provider/theme_provider.dart';

import '../../core.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          GestureDetector(
              child: Text(
                "data",
                style: ThemeProvider.themeOf(context).data.textTheme.headline1,
              ),
              onTap: (() {
                Get.snackbar("titulo :v ", 'Successfully created',
                    snackStyle: SnackStyle.FLOATING,
                    margin: EdgeInsets.all(10),
                    icon: Icon(LineIcons.accusoft),
                    backgroundGradient: LinearGradient(
                      colors: [
                        ThemeProvider.themeOf(context).data.colorScheme.primary,
                        ThemeProvider.themeOf(context).data.colorScheme.tertiary
                      ],
                    ),
                    snackPosition: SnackPosition.BOTTOM,
                    backgroundColor: ThemeProvider.themeOf(context)
                        .data
                        .colorScheme
                        .primaryVariant);
                print("object");
              }))
        ],
      ),
    );
  }
}
