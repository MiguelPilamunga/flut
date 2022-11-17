import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:gym_app_movil/general/core.dart';
import 'package:gym_app_movil/modules/home/home_view.dart';
import 'package:theme_provider/theme_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
      saveThemesOnChange: true,
      loadThemeOnInit: false,
      onInitCallback: (controller, previouslySavedThemeFuture) async {
        String? savedTheme = await previouslySavedThemeFuture;
        if (savedTheme != null) {
          controller.setTheme(savedTheme);
        } else {
          Brightness platformBrightness =
              SchedulerBinding.instance?.window.platformBrightness ??
                  Brightness.light;
          if (platformBrightness == Brightness.dark) {
            controller.setTheme('darkmodeid');
          } else {
            controller.setTheme('lightmodeid');
          }
          controller.forgetSavedTheme();
        }
      },
      themes: <AppTheme>[
        AppTheme(
          id: "darkmodeid",
          description: "Custom Color Scheme",
          data: AppThemes.darkThemeData,
        ),
        AppTheme(
          id: "lightmodeid",
          description: "Custom Color Scheme",
          data: AppThemes.lightThemeData,
        )
      ],
      child: ThemeConsumer(
        child: Builder(
          builder: (themeContext) => GetMaterialApp(
            theme: ThemeProvider.themeOf(themeContext).data,
            title: 'Material App',
            home: HomePage(),
          ),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var controller = ThemeProvider.controllerOf(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Example App",
          style: ThemeProvider.themeOf(context).data.textTheme.headline1,
        ),
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              "data",
              style: ThemeProvider.themeOf(context).data.textTheme.headline2,
            ),
            Text(
              "data",
              style: ThemeProvider.themeOf(context).data.textTheme.headline3,
            ),
            Text(
              "data",
              style: ThemeProvider.themeOf(context).data.textTheme.headline4,
            ),
            Text(
              "data",
              style: ThemeProvider.themeOf(context).data.textTheme.bodyText1,
            ),
            Text(
              "data",
              style: ThemeProvider.themeOf(context).data.textTheme.bodyText2,
            ),
            Text(
              "data",
              style: ThemeProvider.themeOf(context).data.textTheme.subtitle1,
            ),
            Text(
              "data",
              style: ThemeProvider.themeOf(context).data.textTheme.subtitle2,
            ),
            _buildButton(
              text: "Next Theme",
              onPressed: controller.nextTheme,
            ),
            _buildButton(
              text: "Theme Dialog",
              onPressed: () {
                showDialog(context: context, builder: (_) => ThemeDialog());
              },
            ),
            _buildButton(
              text: "Second Screen",
              onPressed: () {
                Get.to(HomeView());
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton({required String text, VoidCallback? onPressed}) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: ElevatedButton(
        child: Text(text),
        onPressed: onPressed,
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Screen"),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text("Next Theme"),
          onPressed: ThemeProvider.controllerOf(context).nextTheme,
        ),
      ),
    );
  }
}

Widget _buildFooter(BuildContext context) {
  return ClipPath(
    clipper: FooterWaveClipper(),
    child: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          ThemeProvider.controllerOf(context).theme.data.colorScheme.primary,
          ThemeProvider.controllerOf(context).theme.data.colorScheme.tertiary
        ], begin: Alignment.center, end: Alignment.bottomRight),
      ),
      height: Get.height / 3,
    ),
  );
}

class FooterWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(size.width, 0.0);
    path.lineTo(size.width, size.height);
    path.lineTo(0.0, size.height);
    path.lineTo(0.0, size.height - 60);
    var secondControlPoint = Offset(size.width - (size.width / 6), size.height);
    var secondEndPoint = Offset(size.width, 0.0);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
