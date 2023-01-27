import 'package:flutter/material.dart';
import 'package:listadeusuario/provider/users.dart';
import 'package:listadeusuario/routes/app_routes.dart';
import 'package:listadeusuario/views/user_list.dart';
import 'package:provider/provider.dart';
import 'package:listadeusuario/views/user_form.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Users(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        routes: {
          AppRoutes.HOME: (_) => UserList(),
          AppRoutes.USER_FORM: (_) => UserForm(),
        },
      ),
    );
  }
}
