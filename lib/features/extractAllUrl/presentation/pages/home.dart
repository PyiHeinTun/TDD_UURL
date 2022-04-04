import 'package:flutter/material.dart';
import 'package:flutter_tdd_uurl/core/constant/name.dart';
import 'package:flutter_tdd_uurl/core/platform/screen_size.dart';
import 'package:flutter_tdd_uurl/features/extractAllUrl/presentation/widgets/text_w_btn.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = ScreenSize().width(context);
    double height = ScreenSize().height(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(APP_NAME),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 0.1 * width,
              vertical: 0.01 * height,
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 0.05 * height,
                ),
                //Detail Extract Url
                Container(
                  height: height / 1,
                  child: const Placeholder(),
                ),
                SizedBox(
                  height: 0.08 * height,
                ),
                //TextField
                TextAndButton(height: height, width: width),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
