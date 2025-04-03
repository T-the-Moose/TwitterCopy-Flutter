import 'package:flutter/material.dart';
import 'package:twitter/tweet.dart';

class TweetFormPage extends StatefulWidget {
  const TweetFormPage();

  @override
  State<TweetFormPage> createState() => _TweetFormPageState();
}

class _TweetFormPageState extends State<TweetFormPage> {
  int? _id;
  String? _profil;
  String? _message;
  String? _author;
  final _formKey = GlobalKey<FormState>();

  String? _validateField(String? value) {
    if (value!.isEmpty) {
      return 'Champs obligatoire';
    }

    return null;
  }

  void _onSubmit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      var tweet = Tweet(_id ?? 0, _profil ?? '', _message ?? '', _author ?? '', DateTime.now());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Flex(
          direction: Axis.vertical,
          children: [
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Votre pseudo',
                labelText: 'Auteur',
                labelStyle: TextStyle(color: Colors.blue),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),

              validator: _validateField,
              onSaved: (value) {
                _author = value;
              },
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Ecrivez votre texte',
                labelText: 'Contenu',
                labelStyle: TextStyle(color: Colors.blue),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              validator: _validateField,
              onSaved: (value) {
                _message = value;
              },
            ),
            Spacer(),
            FilledButton.tonal(
              onPressed: _onSubmit,
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
            ),
              child: Text('OK'),
            ),
          ],
        ),
      ),
    );
  }
}
