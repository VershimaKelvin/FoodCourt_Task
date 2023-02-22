import 'package:flutter/material.dart';
import 'package:task/core/constant/app_color.dart';
import 'package:intl/intl.dart';
import 'package:task/core/constant/fonts.dart';
import 'package:task/core/constant/ui_helpers.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen>{

  final List<String> items = [
    'Item1',
    'Item2',
    'Item3',
    'Item4',
  ];
  String? selectedValue;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.blackColor,
          elevation: 3,
          title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                DateFormat('EEEE, d MMMM yyyy').format(DateTime.now()),
                style: const TextStyle(
                  color: AppColors.white,
                  fontSize: 14,
                ),
              )
            ],
          ),
          actions: [
            DropdownButtonHideUnderline(
              child: DropdownButton2(
                hint: TextBody('Lagos'),
                items: items
                    .map((item) =>
                    DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ))
                    .toList(),
                value: selectedValue,
                onChanged: (value) {
                  setState(() {
                    selectedValue = value as String;
                  });
                },
                buttonHeight: 40,
                buttonWidth: 140,
                itemHeight: 40,
              ),
            ),
            // Row(
            //   children: [
            //     TextBody('Abuja'),
            //     gapTiny,
            //     const Icon(
            //       Icons.arrow_drop_down_sharp
            //     ),
            //   ],
            // )
          ],
        ),
        backgroundColor: AppColors.blackColor,
        body:Scaffold(
          backgroundColor: AppColors.blackColor,
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextSemiBold('ABUJA'),
                    gapSmall,
                    TextBody('Scattared Clouds'),
                    gapMedium,
                    const Icon(
                      Icons.dark_mode_outlined,
                      size: 30,
                      color: AppColors.white,
                    ),
                    gapMedium,
                    TextBold('30°'),
                  ],
                ),
              ),
              Row(
                children: [
                  Container(
                    height: 60,
                      width: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: AppColors.white,
                            width: 5,
                          )),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                      child: Column(
                        children: [
                          TextSemiBold('Lagos'),
                          gapSmall,
                          TextBody('30°')
                        ],
                      ),
                    ),
                      ),
                  gapSmall,
                  Container(
                    height: 60,
                    width: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: AppColors.white,
                          width: 5,
                        )),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                      child: Column(
                        children: [
                          TextSemiBold('Lagos'),
                          gapSmall,
                          TextBody('30°')
                        ],
                      ),
                    ),
                  ),
                  gapSmall,
                  Container(
                    height: 60,
                    width: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: AppColors.white,
                          width: 5,
                        )),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                      child: Column(
                        children: [
                          TextSemiBold('Lagos'),
                          gapSmall,
                          TextBody('30°')
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              FloatingActionButton(
                  onPressed: (){},
                child: const Icon(
                  Icons.my_location
                ),
              )
            ],
          ),
        )
    );
  }
}