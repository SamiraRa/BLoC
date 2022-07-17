import 'package:bloc_app/bloc/bloc/color_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NextPage extends StatefulWidget {
  const NextPage({Key? key}) : super(key: key);

  @override
  State<NextPage> createState() => _NextPageState();
}

class _NextPageState extends State<NextPage> {
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
                child: Card(
                  color: Colors.amber,
                  elevation: 20,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(150)),
                  child: SizedBox(
                      height: 300,
                      width: 200,
                      child: GestureDetector(
                        onTap: () {
                          print("clicked");
                          context.read<ColorBloc>().add(ChangeColorEvent());
                        },
                      )),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
