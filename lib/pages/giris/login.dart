import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kgsyks_destek/colors/colors.dart';
import 'package:kgsyks_destek/routes/routes.dart';
import '../../lang/locale_keys.g.dart';

class LogInView extends StatelessWidget {
  const LogInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(vertical: 20.0),
              child: Text("Hoşgeldiniz", style: TextStyle(fontSize: 30)),
            ),
            SizedBox(height: 50),
            TextField(
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                labelText: LocaleKeys.logIn_gmail.tr(),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: LocaleKeys.logIn_password.tr(),
                border: OutlineInputBorder(),
              ),
            ),
            //SizedBox(height: 5),
            Container(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: Text("Şifremi Unuttum"),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryContainer,
              ),
              onPressed: () {
                context.goNamed(AppRoute.signin.name);
              },

              child: const Text('Giriş Yap'),
            ),
          ],
        ),
      ),
    );
  }
}
