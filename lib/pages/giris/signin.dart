import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kgsyks_destek/colors/colors.dart';
import 'package:kgsyks_destek/pages/ana_ekran/ana_ekran.dart';
import 'package:kgsyks_destek/routes/routes.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  String? selectedClass;
  String? selectedClass2;
  String? selectedClass3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Text("Hesap Oluştur", style: TextStyle(fontSize: 30)),
              const SizedBox(height: 15),
              const TextField(
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  labelText: "Mail",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              const TextField(
                textInputAction: TextInputAction.next,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Şifre',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              const TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Şifre tekrar giriniz.',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              _buildDropdown(
                title: "Sınıf Seçiniz",
                value: selectedClass,
                items: [
                  for (var i = 5; i <= 12; i++)
                    DropdownMenuItem(value: "$i", child: Text("$i")),
                  const DropdownMenuItem(value: "13", child: Text("Mezun")),
                ],
                onChanged: (value) => setState(() => selectedClass = value),
              ),
              _buildDropdown(
                title: "Sınav Seçiniz",
                value: selectedClass2,
                items: const [
                  DropdownMenuItem(value: "1", child: Text("YKS")),
                  DropdownMenuItem(value: "2", child: Text("LGS")),
                ],
                onChanged: (value) => setState(() => selectedClass2 = value),
              ),
              _buildDropdown(
                title: "Alan Seçiniz",
                value: selectedClass3,
                items: const [
                  DropdownMenuItem(value: "1", child: Text("SAYISAL")),
                  DropdownMenuItem(value: "2", child: Text("EŞİT AĞIRLIK")),
                  DropdownMenuItem(value: "3", child: Text("SÖZEL")),
                ],
                onChanged: (value) => setState(() => selectedClass3 = value),
              ),
              SizedBox(height: 10),
              const TextField(
                textInputAction: TextInputAction.next,
                obscureText: true,
                decoration: InputDecoration(
                  labelText:
                      'Kurum Kodu (yoksa boş bırakınız)', // yalnız sayı olabilir duruma göre
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryContainer,
                  ),
                  onPressed: () {
                    context.goNamed(AppRoute.anaekran.name);
                  },
                  child: const Text('Giriş Yap'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDropdown({
    required String title,
    required String? value,
    required List<DropdownMenuItem<String>> items,
    required ValueChanged<String?> onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Expanded(child: Text(title, style: const TextStyle(fontSize: 18))),
          DropdownButton<String>(
            value: value,
            hint: Text(title),
            items: items,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}
