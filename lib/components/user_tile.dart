import 'package:flutter/material.dart';
import 'package:listadeusuario/models/user.dart';
import 'package:listadeusuario/provider/users.dart';
import 'package:provider/provider.dart';

class UserTile extends StatelessWidget {
  final User user;
  const UserTile(this.user);

  @override
  Widget build(BuildContext context) {
    final avatar = user.avatarUrl == null || user.avatarUrl.isEmpty
        ? CircleAvatar(
            child: Icon(
            Icons.person,
            color: Colors.white,
          ))
        : CircleAvatar(backgroundImage: NetworkImage(user.avatarUrl));
    return ListTile(
      leading: avatar,
      title: Text(user.name),
      subtitle: Text(user.email),
      trailing: Container(
        width: 100,
        child: Row(
          children: <Widget>[
            IconButton(
              color: Colors.orange,
              onPressed: () {},
              icon: Icon(Icons.edit),
            ),
            IconButton(
              color: Colors.red,
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                          title: Text('Excluir usuário'),
                          content: Text('Tem certeza?'),
                          actions: <Widget>[
                            ElevatedButton(
                              child: Text('Não'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                            ElevatedButton(
                              child: Text('Sim'),
                              onPressed: () => Navigator.of(context).pop(true),
                            ),
                          ],
                        )).then((confirmed) => {
                      if (confirmed)
                        {
                          Provider.of<Users>(context, listen: false).remove(user),
                        }
                    });
              },
              icon: Icon(Icons.delete),
            ),
          ],
        ),
      ),
    );
  }
}
