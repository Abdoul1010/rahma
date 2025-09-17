import 'package:flutter/material.dart';
import 'package:rahma_group/pages/responsive_screens/responsive_vision_section.dart';

import '../../commun/anime/circular_container.dart';

Widget build(BuildContext context) {
  final screenWidth = MediaQuery.of(context).size.width;
  final screenHeight = MediaQuery.of(context).size.height;
  
  // Breakpoints responsive
  bool isMobile = screenWidth < 768;
  bool isTablet = screenWidth >= 768 && screenWidth < 1200;
  bool isDesktop = screenWidth >= 1200;
  
  // Données des entreprises partenaires
  final List<Map<String, String>> companies = [
    {'logo': 'assets/logo/el.png', 'name': 'EL ENTERPRISES'},
    {'logo': 'assets/logo/Logo_Paradise.png', 'name': 'Paradise Perfume'},
    {'logo': 'assets/logo/sib.jpg', 'name': 'SIB'},
    {'logo': 'assets/logo/alhidaya.jpg', 'name': 'Alhidaya'},
    {'logo': 'assets/logo/holitex.jpg', 'name': 'Niger Holitex'},
    {'logo': 'assets/logo/mondial_sawki.jpg', 'name': 'Mondial Sawki'},
    {'logo': 'assets/logo/majestic.jpg', 'name': 'Majestic Event'},
    {'logo': 'assets/logo/rafiq.png', 'name': 'RAFIQ'},
  ];

  // Données des contacts
  final List<Map<String, dynamic>> contacts = [
    {
      'icon': Icons.facebook_outlined,
      'label': '[facebook]',
      'value': 'Rahma Matjar',
      'onPressed': () {},
    },
    {
      'icon': Icons.mail_outline,
      'label': '[email]',
      'value': 'rahmamatjar@gmail.com',
      'onPressed': () {},
    },
    {
      'icon': Icons.phone_outlined,
      'label': '[téléphone]',
      'value': '(+227) 80 76 76 90',
      'onPressed': () {},
    },
  ];

  return isMobile 
      ? _buildMobileLayout(companies, contacts, context)
      : _buildDesktopLayout(companies, contacts, context);
}

// Layout pour mobile (disposition verticale)
Widget _buildMobileLayout(List<Map<String, String>> companies, 
    List<Map<String, dynamic>> contacts, BuildContext context) {
  return Column(
    children: [
      // Section principale avec entreprises
      _buildCooperationSection(companies, contacts, true, context),
      SizedBox(height: 20),
      // Section valeurs
      _buildValuesSection(true, context),
    ],
  );
}

// Layout pour desktop/tablette (disposition horizontale)
Widget _buildDesktopLayout(List<Map<String, String>> companies, 
    List<Map<String, dynamic>> contacts, BuildContext context) {
  return Row(
    children: [
      Expanded(
        flex: 3,
        child: _buildCooperationSection(companies, contacts, false, context),
      ),
      SizedBox(width: 20),
      Expanded(
        flex: 2,
        child: _buildValuesSection(false, context),
      ),
    ],
  );
}

// Section coopération avec les entreprises
Widget _buildCooperationSection(List<Map<String, String>> companies, 
    List<Map<String, dynamic>> contacts, bool isMobile, BuildContext context) {
  final screenWidth = MediaQuery.of(context).size.width;
  
  return Stack(
    children: [
      AnimatedGradientBorder(
        borderSize: 1,
        glowSize: 1,
        animationTime: 17,
        gradientColors: [
          Colors.transparent,
          Colors.transparent,
          Colors.transparent,
          Colors.blue
        ],
        animationProgress: null,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(isMobile ? 12 : 16),
          decoration: BoxDecoration(
            color: Color.fromRGBO(39, 39, 48, 1),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(width: .5, color: Colors.blueGrey),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Titre
              Text(
                "• Coopération",
                style: TextStyle(
                  fontSize: isMobile ? 16 : 19,
                  color: Colors.blue,
                ),
              ),
              // Texte principal
              Text.rich(
                style: TextStyle(
                  fontSize: isMobile ? 24 : (screenWidth < 1200 ? 28 : 37),
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
                TextSpan(
                  children: [
                    TextSpan(text: "Plus de 10"),
                    TextSpan(
                      text: " entreprises\n",
                      style: TextStyle(color: Colors.grey),
                    ),
                    TextSpan(text: "nous font"),
                    TextSpan(
                      text: " confiance_",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              // Container avec logos des entreprises
              _buildCompaniesContainer(companies, isMobile),
              SizedBox(height: 20),
              // Section contact
              _buildContactSection(contacts, isMobile),
              SizedBox(height: 27),
            ],
          ),
        ),
      ),
      // Widget OrbitRadar positionné
      if (!isMobile)
        Positioned(
          bottom: 60,
          right: 60,
          child: OrbitRadar(),
        ),
    ],
  );
}

// Container avec les logos des entreprises
Widget _buildCompaniesContainer(List<Map<String, String>> companies, bool isMobile) {
  // Diviser les entreprises en groupes pour l'affichage
  final firstRow = companies.take(5).toList();
  final secondRow = companies.skip(5).toList();
  
  return Container(
    width: double.infinity,
    padding: EdgeInsets.all(isMobile ? 12 : 16),
    margin: EdgeInsets.symmetric(horizontal: isMobile ? 8 : 25),
    decoration: BoxDecoration(
      color: Color.fromRGBO(39, 39, 48, 1),
      borderRadius: BorderRadius.circular(20),
      border: Border.all(width: .5, color: Colors.blueGrey),
    ),
    child: Column(
      children: [
        _buildCompanyRow(firstRow, isMobile),
        if (secondRow.isNotEmpty) ...[
          SizedBox(height: isMobile ? 20 : 30),
          _buildCompanyRow(secondRow, isMobile),
        ],
      ],
    ),
  );
}

// Ligne d'entreprises
Widget _buildCompanyRow(List<Map<String, String>> companies, bool isMobile) {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      children: companies.map((company) => 
        Padding(
          padding: EdgeInsets.only(right: isMobile ? 12 : 20),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                company['logo']!,
                width: isMobile ? 25 : 30,
                height: isMobile ? 25 : 30,
                errorBuilder: (context, error, stackTrace) => 
                  Icon(Icons.business, size: isMobile ? 25 : 30, color: Colors.grey),
              ),
              SizedBox(width: 8),
              Text(
                company['name']!,
                style: TextStyle(
                  fontSize: isMobile ? 12 : 15,
                  color: Colors.blueGrey,
                ),
              ),
            ],
          ),
        ),
      ).toList(),
    ),
  );
}

