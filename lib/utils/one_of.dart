class OneOf2<T1, T2> {
  final T1? first;
  final T2? second;

  bool get isFirst => first != null;
  bool get isSecond => second != null;
  get value => first ?? second;

  List<Type> get types => [T1, T2];

  const OneOf2(this.first, this.second)
      : assert((first != null) != (second != null));
}

class OneOf3<T1, T2, T3> {
  final T1? first;
  final T2? second;
  final T3? third;

  bool get isFirst => first != null;
  bool get isSecond => second != null;
  bool get isThird => third != null;
  get value => first ?? second ?? third;

  List<Type> get types => [T1, T2, T3];

  const OneOf3(this.first, this.second, this.third)
      : assert(first != null && second == null && third == null ||
            first == null && second != null && third == null ||
            first == null && second == null && third != null);
}

class OneOf4<T1, T2, T3, T4> {
  final T1? first;
  final T2? second;
  final T3? third;
  final T4? fourth;

  bool get isFirst => first != null;
  bool get isSecond => second != null;
  bool get isThird => third != null;
  bool get isFourth => fourth != null;
  get value => first ?? second ?? third ?? fourth;

  List<Type> get types => [T1, T2, T3, T4];

  const OneOf4(this.first, this.second, this.third, this.fourth)
      : assert(first != null &&
                second == null &&
                third == null &&
                fourth == null ||
            first == null &&
                second != null &&
                third == null &&
                fourth == null ||
            first == null &&
                second == null &&
                third != null &&
                fourth == null ||
            first == null && second == null && third == null && fourth != null);
}

class OneOf5<T1, T2, T3, T4, T5> {
  final T1? first;
  final T2? second;
  final T3? third;
  final T4? fourth;
  final T5? fifth;

  bool get isFirst => first != null;
  bool get isSecond => second != null;
  bool get isThird => third != null;
  bool get isFourth => fourth != null;
  bool get isFifth => fifth != null;

  get value => first ?? second ?? third ?? fourth ?? fifth;

  List<Type> get types => [T1, T2, T3, T4, T5];

  const OneOf5(this.first, this.second, this.third, this.fourth, this.fifth)
      : assert(first != null &&
                second == null &&
                third == null &&
                fourth == null &&
                fifth == null ||
            first == null &&
                second != null &&
                third == null &&
                fourth == null &&
                fifth == null ||
            first == null &&
                second == null &&
                third != null &&
                fourth == null &&
                fifth == null ||
            first == null &&
                second == null &&
                third == null &&
                fourth != null &&
                fifth == null ||
            first == null &&
                second == null &&
                third == null &&
                fourth == null &&
                fifth != null);
}

class OneOf6<T1, T2, T3, T4, T5, T6> {
  final T1? first;
  final T2? second;
  final T3? third;
  final T4? fourth;
  final T5? fifth;
  final T6? sixth;

  bool get isFirst => first != null;
  bool get isSecond => second != null;
  bool get isThird => third != null;
  bool get isFourth => fourth != null;
  bool get isFifth => fifth != null;
  bool get isSixth => sixth != null;
  get value => first ?? second ?? third ?? fourth ?? fifth ?? sixth;

  List<Type> get types => [T1, T2, T3, T4, T5, T6];

  const OneOf6(
      this.first, this.second, this.third, this.fourth, this.fifth, this.sixth)
      : assert(first != null &&
                second == null &&
                third == null &&
                fourth == null &&
                fifth == null &&
                sixth == null ||
            first == null &&
                second != null &&
                third == null &&
                fourth == null &&
                fifth == null &&
                sixth == null ||
            first == null &&
                second == null &&
                third != null &&
                fourth == null &&
                fifth == null &&
                sixth == null ||
            first == null &&
                second == null &&
                third == null &&
                fourth != null &&
                fifth == null &&
                sixth == null ||
            first == null &&
                second == null &&
                third == null &&
                fourth == null &&
                fifth != null &&
                sixth == null ||
            first == null &&
                second == null &&
                third == null &&
                fourth == null &&
                fifth == null &&
                sixth != null);
}

class OneOf7<T1, T2, T3, T4, T5, T6, T7> {
  final T1? first;
  final T2? second;
  final T3? third;
  final T4? fourth;
  final T5? fifth;
  final T6? sixth;
  final T7? seventh;

  bool get isFirst => first != null;
  bool get isSecond => second != null;
  bool get isThird => third != null;
  bool get isFourth => fourth != null;
  bool get isFifth => fifth != null;
  bool get isSixth => sixth != null;
  bool get isSeventh => seventh != null;

  get value => first ?? second ?? third ?? fourth ?? fifth ?? sixth ?? seventh;

  List<Type> get types => [T1, T2, T3, T4, T5, T6, T7];

  const OneOf7(this.first, this.second, this.third, this.fourth, this.fifth,
      this.sixth, this.seventh)
      : assert(first != null &&
                second == null &&
                third == null &&
                fourth == null &&
                fifth == null &&
                sixth == null &&
                seventh == null ||
            first == null &&
                second != null &&
                third == null &&
                fourth == null &&
                fifth == null &&
                sixth == null &&
                seventh == null ||
            first == null &&
                second == null &&
                third != null &&
                fourth == null &&
                fifth == null &&
                sixth == null &&
                seventh == null ||
            first == null &&
                second == null &&
                third == null &&
                fourth != null &&
                fifth == null &&
                sixth == null &&
                seventh == null ||
            first == null &&
                second == null &&
                third == null &&
                fourth == null &&
                fifth != null &&
                sixth == null &&
                seventh == null ||
            first == null &&
                second == null &&
                third == null &&
                fourth == null &&
                fifth == null &&
                sixth != null &&
                seventh == null ||
            first == null &&
                second == null &&
                third == null &&
                fourth == null &&
                fifth == null &&
                sixth == null &&
                seventh != null);
}
