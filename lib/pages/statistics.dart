import 'package:flutter/material.dart';

class StatisticsPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Informations sur les maladies auditives'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Les maladies auditives en France et dans le monde :',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                'En France, les maladies auditives sont un problème de santé publique majeur. Selon les statistiques, environ 6 millions de personnes souffrent de troubles de l\'audition, ce qui représente environ 1 personne sur 10. Ces troubles auditifs peuvent être causés par divers facteurs, notamment le vieillissement, l\'exposition au bruit excessif, les infections de l\'oreille, les traumatismes crâniens, les maladies génétiques, etc.',
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 20.0),
              Image.asset(
                'lib/assets/audioton-oms.png',
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.fitWidth,
              ),
              SizedBox(height: 20.0),
              Text(
                'Dans le monde entier, les maladies auditives affectent des centaines de millions de personnes. Selon l\'Organisation mondiale de la santé (OMS), environ 466 millions de personnes souffrent de troubles de l\'audition incapacitants, dont 34 millions d\'enfants. Les principales causes de ces troubles comprennent également l\'exposition au bruit, les infections, le vieillissement et d\'autres facteurs environnementaux et génétiques.',
                style: TextStyle(fontSize: 16.0),
              ),
              //SizedBox(height: 20.0),
              //Image.network(
                //'lib/assets/journee_mond_audi.png',
                //width: MediaQuery.of(context).size.width,
                //fit: BoxFit.fitWidth,
              //),
              SizedBox(height: 20.0),
              Text(
                'Il est important de sensibiliser le public aux maladies auditives, de promouvoir la prévention et le dépistage précoce, ainsi que de fournir un accès adéquat aux soins et aux dispositifs d\'assistance pour améliorer la qualité de vie des personnes atteintes de ces troubles.',
                style: TextStyle(fontSize: 16.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
