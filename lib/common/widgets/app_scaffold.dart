import 'package:flutter/material.dart';
import 'package:testline_quiz_app/utils/sizes.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({
    super.key, 
    this.body, 
    this.appBar,
    this.image = "assets/images/bg_image.png",
    this.bottomNavigationBar
  });

  final Widget? body;
  final Widget? bottomNavigationBar;
  final AppBar? appBar;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: Stack(
            alignment: Alignment.center,
            children: [
                SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: Image.asset(
                        image, 
                        fit: BoxFit.cover
                    )
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: KSizes.defaultSpace),
                  child: body
                )
            ],
        ),
        bottomNavigationBar: bottomNavigationBar,
    );
  }
}