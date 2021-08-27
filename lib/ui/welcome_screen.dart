import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui/MainMenu.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/gojek_ilus.png'),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Selamat Datang di Gojek',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                    'Apakah kamu siap untuk menikmati dunia dengan tanpa batasan? Ayo sekarang!'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Login'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                    onPrimary: Colors.white,
                    padding: EdgeInsets.all(10.0),
                    minimumSize: Size(170, 20),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Register'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                    onPrimary: Colors.white,
                    padding: EdgeInsets.all(10),
                    minimumSize: Size(170, 20),
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MainMenu()),
                );
              },
              child: Text('Login dengan Facebook'),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue[900],
                onPrimary: Colors.white,
                padding: EdgeInsets.all(10),
                minimumSize: Size(350, 20),
              ),
            ),
            Text(
                'Untuk login dan registrasi, Saya setuju dengan kebijakan & privasi')
          ],
        ),
      ),
    );
  }
}
