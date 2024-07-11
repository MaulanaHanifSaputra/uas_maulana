import 'package:flutter/material.dart';
import 'register.dart'; // Assuming Register widget is imported correctly from register.dart
import 'login.dart'; // Import Login.dart for navigation

class Halaman1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Cahya Amalia',
            style: TextStyle(
              fontFamily: 'RollerFont', // Using a new font
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
              ),
              child: Image.asset('assets/images/klinik1.png'), // Using an asset from pubspec.yaml
            ),
            SizedBox(height: 35),
            Text(
              'Rencanakan Kesehatanmu Dari Sekarang',
              style: TextStyle(
                fontFamily: 'CustomFont',
                fontSize: 60,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Text(
              'Daftar Sekarang atau Login Dengan Akun Anda',
              style: TextStyle(
                fontFamily: 'CustomFont',
                fontSize: 25,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFFa6c0fe), Color(0xFFf68084)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    minimumSize: Size(double.infinity, 50),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Login()), // Navigate to Login screen
                    );
                  },
                  child: ShaderMask(
                    shaderCallback: (bounds) => LinearGradient(
                      colors: [Color(0xFFa6c0fe), Color(0xFFf68084)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ).createShader(bounds),
                    child: Text(
                      'Masuk',
                      style: TextStyle(
                        fontFamily: 'CustomFont',
                        fontSize: 27,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
