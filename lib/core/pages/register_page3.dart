import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:test_pro/core/model/register_page3_model.dart';
import 'package:test_pro/core/model/tab_indicator.dart';
import 'package:test_pro/core/product/padding/page_padding.dart';

class RegisterPage3 extends StatefulWidget {
  const RegisterPage3({Key? key}) : super(key: key);

  @override
  State<RegisterPage3> createState() => _RegisterPage3State();
}

class _RegisterPage3State extends State<RegisterPage3> {
  final String _start = 'Start';
  final String _next = 'Next';
  int currentValue = 0;
  int _selectedIndex = 0;

  var numbers = [];

  void createNumbers() {
    for (var i = 0; i < 201; i++) {
      numbers.add(i);
    }
    print(numbers);
  }

  final PageController _pageController = PageController();

  bool get _isLastPage =>
      RegisterModels.registerItems.length - 1 == _selectedIndex;
  bool get _isFirstPage => _selectedIndex == 0;

  void _incrementAndChange([int? value]) {
    if (_isLastPage && value == null) {
      return;
    }
    _incrementSelectedPAge(value);
  }

  void _incrementSelectedPAge([int? value]) {
    setState(() {
      _selectedIndex++;
    });
  }

  void _decrementSelectedPage() {
    setState(() {
      _selectedIndex--;
    });
  }

  @override
  Widget build(BuildContext context) {
    createNumbers();
    print(_selectedIndex.toString());
    return Scaffold(
      appBar: _appBar(),
      body: Center(
        child: Padding(
          padding: const PagePadding.all(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (value) {
                    setState(() {
                      _incrementAndChange(value);
                    });
                  },
                  itemCount: RegisterModels.registerItems.length,
                  itemBuilder: (context, index) {
                    var model = RegisterModels.registerItems[index];
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          model.title,
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        // NumberPicker(
                        //   decoration: const BoxDecoration(
                        //       border: Border(
                        //     bottom: BorderSide(
                        //       width: 2,
                        //       color: Colors.grey,
                        //     ),
                        //   )),
                        //   minValue: 0,
                        //   maxValue: 200,
                        //   step: 1,
                        //   value: currentValue,
                        //   onChanged: (value) {
                        //     setState(() {
                        //       currentValue = value;
                        //     });
                        //   },
                        // ),
                        CupertinoPageScaffold(
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  numbers[currentValue].toString(),
                                  style: const TextStyle(
                                    fontSize: 48,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 350,
                                  child: CupertinoPicker(
                                      itemExtent: 65,
                                      onSelectedItemChanged: (value) {
                                        setState(() {
                                          currentValue = value;
                                        });
                                        final numberIndex = numbers[value];
                                        print('Selected Item: $numberIndex');
                                      },
                                      children: numbers
                                          .map((number) => Center(
                                                child: Text(
                                                  number.toString(),
                                                  style: const TextStyle(
                                                      fontSize: 32),
                                                ),
                                              ))
                                          .toList()),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 1,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(),
                  onPressed: () {
                    setState(() {
                      _incrementAndChange();
                    });
                  },
                  child: Text(_isLastPage ? _start : _next),
                ),
              ),
              TabIndicator(
                selectedIndex: _selectedIndex,
              ),
            ],
          ),
        ),
      ),
    );
  }

  PageView _pageViewItems() {
    int currentValue = 0;
    return PageView.builder(
      onPageChanged: (value) {
        _incrementAndChange(value);
      },
      itemCount: RegisterModels.registerItems.length,
      itemBuilder: (context, index) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _titleText(context, RegisterModels.registerItems[index]),
            NumberPicker(
              decoration: const BoxDecoration(
                  border: Border(
                bottom: BorderSide(
                  width: 2,
                  color: Colors.grey,
                ),
              )),
              minValue: 0,
              maxValue: 200,
              step: 1,
              value: currentValue,
              onChanged: (value) {
                setState(() {
                  currentValue = value;
                });
              },
            )
          ],
        );
      },
    );
  }

  Text _titleText(BuildContext context, RegisterModel model) {
    return Text(
      model.title,
      style: Theme.of(context).textTheme.headline5,
    );
  }

  AppBar _appBar() {
    return AppBar(
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: const IconThemeData(
        color: Colors.grey,
      ),
      automaticallyImplyLeading: false,
      leading: _isFirstPage
          ? null
          : IconButton(
              onPressed: () {
                _decrementSelectedPage();
              },
              icon: const Icon(Icons.chevron_left_outlined)),
    );
  }

  SizedBox _nextButton(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 1,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(),
        onPressed: () {
          _incrementAndChange();
        },
        child: Text(_isLastPage ? _start : _next),
      ),
    );
  }
}
