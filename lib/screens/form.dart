import 'package:flutter/material.dart';
import 'package:flutter_widgets_ui/models/language.dart';

class FormLanguageWidget extends StatelessWidget {
  FormLanguageWidget({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _detailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Nova linguagem")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                      hintText: "Nome da linguagem",
                      labelText: "Nome da linguagem"),
                  controller: _nameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Insira o nome da linguagem';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      hintText: "Descrição da linguagem",
                      labelText: "Descrição da linguagem"),
                  controller: _detailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Insira o descrição da linguagem';
                    }
                    return null;
                  },
                ),
                Padding(
                    padding: const EdgeInsets.only(
                      top: 16,
                    ),
                    child: ElevatedButton(
                      child: const Text('Salvar'),
                      onPressed: () {
                        if(_formKey.currentState!.validate()){
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Processing Data')),
                          );
                          var language = Language(_nameController.text, _detailController.text);
                          Navigator.pop(context,  language);
                        }
                      },
                    ))
              ],
            )),
      ),
    );
  }
}
