import 'package:flutter/material.dart';
import 'package:latihan_login/pages/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BerandaPage extends StatelessWidget {
  const BerandaPage({super.key});

  Future<void> logout(BuildContext context) async {
    final pref = await SharedPreferences.getInstance();
    await pref.remove('isLogin');

    if (!context.mounted) return;


    //akan dipindahkan ke halaman login !!!
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 200),

              //tittle
              const Text(
                'Hallo, \nSelamat datang, Atmin',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 79),

              //Tombol Logout
              SizedBox(
                width: double.infinity,
                height: 44,
                child: ElevatedButton(
                  onPressed: () => logout(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFA3C3C),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    "Logout",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
            ],
          )
        )
      ),
    );
  }
}


