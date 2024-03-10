import 'package:flutter/material.dart';

import 'inscription_page.dart';
import 'login_page.dart';
import 'menu_deroulant.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          margin: EdgeInsets.only(top: 50), // Ajuster la valeur pour la position verticale souhaitée du titre
          child: Text(
            "",
            textAlign: TextAlign.center, 
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(top: 100), // Ajuster la valeur pour la position verticale souhaitée du logo
                child: Image.asset(
                  'lib/assets/logo_app.jpg',
                  width: 300,
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
                child: Text('Se connecter'),
              ),
              SizedBox(height: 16),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => InscriptionPage()),
                  );
                },
                child: Text('S\'inscrire'),
              ),
              SizedBox(height: 16),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyDropdownPage()),
                  );
                },
                child: Text('Se connecter en mode invité'),
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 14, 103, 18)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
