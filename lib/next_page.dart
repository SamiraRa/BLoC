import 'dart:math';

import 'package:bloc_app/bloc/bloc/color_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NextPage extends StatefulWidget {
  const NextPage({Key? key}) : super(key: key);

  @override
  State<NextPage> createState() => _NextPageState();
}

class _NextPageState extends State<NextPage> {
  double height = 300;
  double weight = 200;
  Color _color = Colors.amber;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ColorBloc(),
      child: Scaffold(
        body: BlocBuilder<ColorBloc, ColorState>(
          builder: (context, state) {
            return Container(
              color: state.color,
              child: Center(
                child: AnimatedContainer(
                  height: this.height,
                  width: this.weight,
                  child: Card(
                    color: this._color,
                    elevation: 20,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(150)),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          // height = 200;
                          // weight = 300;
                          height = Random().nextInt(300).toDouble() + 50;
                          weight = Random().nextInt(200).toDouble() + 50;
                          _color = Colors.primaries[
                              Random().nextInt(Colors.primaries.length)];
                        });
                        print("clicked");
                        context.read<ColorBloc>().add(ChangeColorEvent());
                      },
                    ),
                  ),
                  duration: const Duration(seconds: 1),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
