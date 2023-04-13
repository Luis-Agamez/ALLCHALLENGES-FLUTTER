List<WeekData> hoursData = [
  WeekData(
    days: [
      DayData(
        day: 0,
        laughs: 35,
      ),
      DayData(
        day: 1,
        laughs: 28,
      ),
      DayData(
        day: 2,
        laughs: 20,
      ),
      DayData(
        day: 3,
        laughs: 22,
      ),
      DayData(
        day: 4,
        laughs: 25,
      ),
      DayData(
        day: 5,
        laughs: 28,
      ),
      DayData(
        day: 6,
        laughs: 30,
      ),
      DayData(
        day: 0,
        laughs: 45,
      ),
      DayData(
        day: 1,
        laughs: 42,
      ),
      DayData(
        day: 2,
        laughs: 40,
      ),
      DayData(
        day: 3,
        laughs: 41,
      ),
      DayData(
        day: 4,
        laughs: 35,
      ),
      DayData(
        day: 5,
        laughs: 38,
      ),
      DayData(
        day: 6,
        laughs: 40,
      ),
      DayData(
        day: 0,
        laughs: 44,
      ),
      DayData(
        day: 1,
        laughs: 41,
      ),
      DayData(
        day: 2,
        laughs: 38,
      ),
      DayData(
        day: 3,
        laughs: 37,
      ),
      DayData(
        day: 4,
        laughs: 41,
      ),
      DayData(
        day: 5,
        laughs: 44,
      ),
      DayData(
        day: 6,
        laughs: 49,
      ),
    ],
  ),
];

List<WeekData> hoursDataTwo = [
  WeekData(
    days: [
      DayData(
        day: 0,
        laughs: 6,
      ),
      DayData(
        day: 1,
        laughs: 10,
      ),
      DayData(
        day: 2,
        laughs: 8,
      ),
      DayData(
        day: 3,
        laughs: 8,
      ),
      DayData(
        day: 4,
        laughs: 14,
      ),
      DayData(
        day: 5,
        laughs: 16,
      ),
      DayData(
        day: 6,
        laughs: 21,
      ),
      DayData(
        day: 0,
        laughs: 25,
      ),
      DayData(
        day: 1,
        laughs: 22,
      ),
      DayData(
        day: 2,
        laughs: 20,
      ),
      DayData(
        day: 3,
        laughs: 11,
      ),
      DayData(
        day: 4,
        laughs: 17,
      ),
      DayData(
        day: 5,
        laughs: 18,
      ),
      DayData(
        day: 6,
        laughs: 25,
      ),
      DayData(
        day: 0,
        laughs: 24,
      ),
      DayData(
        day: 1,
        laughs: 28,
      ),
      DayData(
        day: 2,
        laughs: 22,
      ),
      DayData(
        day: 3,
        laughs: 24,
      ),
      DayData(
        day: 4,
        laughs: 21,
      ),
      DayData(
        day: 5,
        laughs: 18,
      ),
      DayData(
        day: 6,
        laughs: 25,
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
