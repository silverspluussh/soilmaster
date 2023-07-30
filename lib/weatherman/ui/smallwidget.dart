import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:soilmaster/src/widgets/cContainer.dart';
import 'package:soilmaster/src/widgets/formwidget.dart';
import 'package:soilmaster/weatherman/ui/weatherwidget.dart';
import 'package:velocity_x/velocity_x.dart';
import '../models/weather/weathermodel.dart';
import '../../constants/colors.dart';

class Smallweatherwidget extends StatelessWidget {
  const Smallweatherwidget({
    super.key,
    required this.size,
    required this.data,
    required this.city,
  });

  final Size size;
  final String city;
  final WeatherOutput data;

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      img: '',
      height: size.height * 0.28,
      width: size.width,
      child: VStack(
        [
          SizedBox(
            height: size.height * 0.16,
            width: size.width,
            child: Flex(direction: Axis.horizontal, children: [
              const Spacer(),
              VStack([
                HStack([
                  const Icon(Icons.location_city),
                  Text(
                    city.capitalized,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ]),
                const SizedBox(height: 10),
                Text(
                  '${data.temp.celsius.toInt().toString()} °',
                  style: const TextStyle(
                      fontFamily: 'Go',
                      fontWeight: FontWeight.w600,
                      color: kBlackColor,
                      fontSize: 20),
                ),
              ]),
              const Spacer(),
              WeatherIcon(
                url: data.iconUrl,
                size: 60,
                color: kBlackColor,
              ),
              const Spacer(),
            ]),
          ),
          SizedBox(
              height: size.height * 0.07,
              width: size.width,
              child: Flex(
                direction: Axis.horizontal,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(),
                  VStack(
                    [
                      Text('Humidy',
                          style: Theme.of(context).textTheme.bodySmall),
                      Text('${data.humidity}  %',
                          style: Theme.of(context).textTheme.bodySmall),
                    ],
                  ),
                  const Spacer(),
                  VStack(
                    [
                      Text('Pressure',
                          style: Theme.of(context).textTheme.bodySmall),
                      Text('${data.pressure}  hPa',
                          style: Theme.of(context).textTheme.bodySmall),
                    ],
                  ),
                  const Spacer(),
                ],
              ))
        ],
        alignment: MainAxisAlignment.center,
        crossAlignment: CrossAxisAlignment.center,
      ).p8(),
    );
  }
}

class Searchwidget2 extends ConsumerStatefulWidget {
  const Searchwidget2({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  ConsumerState<Searchwidget2> createState() => _Searchwidget2State();
}

class _Searchwidget2State extends ConsumerState<Searchwidget2> {
  final _searchController = TextEditingController();
  User? user;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size.width,
      height: 60,
      child: Flex(direction: Axis.horizontal, children: [
        MyFormField(
          validator: (e) {
            return null;
          },
          label: '',
          readonly: false,
          hinttext: 'search',
          inputType: TextInputType.name,
          controller: _searchController,
          suffix: IconButton(
            icon: const Icon(
              Icons.search_outlined,
              size: 25,
              color: kBlackColor,
            ),
            onPressed: () {
              FocusScope.of(context).unfocus();
            },
          ),
        ),
        const CircleAvatar(
          radius: 15,
          backgroundColor: Colors.white,
          child: Icon(Icons.person),
        )
      ]),
    );
  }
}
