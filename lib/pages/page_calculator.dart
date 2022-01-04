import 'package:calculator_pizza/const.dart';
import 'package:flutter/material.dart';
import 'package:sliding_switch/sliding_switch.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';


class PageCalculator extends StatefulWidget {
  const PageCalculator({Key? key}) : super(key: key);

  @override
  _PageCalculatorState createState() => _PageCalculatorState();
}

enum Sauce { spicy, sweetAndSour, cheesy }

class _PageCalculatorState extends State<PageCalculator> {
  bool _isSlimDough = false;
  int cost = 100;
  double size = 40;
  Sauce? _sauce = Sauce.spicy;
  bool _cheese = true;

  void _onSaucesChange(Sauce? value) {
    setState(() {
      _sauce = value;
    });
  }

  int calcCost() {
    cost = size.round() + 100; // к размеру пиццы прибавляем базовую стоимость пиццы

    if (_isSlimDough == true) cost += 30; // к базовой стоимости теста добавляем 30
    if (_cheese == true) cost += 40;

    switch (_sauce) {
      case Sauce.spicy:
        cost += 10;
        break;
      case Sauce.sweetAndSour:
        cost += 20;
        break;
      case Sauce.cheesy:
        cost += 30;
        break;
      default:
        Sauce.spicy;
        break;
    }
    return cost;
  } // расчёт стоимости пиццы

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [Image.asset('assets/pizza.png')],
            ),
            const SizedBox(height: 33),
            const Text('Калькулятор пиццы',
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.w600)),
            const SizedBox(height: 9),
            const Text('Выберите параметры:',
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.w600)),
            const SizedBox(height: 33),
            SizedBox(
              width: 400,
              child: SlidingSwitch(
                value: false,
                width: 400,
                height: 30,
                onChanged: (bool value) {
                  _isSlimDough = value;
                  setState(() {
                    calcCost();
                  });
                },
                onTap: () {},
                onDoubleTap: () {},
                onSwipe: () {},
                textOff: 'Обычное тесто',
                textOn: 'Тонкое тесто',
                colorOff: const Color(0xffFFFFFF),
                colorOn: const Color(0xffFFFFFF),
                background: const Color(0xFFEEEEEE),
                buttonColor: const Color(0xff0079D6),
                inactiveColor: const Color(0xFF757575),
              ),
            ),
            const SizedBox(height: 19),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Text('Размер:',
                    style:
                    TextStyle(fontSize: 21, fontWeight: FontWeight.normal)),
                SizedBox(height: 13),
              ],
            ),
            const SizedBox(height: 5),
            SizedBox(
              width: 400,
              child: SfSlider(
                  min: 20,
                  max: 60,
                  interval: 20,
                  showTicks: true,
                  showLabels: true,
                  value: size,
                  enableTooltip: false,
                  minorTicksPerInterval: 0,
                  stepSize: 20,
                  onChanged: (dynamic value) {
                    setState(() {
                      size = value;
                      calcCost();
                    });
                  }
              ),
            ),
            const SizedBox(height: 13),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Text('Соус:',
                    style:
                    TextStyle(fontSize: 21, fontWeight: FontWeight.w600)),
              ],
            ),
            RadioListTile(
              dense: true,
              title: const Text('Острый', style: TextStyle(fontSize: 18)),
              value: Sauce.spicy,
              groupValue: _sauce,
              onChanged: _onSaucesChange,
              controlAffinity: ListTileControlAffinity.trailing,
            ),
            const Divider(
              thickness: 1,
            ),
            RadioListTile(
              dense: true,
              title: const Text('Кисло-сладкий', style: radioTextStyle),
              value: Sauce.sweetAndSour,
              groupValue: _sauce,
              onChanged: _onSaucesChange,
              controlAffinity: ListTileControlAffinity.trailing,
            ),
            const Divider(
              thickness: 1,
            ),
            RadioListTile(
              dense: true,
              title: const Text('Сырный', style: radioTextStyle),
              value: Sauce.cheesy,
              groupValue: _sauce,
              onChanged: _onSaucesChange,
              controlAffinity: ListTileControlAffinity.trailing,
            ),
            const Divider(thickness: 1),
            const SizedBox(height: 18),
            Container(
              height: 56,
              child: Padding(
                padding:
                const EdgeInsets.only(left: 6, top: 8, bottom: 8),
                child: Row(
                  children: [
                    Image.asset('assets/cheese.png'),
                    const Padding(
                      padding: EdgeInsets.only(
                          left: 6, top: 8, bottom: 8, right: 10),
                      child: Text(
                        'Дополнительный сыр',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    const Expanded(child: SizedBox(width: 8)),
                    Switch(
                        value: _cheese,
                        onChanged: (bool value) {
                          setState(() {
                            _cheese = value;
                            calcCost();
                          });
                        })
                  ],
                ),
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.grey[200]),
              alignment: Alignment.center,
            ), // Switch
            SizedBox(
              height: 41,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text(
                    'Стоимость:',
                    style:
                    TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 34,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(36),
                  color: Colors.grey[200]),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(
                  '${calcCost()} руб',
                  style: radioTextStyle,
                  textAlign: TextAlign.center,
                ),
              ),
            ), // отображение расчёта стоимости
          ],
        ),
      ),
    );
  }
}