// Section contact avec avatar et informations
Widget _buildContactSection(List<Map<String, dynamic>> contacts, bool isMobile) {
  return isMobile 
      ? _buildMobileContactSection(contacts)
      : _buildDesktopContactSection(contacts);
}

// Contact section pour mobile (disposition verticale)
Widget _buildMobileContactSection(List<Map<String, dynamic>> contacts) {
  return Column(
    children: [
      // Avatar
      Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          border: Border.all(color: Colors.blueGrey, width: .5),
          color: Colors.transparent,
        ),
        child: Container(
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            border: Border.all(color: Colors.blueGrey, width: .5),
          ),
          child: Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              border: Border.all(color: Colors.blueGrey, width: .5),
              color: Colors.pink[700],
            ),
          ),
        ),
      ),
      SizedBox(height: 16),
      // Informations de contact
      ...contacts.map((contact) => _buildContactItem(contact, true)),
    ],
  );
}

// Contact section pour desktop (disposition horizontale)
Widget _buildDesktopContactSection(List<Map<String, dynamic>> contacts) {
  return Row(
    children: [
      // Avatar
      Container(
        width: 100,
        height: 100,
        margin: EdgeInsets.only(left: 25),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          border: Border.all(color: Colors.blueGrey, width: .5),
          color: Colors.transparent,
        ),
        child: Container(
          width: 75,
          height: 75,
          margin: EdgeInsets.all(15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            border: Border.all(color: Colors.blueGrey, width: .5),
          ),
          child: Container(
            width: 75,
            height: 75,
            margin: EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              border: Border.all(color: Colors.blueGrey, width: .5),
              color: Colors.pink[700],
            ),
          ),
        ),
      ),
      // Informations de contact
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: contacts.map((contact) => _buildContactItem(contact, false)).toList(),
        ),
      ),
    ],
  );
}

// Item de contact individuel
Widget _buildContactItem(Map<String, dynamic> contact, bool isMobile) {
  return TextButton(
    onPressed: contact['onPressed'],
    child: Row(
      mainAxisSize: isMobile ? MainAxisSize.min : MainAxisSize.max,
      children: [
        Icon(
          contact['icon'],
          color: Colors.white,
          size: isMobile ? 20 : 23,
        ),
        SizedBox(width: 11),
        Text(
          contact['label'],
          style: TextStyle(
            fontSize: isMobile ? 14 : 17,
            color: Colors.grey,
          ),
        ),
        SizedBox(width: 11),
        Flexible(
          child: Text(
            contact['value'],
            style: TextStyle(
              fontSize: isMobile ? 14 : 17,
              color: Colors.pink[700],
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    ),
  );
}

// Section des valeurs (assumant que 'entries' est défini ailleurs)
Widget _buildValuesSection(bool isMobile, BuildContext context) {
  // Cette variable doit être définie dans votre contexte
  // final List<Map<String, String>> entries = [...];
  
  return Container(
    width: double.infinity,
    padding: EdgeInsets.all(isMobile ? 12 : 16),
    decoration: BoxDecoration(
      color: Color.fromRGBO(39, 39, 48, 1),
      borderRadius: BorderRadius.circular(20),
      border: Border.all(width: .5, color: Colors.blueGrey),
    ),
    child: Stack(
      children: [
        // Ligne verticale
        Positioned.fill(
          left: 20,
          top: 50,
          bottom: 50,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Container(
              width: 2,
              color: Colors.grey.shade800,
            ),
          ),
        ),
        // Contenu principal
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 4,
                  backgroundColor: Colors.blue,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    "Nos Valeurs – Ce qui guide Rahma Group",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: isMobile ? 14 : 16,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 26),
            // Ici vous devez mapper vos entries
            // ...entries.map((entry) => _buildValueEntry(entry, isMobile)),
          ],
        ),
        // Overlay gradient en bas
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: IgnorePointer(
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Color(0xFF272730),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

// Widget pour une entrée de valeur (à utiliser avec vos données 'entries')
Widget _buildValueEntry(Map<String, String> entry, bool isMobile) {
  return Padding(
    padding: EdgeInsets.only(left: 24, bottom: 27),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: Text(
            entry["title"]!,
            style: TextStyle(
              color: Colors.grey.shade400,
              fontSize: isMobile ? 14 : 16,
            ),
          ),
        ),
        SizedBox(width: 15),
        Expanded(
          flex: 3,
          child: Text(
            entry["content"]!,
            textAlign: TextAlign.justify,
            style: TextStyle(
              color: Colors.white,
              fontSize: isMobile ? 13 : 14,
            ),
          ),
        ),
      ],
    ),
  );
}