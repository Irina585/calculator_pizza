import 'package:calculator_pizza/styles.dart';
import 'package:flutter/material.dart';


class PageEnter extends StatelessWidget {
  const PageEnter({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {


    return MaterialApp(
      home: Scaffold(
          body: Container(
            width: double.infinity,
            height: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 120,
                  ),
                  const SizedBox(
                    width: 110,
                    height: 84,
                    child: Image(
                      image: AssetImage('assets/dart_logo.png'),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Введите логин в виде 10 цифр номера телефона', textAlign: TextAlign.center,
                    style:
                    TextStyle(fontSize: 16, color: Color.fromRGBO(0, 0, 0, 0.6), fontWeight: FontWeight.normal),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const TextField(
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xFFeceff1),
                      enabledBorder: borderStyle,
                      focusedBorder: borderStyle,
                      labelText: '+7',
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xFFeceff1),
                      enabledBorder: borderStyle,
                      focusedBorder: borderStyle,
                      labelText: 'Пароль',
                    ),
                  ),
                  const SizedBox(
                    height: 28,
                  ),
                  SizedBox(
                      width: 154,
                      height: 42,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: const Text('Войти'),
                        style: ElevatedButton.styleFrom(
                            primary: const Color(0xFF0079D0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(36),
                            )),
                      )),
                  const SizedBox(
                    height: 62,
                  ),
                  InkWell(
                    child: const Text('Регистрация', style: linkTextStyle),
                    onTap: () {},
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    child: const Text('Забыли пароль?', style: linkTextStyle),
                    onTap: () {},
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
