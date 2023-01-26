import 'package:flutter/material.dart';
import 'package:listadeusuario/components/user_tile.dart';
import 'package:listadeusuario/models/user.dart';
import 'package:provider/provider.dart';
import 'package:listadeusuario/provider/users.dart';

class UserList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Users users = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Usuários'),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              users.put(
                  User(id: '77', name: 'Sofia', email: 'sofia@mail.com', avatarUrl: ''));
            },
            icon: Icon(Icons.add_circle_rounded),
          )
        ],
      ),
      body: ListView.builder(
          itemCount: users.count,
          itemBuilder: (ctx, i) => UserTile(users.byIndex(i))),
    );
  }
}
