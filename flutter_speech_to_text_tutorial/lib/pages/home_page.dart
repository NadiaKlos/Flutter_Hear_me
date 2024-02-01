import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mon Application Flutter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Action à effectuer lors de la connexion
                print('Connexion appuyée');
              },
              child: Text('Se connecter'),
            ),
            SizedBox(height: 16), // Espacement entre les boutons
            TextButton(
              onPressed: () {
                // Action à effectuer lors de l'inscription
                print('Inscription appuyée');
              },
              child: Text('S\'inscrire'),
            ),
            TextButton(
              onPressed: () {
                // Action à effectuer lors de la récupération du mot de passe
                print('Mot de passe oublié appuyé');
              },
              child: Text('Mot de passe oublié'),
            ),
          ],
        ),
      ),
    );
  }
}
