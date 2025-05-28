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
                    launchUrl(Uri.parse('https://zelio-developer.botble.com/how-to-integrate-apis-in-nodejs-for-your-next-project'));
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
                ),*/
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
