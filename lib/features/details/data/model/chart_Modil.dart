class ChartPoint {
  final double x;
  final double y;

  ChartPoint({required this.x, required this.y});

  factory ChartPoint.fromList(List<dynamic> list) {
    return ChartPoint(
      x: list[0].toDouble(),
      y: (list[1] as num).toDouble(),
    );
  }
}
