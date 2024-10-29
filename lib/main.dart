import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  final biodata = <String, String>{};

  MainApp({super.key}) {
    biodata['name'] = 'Bersinggah 2.0 Coffee Space & Culinary';
    biodata['email'] = 'rizkanugaha31@gmail.com';
    biodata['phone'] = '+6285314240519';
    biodata['image'] = 'bersinggah.jpg';
    biodata['addr'] =
        'Jl. Pasekaran No.Rt 2, Rawa 1, Pasekaran, Kec. Batang, Kabupaten Batang, Jawa Tengah 51216';
    biodata['linkmap'] = 'https://maps.app.goo.gl/ewo3Zp9cZHFV6uFH8';
    biodata['desc'] =
        "'Bersinggah 2.0Coffee shopTOKO KOPI BERSINGGAH 2.0 Coffee Space & Culinary'";
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Bersinggah 2.0 Coffee Space & Culinary",
      home: Scaffold(
        appBar:
            AppBar(title: const Text("Bersinggah 2.0 Coffee Space & Culinary")),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              teksKotak(Colors.black, biodata['name'] ?? ''),
              SizedBox(height: 10),
              Image(image: AssetImage('assets/${biodata["image"] ?? ''}')),
              SizedBox(height: 10),
              Row(
                children: [
                  btnContact(Icons.alternate_email, Colors.green,
                      "mailto:${biodata['email']}"),
                  btnContact(Icons.mark_email_unread_rounded, Colors.blueAccent,
                      "https://wa.me/${biodata['phone']}"),
                  btnContact(
                      Icons.phone, Colors.deepPurple, "tel:${biodata['phone']}")
                ],
              ),
              SizedBox(height: 10),
              teksKotak(Colors.black38, 'DESKRIPSI'),
              SizedBox(height: 10),
              Text(
                biodata['desc'] ?? '',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              teksKotak(Colors.black38, 'LIST MENU'),
              SizedBox(height: 10),
              Row(
                children: [
                  gambarDenganTeks('assets/tomat.jpg', 'Jus Tomat'),
                  SizedBox(width: 20),
                  gambarDenganTeks('assets/kopsu.jpg', 'Kopi Susu'),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  gambarDenganTeks('assets/strawberry.jpg', 'Susu Strawberry'),
                  SizedBox(width: 20),
                  gambarDenganTeks('assets/cake.jpg', 'Cake Coklat Keju'),
                ],
              ),
              SizedBox(height: 20),
              teksKotak(Colors.black38, 'Alamat'),
              Row(
                children: [
                  btnContact(Icons.map, Colors.blue, "${biodata['linkmap']}"),
                ],
              ),
              // Ganti lat,long dengan koordinat
              Text(
                "${biodata['addr']}",
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              teksKotak(Colors.black38, 'Jam Buka Kafe'),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  textAttribute('Buka', "10.00 WIB"),
                  textAttribute('Tutup', "22.00 WIB"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Column gambarDenganTeks(String imagePath, String label) {
    return Column(
      children: [
        Image.asset(
          imagePath,
          width: 150,
          height: 150,
        ),
        SizedBox(height: 10),
        Text(label),
      ],
    );
  }

  Container teksKotak(Color bgColor, String teks) {
    return Container(
      padding: EdgeInsets.all(10),
      alignment: Alignment.center,
      width: double.infinity,
      decoration: BoxDecoration(color: bgColor),
      child: Text(
        teks,
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
      ),
    );
  }

  Row textAttribute(String judul, String teks) {
    return Row(
      children: [
        Container(
          width: 80,
          child: Text(
            "-$judul",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        Text(
          ":",
          style: TextStyle(fontSize: 18),
        ),
        Text(teks, style: TextStyle(fontSize: 18))
      ],
    );
  }

  Expanded btnContact(IconData icon, var color, String uri) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () {
          launch(uri);
        },
        child: Icon(icon),
        style: ElevatedButton.styleFrom(
            backgroundColor: color,
            foregroundColor: Colors.white,
            textStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            )),
      ),
    );
  }

  void launch(String uri) async {
    if (!await launchUrl(Uri.parse(uri))) {
      throw Exception('Tidak Dapat Memanggil : $uri');
    }
  }
}
