import 'package:flutter/material.dart';

class UserForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulário do usuário'),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.save))
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Form(
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration:InputDecoration(labelText: 'Nome'),
              ),
              TextFormField(
                decoration:InputDecoration(labelText: 'E-mail'),
              ),
              TextFormField(
                decoration:InputDecoration(labelText: 'URL do Avatar'),
              ),
            ]
          ),
        ),
      ),
    );
  }
}
