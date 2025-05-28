import 'package:flutter/material.dart';

class ContactForm extends StatefulWidget {
  const ContactForm({super.key});

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final _formKey = GlobalKey<FormState>();
  bool agreeTerms = false;

  // Contrôleurs
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final addressController = TextEditingController();
  final phoneController = TextEditingController();
  final subjectController = TextEditingController();
  final messageController = TextEditingController();

  void _submitForm() {
    if (_formKey.currentState!.validate() && agreeTerms) {
      // Traitement ici (envoi via HTTP, etc.)
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Message envoyé avec succès')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Veuillez remplir tous les champs obligatoires.')),
      );
    }
  }

  InputDecoration _inputDecoration(String label, {bool required = false}) {
    return InputDecoration(
      labelText: required ? "$label *" : label,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            spacing: 16,
            runSpacing: 30,
            children: [
              SizedBox(
                width: 300,
                child: TextFormField(
                  controller: nameController,
                  decoration: _inputDecoration('Nom', required: true),
                  validator: (value) =>
                  value == null || value.isEmpty ? 'Obligatoire' : null,
                ),
              ),
              SizedBox(
                width: 300,
                child: TextFormField(
                  controller: emailController,
                  decoration: _inputDecoration('Email', required: true),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) =>
                  value == null || !value.contains('@') ? 'Email invalide' : null,
                ),
              ),
              SizedBox(
                width: 300,
                child: TextFormField(
                  controller: addressController,
                  decoration: _inputDecoration('Adresse'),
                ),
              ),
              SizedBox(
                width: 300,
                child: TextFormField(
                  controller: phoneController,
                  decoration: _inputDecoration('Téléphone'),
                  keyboardType: TextInputType.phone,
                ),
              ),
              SizedBox(
                width: 616, // 2 x 300 + spacing
                child: TextFormField(
                  controller: subjectController,
                  decoration: _inputDecoration('Objet', required: true),
                  validator: (value) =>
                  value == null || value.isEmpty ? 'Obligatoire' : null,
                ),
              ),
              SizedBox(
                width: 616,
                child: TextFormField(
                  controller: messageController,
                  decoration: _inputDecoration('Message', required: true),
                  maxLines: 5,
                  validator: (value) =>
                  value == null || value.isEmpty ? 'Obligatoire' : null,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Checkbox(
                value: agreeTerms,
                onChanged: (val) => setState(() => agreeTerms = val ?? false),
              ),
              const Flexible(
                child: Text("J'accepte les Conditions et Politique de Confidentialité",
                style: TextStyle(color: Colors.white,),),
              ),
            ],
          ),
          const SizedBox(height: 16),
          ElevatedButton.icon(
            onPressed: _submitForm,
            icon: const Icon(Icons.call_made_rounded, color: Colors.white,),
            label: const Text("Envoyer", style: TextStyle(color: Colors.white),),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            ),
          )
        ],
      ),
    );
  }
}
