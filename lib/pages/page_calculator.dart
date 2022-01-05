import 'package:calculator_pizza/strings.dart';
import 'package:flutter/material.dart';
import 'package:sliding_switch/sliding_switch.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class PageCalculator extends StatefulWidget {
  const PageCalculator({Key? key}) : super(key: key);

  @override
  _PageCalculatorState createState() => _PageCalculatorState();
}

enum Sauce { _spicy, _sweetAndSour, _cheesy }

class _PageCalculatorState extends State<PageCalculator> {
  bool _isSlimDough = false;
  int cost = 100;
  double size = 40;
  Sauce? _sauce = Sauce._spicy;
  bool _cheese = true;

  void _onSaucesChange(Sauce? value) {
    setState(() {
      _sauce = value;
    });
  }

  int calcCost() {
    cost = size.round() +
        100; // к размеру пиццы прибавляем базовую стоимость пиццы

    if (_isSlimDough == true)
      cost += 30; // к базовой стоимости теста добавляем 30
    if (_cheese == true) cost += 40;

    switch (_sauce) {
      case Sauce._spicy:
        cost += 10;
        break;
      case Sauce._sweetAndSour:
        cost += 20;
        break;
      case Sauce._cheesy:
        cost += 30;
        break;
      default:
        Sauce._spicy;
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
            Text(Strings.header, style: Theme.of(context).textTheme.headline1),
            const SizedBox(height: 9),
            Text(Strings.choiceParameters,
                style: Theme.of(context).textTheme.headline2),
            const SizedBox(height: 33),
            SlidingSwitch(
              value: false,
              width: 350,
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
              textOff: Strings.doughUsually,
              textOn: Strings.doughThin,
              colorOff: const Color(0xffFFFFFF),
              colorOn: const Color(0xffFFFFFF),
              background: Theme.of(context).colorScheme.surface,
              buttonColor: Theme.of(context).colorScheme.secondary,
              inactiveColor: Theme.of(context).colorScheme.secondary,
            ),
            const SizedBox(height: 19),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(Strings.sizePizza,
                    style: Theme.of(context).textTheme.headline2),
                const SizedBox(height: 13),
              ],
            ),
            const SizedBox(height: 5),
            SfSlider(
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
                }),
            const SizedBox(height: 13),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(Strings.sauce,
                    style: Theme.of(context).textTheme.headline2),
              ],
            ),
            RadioListTile(
              activeColor: Theme.of(context).colorScheme.primary,
              dense: true,
              title: Text(Strings.spicy,
                  style: Theme.of(context).textTheme.headline3),
              value: Sauce._spicy,
              groupValue: _sauce,
              onChanged: _onSaucesChange,
              controlAffinity: ListTileControlAffinity.trailing,
            ),
            const Divider(
              thickness: 1,
            ),
            RadioListTile(
              activeColor: Theme.of(context).colorScheme.primary,
              dense: true,
              title: Text(Strings.sweetAndSour,
                  style: Theme.of(context).textTheme.headline3),
              value: Sauce._sweetAndSour,
              groupValue: _sauce,
              onChanged: _onSaucesChange,
              controlAffinity: ListTileControlAffinity.trailing,
            ),
            const Divider(
              thickness: 1,
            ),
            RadioListTile(
              activeColor: Theme.of(context).colorScheme.primary,
              dense: true,
              title: Text(Strings.cheesy,
                  style: Theme.of(context).textTheme.headline3),
              value: Sauce._cheesy,
              groupValue: _sauce,
              onChanged: _onSaucesChange,
              controlAffinity: ListTileControlAffinity.trailing,
            ),
            const Divider(thickness: 1),
            const SizedBox(height: 18),
            Container(
              height: 56,
              child: Padding(
                padding: const EdgeInsets.only(left: 6, top: 8, bottom: 8),
                child: Row(
                  children: [
                    Image.asset('assets/cheese.png', color: Theme.of(context).colorScheme.onPrimary,),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 6, top: 8, bottom: 8, right: 10),
                      child: Text(
                        Strings.addCheese,
                        style: Theme.of(context).textTheme.headline3,
                      ),
                    ),
                    const Expanded(child: SizedBox(width: 8)),
                    Switch(
                      activeColor: Theme.of(context).colorScheme.primary,
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
                  color: Theme.of(context).colorScheme.surface),
              alignment: Alignment.center,
            ), // Switch
            SizedBox(
              height: 41,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(Strings.cast,
                      style: Theme.of(context).textTheme.headline2),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 34,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(36),
                  color: Theme.of(context).colorScheme.surface),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(
                  '${calcCost()} руб',
                  style: Theme.of(context).textTheme.headline3,
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
