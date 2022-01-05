import 'package:calculator_pizza/styles.dart';
import 'package:flutter/material.dart';

class PageRegistration extends StatelessWidget {
  const PageRegistration({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 80),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.face),
                  SizedBox(width: 10),
                  Text('Регистрация',
                      style: headerTextStyle, textAlign: TextAlign.center)
                ],
              ),
              Divider(
                color: Colors.grey[400],
                height: 30,
                thickness: 1,
                indent: 10,
                endIndent: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 38, right: 38),
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    children: const [
                      Text(
                          'Чтобы зарегистрироваться, введите свой номер телефона и почту',
                          style: registrSecondTextStyle,
                          textAlign: TextAlign.center),
                      SizedBox(height: 14),
                      Text('Телефон',
                          style: registrPrimaryTextStyle,
                          textAlign: TextAlign.center),
                      SizedBox(height: 6),
                      TextField(
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xFFeceff1),
                          enabledBorder: borderStyle,
                          focusedBorder: borderStyle,
                          labelText: '+7',
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text('Почта',
                          style: registrPrimaryTextStyle,
                          textAlign: TextAlign.center),
                      SizedBox(height: 6),
                      TextField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xFFeceff1),
                          enabledBorder: borderStyle,
                          focusedBorder: borderStyle,
                        ),
                      ),
                      SizedBox(height: 24),
                      Text(
                          'Вам придёт четырёхзначный код, который будет вашим паролем',
                          style: registrSecondTextStyle,
                          textAlign: TextAlign.center),
                      SizedBox(height: 14),
                      Text(
                          'Изменить пароль можно будет в личном кабинете после регистрации',
                          style: registrSecondTextStyle,
                          textAlign: TextAlign.center),
                      SizedBox(height: 32),
                    ],
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Отправить код'),
                style: ElevatedButton.styleFrom(
                    primary: const Color(0xFF0079D0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(36),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
