import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'hover_zoom_image.dart';

class BlogCard extends StatelessWidget {
  final String imageUrl;
  final String category;
  final String date;
  final String title;
  final String description;
  final String link;

  const BlogCard({
    super.key,
    required this.imageUrl,
    required this.category,
    required this.date,
    required this.title,
    required this.description,
    required this.link,
  });

  @override
  Widget build(BuildContext context) {
    // Variables responsive basées sur MediaQuery
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    final isTablet = screenWidth >= 600 && screenWidth < 1024;

    // Tailles adaptatives
    final titleFontSize = isMobile ? 20.0 : isTablet ? 22.0 : 24.0;
    final dateFontSize = isMobile ? 14.0 : 16.0;
    final descriptionFontSize = isMobile ? 16.0 : 18.0;
    final categoryFontSize = isMobile ? 10.0 : 12.0;
    final contentPadding = isMobile ? 12.0 : 16.0;
    final categoryPadding = isMobile
        ? const EdgeInsets.symmetric(horizontal: 8, vertical: 4)
        : const EdgeInsets.symmetric(horizontal: 12, vertical: 6);

    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: isMobile ? 400 : isTablet ? 450 : 500,
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFFFFFFF), Color(0xFF272730)],
          ),
        ),
        child: Card(
          color: const Color(0xFF272730),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
          ),
          margin: const EdgeInsets.all(1),
          clipBehavior: Clip.antiAlias,
          elevation: 4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Image avec lien et bouton catégorie
              Stack(
                children: [
                  HoverZoomImageWithButton(
                    imageUrl: imageUrl,
                    onTap: () {
                      launchUrl(Uri.parse(link));
                    },
                  ),
                  Positioned(
                    bottom: isMobile ? 8 : 12,
                    left: isMobile ? 8 : 12,
                    child: Container(
                      padding: categoryPadding,
                      decoration: BoxDecoration(
                        color: const Color(0xFF272730),
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.white),
                      ),
                      child: Text(
                        category,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: categoryFontSize,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              // Contenu
              Padding(
                padding: EdgeInsets.all(contentPadding),
                child: Column(
                  children: [
                    Text(
                      date,
                      style: TextStyle(
                        fontSize: dateFontSize,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      title,
                      textAlign: TextAlign.center,
                      maxLines: isMobile ? 1 : 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        color: Colors.white,
                        fontSize: titleFontSize,
                        height: 1.2,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      description,
                      style: TextStyle(
                        fontSize: descriptionFontSize,
                        color: Colors.grey,
                        height: 1.4,
                      ),
                      textAlign: TextAlign.center,
                      maxLines: isMobile ? 1 : 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: isMobile ? 15 : 25),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/*
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'hover_zoom_image.dart';

class BlogCard extends StatelessWidget {
  final String imageUrl;
  final String category;
  final String date;
  final String title;
  final String description;
  final String link;

  const BlogCard({
    super.key,
    required this.imageUrl,
    required this.category,
    required this.date,
    required this.title,
    required this.description,
    required this.link,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16,),
          topRight: Radius.circular(16,),
        ),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFFFFFFF), Color(0xFF272730),],
        ),
      ),
      child: Card(
        color: Color(0xFF272730),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        ),
        margin: EdgeInsets.all(1),
        clipBehavior: Clip.antiAlias,
        elevation: 4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Image avec lien et bouton catégorie
            Stack(
              children: [
                HoverZoomImageWithButton(
                    imageUrl: imageUrl,
                    onTap: () {
                      launchUrl(Uri.parse(link));
                    },
                  ),

                Positioned(
                  bottom: 12,
                  left: 12,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Color(0xFF272730),
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.white),
                    ),
                    child: Text(
                      category,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                // Bouton d'action central (icône)
               */
/* Positioned.fill(
                  child: Center(
                    child: InkWell(
                      onTap: () {
                        // Action ou navigation vers lien
                        debugPrint('Naviguer vers $link');
                      },
                      child: Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        padding: const EdgeInsets.all(12),
                        child: const Icon(Icons.arrow_outward_rounded),
                      ),
                    ),
                  ),
                ),*//*

              ],
            ),

            // Contenu
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Text(
                    date,
                    style: const TextStyle(fontSize: 17, color: Colors.grey),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: Colors.white),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    description,
                    style: const TextStyle(fontSize: 18, color: Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 25,)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
*/

