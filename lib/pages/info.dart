import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Un support technique ?'),
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
              title: Text('Email: nadia.godje@edu.devinci.fr'),
            ),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text('Téléphone: +331 23 45 67 89'),
            ),
            ListTile(
              leading: Icon(Icons.location_on),
              title: Text('Adresse: 12 Av. Léonard de Vinci, 92000, Courbevoie'),
            ),
          ],
        ),
      ),
    );
  }
}
