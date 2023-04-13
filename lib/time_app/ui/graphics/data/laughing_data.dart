List<WeekData> weeksData = [
  WeekData(
    days: [
      DayData(
        day: 0,
        laughs: 15,
      ),
      DayData(
        day: 1,
        laughs: 18,
      ),
      DayData(
        day: 2,
        laughs: 20,
      ),
      DayData(
        day: 3,
        laughs: 34,
      ),
      DayData(
        day: 4,
        laughs: 25,
      ),
      DayData(
        day: 5,
        laughs: 30,
      ),
      DayData(
        day: 6,
        laughs: 19,
      ),
    ],
  ),
];

class WeekData {
  WeekData({required this.days});
  List<DayData> days;
}

class DayData {
  DayData({required this.day, required this.laughs});
  int day;
  int laughs;
}
