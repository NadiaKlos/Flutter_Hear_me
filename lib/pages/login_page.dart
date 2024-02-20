import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart'; // Importer GoogleSignIn
import 'package:hear_me/pages/transcription_audio_page.dart';

import 'inscription_page.dart'; // Importer la page d'inscription

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  bool _isObscure = true;

  void _togglePasswordVisibility() {
    setState(() {
      _isObscure = !_isObscure;
    });
  }

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

  Future<void> _login(BuildContext context) async {
    String email = emailController.text;
    String password = passwordController.text;
    try {
      // final credential =
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => TranscriptionAudioPage()),
      );
    } on FirebaseAuthException catch (e) {
      // if (e.code == 'unknown') {
      print('No user found for that email.');
      // }
      // else if (e.code == 'wrong-password') {
      //   print('Wrong password provided for that user.');
      // }
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
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: 'Email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            TextField(
              controller: passwordController,
              obscureText: _isObscure,
              decoration: InputDecoration(
                hintText: 'Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                      _isObscure ? Icons.visibility : Icons.visibility_off),
                  onPressed: _togglePasswordVisibility,
                ),
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () => _login(context),
              child: Text('Se connecter'),
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(
                    Color.fromARGB(255, 27, 172, 212)), // Couleur du texte en bleu
              ),
            ),
            SizedBox(height: 20), // Espacement augmenté entre les boutons
            ElevatedButton.icon(
              onPressed: () => _signInWithGoogle(context),
              icon: SizedBox(
                width: 30, // Ajustez cette valeur selon votre besoin
                child: Image.asset(
                    'lib/assets/google_logo.png'), // Remplacez-le par le chemin correct de votre logo Google
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
                foregroundColor: MaterialStateProperty.all<Color>(
                    const Color.fromARGB(255, 7, 23, 36)), // Couleur du texte en bleu
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
                backgroundColor: MaterialStateProperty.all<Color>(
                    Color.fromARGB(255, 242, 243, 243)), // Couleur de fond en bleu
              ),
            ),
          ],
        ),
      ),
    );
  }
}
