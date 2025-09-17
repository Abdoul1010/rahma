import 'package:flutter/material.dart';

class ResponsiveServicesSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Déterminer le nombre de colonnes selon la largeur
        int crossAxisCount = _getCrossAxisCount(constraints.maxWidth);
        double screenWidth = constraints.maxWidth;
        
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(width: 1, color: Colors.blue.withOpacity(0.3)),
            boxShadow: [
              BoxShadow(
                color: Colors.blue.withOpacity(0.1),
                blurRadius: 10,
                spreadRadius: 1,
              ),
            ],
          ),
          child: AnimatedContainer(
            duration: Duration(seconds: 17),
            width: double.infinity,
            padding: EdgeInsets.all(_getPadding(screenWidth)),
            decoration: BoxDecoration(
              color: Color.fromRGBO(39, 39, 48, 1),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(width: 0.5, color: Colors.blueGrey),
            ),
            child: Column(
              children: [
                // Titre principal
                Text(
                  "• Ce que nous savons faire",
                  style: TextStyle(
                    fontSize: _getTitleFontSize(screenWidth),
                    color: Colors.blue,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                
                SizedBox(height: _getSpacing(screenWidth) * 0.5),
                
                // Sous-titre avec texte riche
                Text.rich(
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: _getSubtitleFontSize(screenWidth),
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    height: 1.2,
                  ),
                  TextSpan(
                    children: [
                      TextSpan(text: "Concevoir des solutions"),
                      TextSpan(
                        text: " personnalisées\npour répondre à vos besoins",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                
                SizedBox(height: _getSpacing(screenWidth)),
                
                // Grille responsive des services
                _buildResponsiveGrid(context, crossAxisCount, screenWidth),
                
                SizedBox(height: _getSpacing(screenWidth)),
                
                // Texte de contact
                _buildContactText(screenWidth),
              ],
            ),
          ),
        );
      },
    );
  }

  // Détermine le nombre de colonnes selon la largeur
  int _getCrossAxisCount(double width) {
    if (width < 600) return 1;        // Mobile
    if (width < 900) return 2;        // Tablette
    if (width < 1200) return 3;       // Desktop petit
    return 3;                         // Desktop large
  }

  // Padding adaptatif
  double _getPadding(double width) {
    if (width < 600) return 12;
    if (width < 900) return 16;
    return 20;
  }

  // Espacement adaptatif
  double _getSpacing(double width) {
    if (width < 600) return 16;
    if (width < 900) return 20;
    return 24;
  }

  // Taille de police du titre
  double _getTitleFontSize(double width) {
    if (width < 600) return 16;
    if (width < 900) return 18;
    return 19;
  }

  // Taille de police du sous-titre
  double _getSubtitleFontSize(double width) {
    if (width < 600) return 24;
    if (width < 900) return 30;
    return 37;
  }

  // Taille de police des cartes
  double _getCardTitleFontSize(double width) {
    if (width < 600) return 16;
    if (width < 900) return 17;
    return 19;
  }

  double _getCardDescriptionFontSize(double width) {
    if (width < 600) return 12;
    if (width < 900) return 12;
    return 13;
  }

  // Construction de la grille responsive
  Widget _buildResponsiveGrid(BuildContext context, int crossAxisCount, double screenWidth) {
    List<Map<String, String>> services = [
      {
        'category': 'Mobile - WEB',
        'title': 'DÉVELOPPEMENT d\'APPLICATION MOBILE et WEB',
        'description': 'Conception et développement d\'applications mobiles, Android et iOS et sites web e-commerce, vitrines ou institutionnels'
      },
      {
        'category': 'API',
        'title': 'DÉVELOPPEMENT d\'API',
        'description': 'Conception et développement d\'API évolutives pour les applications web et mobiles'
      },
      {
        'category': 'DESIGN',
        'title': 'DESIGN - IDENTITÉ VISUELLE',
        'description': 'Conception graphique, UX/UI design, illustrations, supports de communication (affiches, flyers, réseaux sociaux…)'
      },
      {
        'category': 'MAINTENANCE',
        'title': 'MAINTENANCE & SUIVI',
        'description': 'Nous assurons la maintenance technique de vos plateformes : mises à jour, sécurité, correctifs, optimisation… Pour que votre outil reste stable, rapide et opérationnel'
      },
      {
        'category': 'REFONTE',
        'title': 'REFONTE - OPTIMISATION',
        'description': 'Nous analysons votre site, application ou identité visuelle, puis proposons une refonte sur-mesure : plus moderne, plus claire, mieux alignée avec vos objectifs et vos utilisateurs'
      },
      {
        'category': 'FORMATIONS',
        'title': 'FORMATION ET ACCOMPAGNEMENT',
        'description': 'Transmission de compétences à des apprenants débutants, formation en technologies web et mobile, infographie, création de contenus pédagogiques, supervision de mini-projets'
      },
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        childAspectRatio: _getChildAspectRatio(screenWidth, crossAxisCount),
        crossAxisSpacing: _getGridSpacing(screenWidth),
        mainAxisSpacing: _getGridSpacing(screenWidth),
      ),
      itemCount: services.length,
      itemBuilder: (context, index) {
        return _buildServiceCard(services[index], screenWidth);
      },
    );
  }

  // Ratio d'aspect adaptatif pour les cartes
  double _getChildAspectRatio(double width, int crossAxisCount) {
    if (width < 600) return 0.8;      // Mobile : cartes plus hautes
    if (crossAxisCount == 2) return 0.9;  // Tablette
    return 1.1;                       // Desktop : cartes plus larges
  }

  // Espacement de la grille
  double _getGridSpacing(double width) {
    if (width < 600) return 8;
    if (width < 900) return 12;
    return 16;
  }

  // Construction d'une carte de service
  Widget _buildServiceCard(Map<String, String> service, double screenWidth) {
    return Container(
      padding: EdgeInsets.all(_getCardPadding(screenWidth)),
      decoration: BoxDecoration(
        color: Color.fromRGBO(39, 39, 48, 1),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(width: 0.5, color: Colors.blueGrey),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            service['category']!,
            style: TextStyle(
              fontSize: _getCardTitleFontSize(screenWidth),
              color: Colors.blue,
              fontWeight: FontWeight.w600,
            ),
          ),
          
          SizedBox(height: 8),
          
          Text(
            service['title']!,
            style: TextStyle(
              fontSize: _getCardTitleFontSize(screenWidth),
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
          
          SizedBox(height: 8),
          
          Expanded(
            child: Text(
              service['description']!,
              style: TextStyle(
                color: Colors.grey,
                fontSize: _getCardDescriptionFontSize(screenWidth),
                height: 1.3,
              ),
              overflow: TextOverflow.fade,
            ),
          ),
        ],
      ),
    );
  }

  // Padding des cartes
  double _getCardPadding(double width) {
    if (width < 600) return 12;
    if (width < 900) return 16;
    return 20;
  }

  // Texte de contact responsive
  Widget _buildContactText(double screenWidth) {
    double fontSize = screenWidth < 600 ? 14 : 16;
    
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: _getPadding(screenWidth)),
      child: Text.rich(
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontSize: fontSize,
          height: 1.4,
        ),
        TextSpan(
          children: [
            TextSpan(
              text: "Excité de prendre de nouveaux projets et de collaborer, discutons de vos idées.\nN'hésitez pas à ",
            ),
            TextSpan(
              text: "nous contacter ",
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.w600,
              ),
            ),
            TextSpan(text: "!"),
          ],
        ),
      ),
    );
  }
}