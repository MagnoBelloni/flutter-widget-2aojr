import 'package:flutter/material.dart';
import 'package:flutter_widgets_ui/models/language.dart';

class PrincipalScreenWidget extends StatefulWidget {
  const PrincipalScreenWidget({super.key});

  @override
  State<PrincipalScreenWidget> createState() => _PrincipalScreenWidgetState();
}

class _PrincipalScreenWidgetState extends State<PrincipalScreenWidget> {
  List<Language> languages = [
    Language("React", "Meta framework"),
    Language("iOS", "Apple native language")
  ];

  final title = const Text("Minhas linguagens");
  final iconAdd = const Icon(Icons.add);
  final iconCircleOutlined = const Icon(Icons.circle_outlined);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: title,
        actions: [IconButton(onPressed: _goToForm, icon: iconAdd)],
      ),
      body: Column(
        children: [
          Center(
              child: Wrap(
            spacing: 10,
            children: _buildChips(),
          )),
          Expanded(
            child: ListView(children: _buildListItems()),
          )
        ],
      ),
    );
  }

  List<ChoiceChip> _buildChips() {
    return languages
        .map((language) => ChoiceChip(
              label: Text(language.name),
              selected: language.selected,
              onSelected: (value) {
                setState(() {
                  language.selected = value;
                });
              },
            ))
        .toList();
  }

  List<Widget> _buildListItems() {
    return languages
        .where((language) => language.selected)
        .map((language) => Card(
                child: ListTile(
              leading: iconCircleOutlined,
              title: Text(language.name),
              subtitle: Text(language.description),
            )))
        .toList();
  }

  void _goToForm() {
    Future future = Navigator.pushNamed(context, "/add");

    future.then((language) {
      language.selected = true;
      setState(() {
        languages.add(language);
      });
    });
  }
}
