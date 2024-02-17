import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speech_to_text_tutorial/pages/login_page.dart';

class InscriptionPage extends StatefulWidget {
  @override
  _InscriptionPageState createState() => _InscriptionPageState();
}

class _InscriptionPageState extends State<InscriptionPage> {
  final TextEditingController _sexeController = TextEditingController();
  final TextEditingController _nomController = TextEditingController();
  final TextEditingController _prenomController = TextEditingController();
  final TextEditingController _mailController = TextEditingController();
  final TextEditingController _mdpController = TextEditingController();
  
  // Ajoutez les autres contrôleurs pour les champs du formulaire de la même manière

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inscription'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Formulaire d\'inscription',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _sexeController,
                decoration: InputDecoration(labelText: 'Sexe'),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _nomController,
                decoration: InputDecoration(labelText: 'Nom'),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _prenomController,
                decoration: InputDecoration(labelText: 'Prénom'),
              ),
              TextFormField(
                controller: _mailController,
                decoration: InputDecoration(labelText: 'Adresse mail'),
              ),
              TextFormField(
                controller: _mdpController,
                decoration: InputDecoration(labelText: 'Mot de passe'),
              ),
              // Ajoutez les autres champs du formulaire de la même manière
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text('S\'inscrire'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _submitForm() async {
    // Récupérer les données du formulaire
    String sexe = _sexeController.text;
    String nom = _nomController.text;
    String prenom = _prenomController.text;
    String mail = _mailController.text;
    String password = _mdpController.text;
    // Ajoutez les autres champs du formulaire de la même manière

    
      try {
    print("Nadia!!!!!!!!!!!!!!!!!!");

    final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: mail,
      password: password,
    );
    print("Nadia222222!!!!!!!!!!!!!!!!!!");
  } on FirebaseAuthException catch (e) {
    print(e.code);
    print("Nadia33333!!!!!!!!!!!!!!!!!!");

    if (e.code == 'unknown'){
      print("There is an error");
    }
    // if (e.code == 'weak-password') {
    //   print('The password provided is too weak.');
    // } else if (e.code == 'email-already-in-use') {
    //   print('The account already exists for that email.');
    // }
  } catch (e) {
    print(e);
  }


    try {
      // Ajouter les données à Firestore
      await FirebaseFirestore.instance.collection('users').add({
        'sexe': sexe,
        'nom': nom,
        'prenom': prenom,
        'mail': mail,
        // 'mdp': password,
        // Ajouter les autres champs du formulaire de la même manière
      });

      // Afficher un message de succès
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Inscription réussie')),
      );

      // Effacer les champs du formulaire après l'inscription réussie
      _sexeController.clear();
      _nomController.clear();
      _prenomController.clear();
      // Effacer les autres champs du formulaire de la même manière


      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    } catch (e) {
      // Afficher un message d'erreur s'il y a un problème lors de l'inscription
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erreur lors de l\'inscription')),
      );
      print('Erreur lors de l\'inscription : $e');
    }
  }
}

void main() {
  runApp(MaterialApp(
    home: InscriptionPage(),
  ));
}
