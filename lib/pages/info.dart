import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Informations de contact'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Contactez-nous',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            ListTile(
              leading: Icon(Icons.email),
              title: Text('Email: contact@example.com'),
            ),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text('Téléphone: +1234567890'),
            ),
            ListTile(
              leading: Icon(Icons.location_on),
              title: Text('Adresse: 123 Rue de l\'Exemple, Ville, Pays'),
            ),
          ],
        ),
      ),
    );
  }
}
