import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart'; // Importer GoogleSignIn

import 'inscription_page.dart'; // Importer la page d'inscription

class LoginPage extends StatelessWidget {
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<void> _signInWithGoogle(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser != null) {
        print('Connecté avec Google: ${googleUser.displayName}');
        // Rediriger l'utilisateur vers la page suivante après la connexion réussie
        // Navigator.push(context, MaterialPageRoute(builder: (context) => NextPage()));
      } else {
        print('Connexion avec Google annulée');
      }
    } catch (error) {
      print('Erreur lors de la connexion avec Google: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Connexion'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              decoration: InputDecoration(labelText: 'Adresse e-mail'),
            ),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(labelText: 'Mot de passe'),
            ),
            ElevatedButton(
              onPressed: () {
                print('Formulaire de connexion soumis');
              },
              child: Text('Se connecter'),
            ),
            SizedBox(height: 20), // Espacement augmenté entre les boutons
            ElevatedButton.icon(
              onPressed: () => _signInWithGoogle(context),
              icon: SizedBox(
                width: 30, // Ajustez cette valeur selon votre besoin
                child: Image.asset('lib/assets/google_logo.png'), // Remplacez-le par le chemin correct de votre logo Google
              ),
              label: Text('Se connecter avec Google'),
            ),
            SizedBox(height: 20), // Espacement augmenté entre les boutons
            TextButton(
              onPressed: () {
                // Naviguer vers la page d'inscription
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => InscriptionPage()),
                );
              },
              child: Text('Pas encore de compte ?'), // Texte ajouté
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.blue), // Couleur du texte en bleu
              ),
            ),
            SizedBox(height: 20), // Espacement augmenté entre les boutons
            ElevatedButton(
              onPressed: () {
                // Naviguer vers la page d'inscription
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => InscriptionPage()),
                );
              },
              child: Text('S\'inscrire'), // Texte du bouton S'inscrire
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.blue), // Couleur de fond en bleu
              ),
            ),
          ],
        ),
      ),
    );
  }
}
