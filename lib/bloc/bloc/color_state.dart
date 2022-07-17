part of 'color_bloc.dart';

class ColorState extends Equatable {
  final Color color;

  ColorState({required this.color});

  factory ColorState.initial() => ColorState(color: Colors.pink);

  @override
  List<Object> get props => [color];

  @override
  bool get stringify => true;

  ColorState copyWith({
    Color? color,
  }) {
    return ColorState(color: color ?? this.color);
  }
}
