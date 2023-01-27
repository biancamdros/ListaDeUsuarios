import 'package:flutter/material.dart';
import 'package:listadeusuario/models/user.dart';
import 'package:listadeusuario/provider/users.dart';
import 'package:provider/provider.dart';

class UserForm extends StatelessWidget {
  final _form = GlobalKey<FormState>();
  final Map<String, String> _formData = {};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulário do usuário'),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                final isValid = _form.currentState!.validate();
                if (isValid) {
                  _form.currentState!.save();
                  Provider.of<Users>(context, listen: false).put(
                    User(
                        id: _formData['id'].toString(), 
                        name: _formData['name'].toString(), 
                        email: _formData['email'].toString(), 
                        avatarUrl: _formData['avatarUrl'].toString(),
                    ),
                  );
                  Navigator.of(context).pop();
                }
              },
              icon: Icon(Icons.save))
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Form(
          key: _form,
          child: Column(children: <Widget>[
            TextFormField(
              decoration: InputDecoration(labelText: 'Nome'),
              onSaved: (value) => _formData['name'] = value!,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "Nome inválido";
                }
                if (value.trim().length < 3) {
                  return "Nome muito pequeno, mínimo exigido são 3 letras.";
                }
                return null;
              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'E-mail'),
              onSaved: (value) => _formData['email'] = value!,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "E-mail inválido";
                }
                if (value.trim().length < 3) {
                  return "E-mail curto ou inválido.";
                }
                return null;
              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'URL do Avatar'),
              onSaved: (value) => _formData['avatarUrl'] = value!,
            ),
          ]),
        ),
      ),
    );
  }
}
