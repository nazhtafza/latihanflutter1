import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  TextEditingController ctrAngka1 = new TextEditingController();
  TextEditingController ctrAngka2 = new TextEditingController();
  bool hasiljumlah = false;
  String hasiljumlahtext = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(15),
              child: TextFormField(
                controller: ctrAngka1,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(hintText: "Masukkan angka 1"),
              ),
            ),
            Container(
              margin: EdgeInsets.all(15),
              child: TextFormField(
                controller: ctrAngka2,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(hintText: "Masukkan angka 2"),
              ),
            ),
            Container(
              margin: EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.all(5),
                    child: ElevatedButton(
                      onPressed: () {
                        int angkasatu = int.parse(ctrAngka1.text);
                        int angkadua = int.parse(ctrAngka2.text);
                        hasiljumlahtext = (angkasatu + angkadua).toString();

                        setState(() {
                          hasiljumlah = true;
                        });
                      },
                      child: Text("+"),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.green,
                        onPrimary: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(5),
                    child: ElevatedButton(
                      onPressed: () {
                        int angkasatu = int.parse(ctrAngka1.text);
                        int angkadua = int.parse(ctrAngka2.text);
                        hasiljumlahtext = (angkasatu - angkadua).toString();

                        setState(() {
                          hasiljumlah = true;
                        });
                      },
                      child: Text("-"),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.green,
                        onPrimary: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(5),
                    child: ElevatedButton(
                      onPressed: () {
                        int angkasatu = int.parse(ctrAngka1.text);
                        int angkadua = int.parse(ctrAngka2.text);
                        hasiljumlahtext = (angkasatu * angkadua).toString();

                        setState(() {
                          hasiljumlah = true;
                        });
                      },
                      child: Text("*"),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.green,
                        onPrimary: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(5),
                    child: ElevatedButton(
                      onPressed: () {
                        int angkasatu = int.parse(ctrAngka1.text);
                        int angkadua = int.parse(ctrAngka2.text);
                        hasiljumlahtext = (angkasatu / angkadua).toString();

                        setState(() {
                          hasiljumlah = true;
                        });
                      },
                      child: Text("/"),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.green,
                        onPrimary: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(15),
              child: Text(
                hasiljumlah == false ? "Hasil" : hasiljumlahtext,
                style: TextStyle(fontSize: 25, color: Colors.green),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
