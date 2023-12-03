import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:login/shared/theme/colors.dart';
import 'package:login/shared/widgets/custom-text/custom-text.widget.dart';

class SplashScreenPage extends StatelessWidget {
  SplashScreenPage({Key? key}) : super(key: key) {
    Future.delayed(const Duration(seconds: 2)).then((value) => Modular.to.navigate('login'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsTheme.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            SizedBox(
              height: 16,
            ),
            CustomText(
              type: CustomTexts.paragraphBigRegular,
              text: 'Aplicativo exemplo - Login Flutter',
              color: ColorsTheme.neutral10,
            ),
          ],
        ),
      ),
    );
  }
}
