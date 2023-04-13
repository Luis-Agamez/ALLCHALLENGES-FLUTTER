import 'dart:io';

class Environment {
  static String apiUrlBase = Platform.isAndroid
      ? 'https://api.openweathermap.org/data/2.5/weather'
      : 'https://api.openweathermap.org/data/2.5/weather';

  static String apiUrlPredictions =
      'https://api.openweathermap.org/data/2.5/forecast';

  static String apiKey = '0de7206f15a4484749621d1196600af1';
}

const basicData = [
  {'genre': 'Sports', 'sold': 275},
  {'genre': 'Strategy', 'sold': 115},
  {'genre': 'Action', 'sold': 120},
  {'genre': 'Shooter', 'sold': 350},
  {'genre': 'Other', 'sold': 150},
];

const complexGroupData = [
  {'date': '2021-10-01', 'name': 'Liam', 'points': 1468},
  {'date': '2021-10-01', 'name': 'Oliver', 'points': 1487},
  {'date': '2021-10-01', 'name': 'Elijah', 'points': 1494},
  {'date': '2021-10-02', 'name': 'Liam', 'points': 1526},
  {'date': '2021-10-02', 'name': 'Noah', 'points': 1492},
  {'date': '2021-10-02', 'name': 'Oliver', 'points': 1470},
  {'date': '2021-10-02', 'name': 'Elijah', 'points': 1477},
  {'date': '2021-10-03', 'name': 'Liam', 'points': 1466},
  {'date': '2021-10-03', 'name': 'Noah', 'points': 1465},
  {'date': '2021-10-03', 'name': 'Oliver', 'points': 1524},
  {'date': '2021-10-03', 'name': 'Elijah', 'points': 1534},
  {'date': '2021-10-04', 'name': 'Noah', 'points': 1504},
  {'date': '2021-10-04', 'name': 'Elijah', 'points': 1524},
  {'date': '2021-10-05', 'name': 'Oliver', 'points': 1534},
  {'date': '2021-10-06', 'name': 'Noah', 'points': 1463},
  {'date': '2021-10-07', 'name': 'Liam', 'points': 1502},
  {'date': '2021-10-07', 'name': 'Noah', 'points': 1539},
  {'date': '2021-10-08', 'name': 'Liam', 'points': 1476},
  {'date': '2021-10-08', 'name': 'Noah', 'points': 1483},
  {'date': '2021-10-08', 'name': 'Oliver', 'points': 1534}
];

class TimeSeriesSales {
  final DateTime time;
  final int sales;

  TimeSeriesSales(this.time, this.sales);
}

final timeSeriesSales = [
  TimeSeriesSales(DateTime(2017, 9, 19), 5),
  TimeSeriesSales(DateTime(2017, 9, 26), 25),
  TimeSeriesSales(DateTime(2017, 10, 3), 100),
  TimeSeriesSales(DateTime(2017, 10, 10), 75),
];

const roseData = [
  {'value': 20, 'name': 'rose 1'},
  {'value': 10, 'name': 'rose 2'},
  {'value': 24, 'name': 'rose 3'},
  {'value': 12, 'name': 'rose 4'},
  {'value': 20, 'name': 'rose 5'},
  {'value': 15, 'name': 'rose 6'},
  {'value': 22, 'name': 'rose 7'},
  {'value': 29, 'name': 'rose 8'},
];

const intervalData = [
  {
    'id': 'No.1',
    'min': 76,
    'max': 100,
  },
  {
    'id': 'No.2',
    'min': 56,
    'max': 108,
  },
  {
    'id': 'No.3',
    'min': 38,
    'max': 129,
  },
  {
    'id': 'No.4',
    'min': 58,
    'max': 155,
  },
  {
    'id': 'No.5',
    'min': 45,
    'max': 120,
  },
  {
    'id': 'No.6',
    'min': 23,
    'max': 99,
  },
  {
    'id': 'No.7',
    'min': 18,
    'max': 56,
  },
  {
    'id': 'No.8',
    'min': 18,
    'max': 34,
  },
];

const adjustData = [
  {"type": "Email", "index": 0, "value": 120},
  {"type": "Email", "index": 1, "value": 132},
  {"type": "Email", "index": 2, "value": 101},
  {"type": "Email", "index": 3, "value": 134},
  {"type": "Email", "index": 4, "value": 90},
  {"type": "Email", "index": 5, "value": 230},
  {"type": "Video", "index": 0, "value": 150},
  {"type": "Video", "index": 1, "value": 232},
  {"type": "Video", "index": 2, "value": 201},
  {"type": "Video", "index": 3, "value": 154},
  {"type": "Video", "index": 4, "value": 190},
  {"type": "Video", "index": 5, "value": 330},
  {"type": "Video", "index": 6, "value": 410},
  {"type": "Video", "index": 1, "value": 10},
  {"type": "Search", "index": 2, "value": 401},
  {"type": "Search", "index": 3, "value": 434},
  {"type": "Search", "index": 4, "value": 390},
  {"type": "Search", "index": 5, "value": 430},
  {"type": "Search", "index": 6, "value": 420},
];

const scatterData = [
  [28604, 77, 17096869, 'Australia', 1990],
  [31163, 77.4, 27662440, 'Canada', 1990],
  [1516, 68, 1154605773, 'China', 1990],
  [13670, 74.7, 10582082, 'Cuba', 1990],
  [28599, 75, 4986705, 'Finland', 1990],
  [29476, 77.1, 56943299, 'France', 1990],
  [31476, 75.4, 78958237, 'Germany', 1990],
  [28666, 78.1, 254830, 'Iceland', 1990],
  [1777, 57.7, 870601776, 'India', 1990],
  [29550, 79.1, 122249285, 'Japan', 1990],
  [2076, 67.9, 20194354, 'North Korea', 1990],
  [12087, 72, 42972254, 'South Korea', 1990],
  [24021, 75.4, 3397534, 'New Zealand', 1990],
  [43296, 76.8, 4240375, 'Norway', 1990],
  [10088, 70.8, 38195258, 'Poland', 1990],
  [19349, 69.6, 147568552, 'Russia', 1990],
  [10670, 67.3, 53994605, 'Turkey', 1990],
  [26424, 75.7, 57110117, 'United Kingdom', 1990],
  [37062, 75.4, 252847810, 'United States', 1990],
  [44056, 81.8, 23968973, 'Australia', 2015],
  [43294, 81.7, 35939927, 'Canada', 2015],
  [13334, 76.9, 1376048943, 'China', 2015],
  [21291, 78.5, 11389562, 'Cuba', 2015],
  [38923, 80.8, 5503457, 'Finland', 2015],
  [37599, 81.9, 64395345, 'France', 2015],
  [44053, 81.1, 80688545, 'Germany', 2015],
  [42182, 82.8, 329425, 'Iceland', 2015],
  [5903, 66.8, 1311050527, 'India', 2015],
  [36162, 83.5, 126573481, 'Japan', 2015],
  [1390, 71.4, 25155317, 'North Korea', 2015],
  [34644, 80.7, 50293439, 'South Korea', 2015],
  [34186, 80.6, 4528526, 'New Zealand', 2015],
  [64304, 81.6, 5210967, 'Norway', 2015],
  [24787, 77.3, 38611794, 'Poland', 2015],
  [23038, 73.13, 143456918, 'Russia', 2015],
  [19360, 76.5, 78665830, 'Turkey', 2015],
  [38225, 81.4, 64715810, 'United Kingdom', 2015],
  [53354, 79.1, 321773631, 'United States', 2015]
];

const heatmapData = [
  [0, 0, 10],
  [0, 1, 19],
  [0, 2, 8],
  [0, 3, 24],
  [0, 4, 67],
  [1, 0, 92],
  [1, 1, 58],
  [1, 2, 78],
  [1, 3, 117],
  [1, 4, 48],
  [2, 0, 35],
  [2, 1, 15],
  [2, 2, 123],
  [2, 3, 64],
  [2, 4, 52],
  [3, 0, 72],
  [3, 1, 132],
  [3, 2, 114],
  [3, 3, 19],
  [3, 4, 16],
  [4, 0, 38],
  [4, 1, 5],
  [4, 2, 8],
  [4, 3, 117],
  [4, 4, 115],
  [5, 0, 88],
  [5, 1, 32],
  [5, 2, 12],
  [5, 3, 6],
];

const boxData = [
  {'x': 'Oceania', 'low': 1, 'q1': 9, 'median': 16, 'q3': 22, 'high': 24},
  {'x': 'East Europe', 'low': 1, 'q1': 5, 'median': 8, 'q3': 12, 'high': 16},
  {'x': 'Australia', 'low': 1, 'q1': 8, 'median': 12, 'q3': 19, 'high': 26},
  {'x': 'South America', 'low': 2, 'q1': 8, 'median': 12, 'q3': 21, 'high': 28},
  {'x': 'North Africa', 'low': 1, 'q1': 8, 'median': 14, 'q3': 18, 'high': 24},
  {
    'x': 'North America',
    'low': 3,
    'q1': 10,
    'median': 17,
    'q3': 28,
    'high': 30
  },
  {'x': 'West Europe', 'low': 1, 'q1': 7, 'median': 10, 'q3': 17, 'high': 22},
  {'x': 'West Africa', 'low': 1, 'q1': 6, 'median': 8, 'q3': 13, 'high': 16}
];

const stockData = [
  {
    'time': '2015-11-19',
    'start': 8.18,
    'max': 8.33,
    'min': 7.98,
    'end': 8.32,
    'volume': 1810,
    'money': 14723.56
  },
  {
    'time': '2015-11-18',
    'start': 8.37,
    'max': 8.6,
    'min': 8.03,
    'end': 8.09,
    'volume': 2790.37,
    'money': 23309.19
  },
  {
    'time': '2015-11-17',
    'start': 8.7,
    'max': 8.78,
    'min': 8.32,
    'end': 8.37,
    'volume': 3729.04,
    'money': 31709.71
  },
  {
    'time': '2015-11-16',
    'start': 8.18,
    'max': 8.69,
    'min': 8.05,
    'end': 8.62,
    'volume': 3095.44,
    'money': 26100.69
  },
  {
    'time': '2015-11-13',
    'start': 8.01,
    'max': 8.75,
    'min': 7.97,
    'end': 8.41,
    'volume': 5815.58,
    'money': 48562.37
  },
  {
    'time': '2015-11-12',
    'start': 7.76,
    'max': 8.18,
    'min': 7.61,
    'end': 8.15,
    'volume': 4742.6,
    'money': 37565.36
  },
  {
    'time': '2015-11-11',
    'start': 7.55,
    'max': 7.81,
    'min': 7.49,
    'end': 7.8,
    'volume': 3133.82,
    'money': 24065.42
  },
  {
    'time': '2015-11-10',
    'start': 7.5,
    'max': 7.68,
    'min': 7.44,
    'end': 7.57,
    'volume': 2670.35,
    'money': 20210.58
  },
  {
    'time': '2015-11-09',
    'start': 7.65,
    'max': 7.66,
    'min': 7.3,
    'end': 7.58,
    'volume': 2841.79,
    'money': 21344.36
  },
  {
    'time': '2015-11-06',
    'start': 7.52,
    'max': 7.71,
    'min': 7.48,
    'end': 7.64,
    'volume': 2725.44,
    'money': 20721.51
  },
  {
    'time': '2015-11-05',
    'start': 7.48,
    'max': 7.57,
    'min': 7.29,
    'end': 7.48,
    'volume': 3520.85,
    'money': 26140.83
  },
  {
    'time': '2015-11-04',
    'start': 7.01,
    'max': 7.5,
    'min': 7.01,
    'end': 7.46,
    'volume': 3591.47,
    'money': 26285.52
  },
  {
    'time': '2015-11-03',
    'start': 7.1,
    'max': 7.17,
    'min': 6.82,
    'end': 7,
    'volume': 2029.21,
    'money': 14202.33
  },
  {
    'time': '2015-11-02',
    'start': 7.09,
    'max': 7.44,
    'min': 6.93,
    'end': 7.17,
    'volume': 3191.31,
    'money': 23205.11
  }
];

const lineData = [
  {"Date": "04.01.2016", "Close": 126.12},
  {"Date": "05.01.2016", "Close": 125.688},
  {"Date": "06.01.2016", "Close": 119.704},
  {"Date": "07.01.2016", "Close": 120.19},
  {"Date": "08.01.2016", "Close": 121.157},
  {"Date": "11.01.2016", "Close": 117},
  {"Date": "12.01.2016", "Close": 111.487},
  {"Date": "13.01.2016", "Close": 122},
  {"Date": "14.01.2016", "Close": 117.76},
  {"Date": "15.01.2016", "Close": 114.397},
  {"Date": "18.01.2016", "Close": 116.373},
  {"Date": "19.01.2016", "Close": 120.547},
  {"Date": "20.01.2016", "Close": 113.733},
  {"Date": "21.01.2016", "Close": 114.098},
];

const invalidData = [
  {"Date": "04.01.2016", "Close": 126.12},
  {"Date": "05.01.2016", "Close": 125.688},
  {"Date": "06.01.2016", "Close": 119.704},
  {"Date": "07.01.2016", "Close": 120.19},
  {"Date": "08.01.2016", "Close": 121.157},
  {"Date": "11.01.2016", "Close": 117},
  {"Date": "12.01.2016", "Close": 120},
  {"Date": "13.01.2016", "Close": 122},
  {"Date": "14.01.2016", "Close": 117.76},
  {"Date": "15.01.2016", "Close": 114.397},
  {"Date": "18.01.2016", "Close": 116.373},
  {"Date": "19.01.2016", "Close": 120.547},
  {"Date": "20.01.2016", "Close": 113.733},
  {"Date": "21.01.2016", "Close": 114.098},
  {"Date": "22.01.2016", "Close": 123.833},
  {"Date": "25.01.2016", "Close": 125},
  {"Date": "26.01.2016", "Close": 124.866},
  {"Date": "27.01.2016", "Close": 120.264},
  {"Date": "28.01.2016", "Close": 122.296},
  {"Date": "29.01.2016", "Close": 124.502},
  {"Date": "01.02.2016", "Close": 127.936},
];

const riverData = [
  ['2015/11/08', 10, 'DQ'],
  ['2015/11/09', 15, 'DQ'],
  ['2015/11/10', 35, 'DQ'],
  ['2015/11/11', 38, 'DQ'],
  ['2015/11/12', 22, 'DQ'],
  ['2015/11/13', 16, 'DQ'],
  ['2015/11/14', 7, 'DQ'],
  ['2015/11/15', 2, 'DQ'],
  ['2015/11/16', 17, 'DQ'],
  ['2015/11/17', 33, 'DQ'],
  ['2015/11/18', 40, 'DQ'],
  ['2015/11/19', 32, 'DQ'],
  ['2015/11/20', 26, 'DQ'],
  ['2015/11/21', 35, 'DQ'],
  ['2015/11/22', 40, 'DQ'],
  ['2015/11/23', 32, 'DQ'],
  ['2015/11/08', 10, 'SY'],
  ['2015/11/09', 15, 'SY'],
  ['2015/11/10', 35, 'SY'],
  ['2015/11/11', 38, 'SY'],
  ['2015/11/12', 22, 'SY'],
  ['2015/11/13', 16, 'SY'],
  ['2015/11/14', 7, 'SY'],
  ['2015/11/15', 2, 'SY'],
  ['2015/11/16', 17, 'SY'],
  ['2015/11/17', 33, 'SY'],
  ['2015/11/18', 40, 'SY'],
  ['2015/11/19', 32, 'SY'],
  ['2015/11/20', 26, 'SY'],
  ['2015/11/21', 35, 'SY'],
  ['2015/11/22', 4, 'SY'],
  ['2015/11/23', 32, 'SY'],
];

const priceVolumeData = [
  {
    "time": "2015-11-19",
    "start": 8.18,
    "max": 8.33,
    "min": 7.98,
    "end": 8.32,
    "volume": 1810,
    "money": 14723.56
  },
  {
    "time": "2015-11-18",
    "start": 8.37,
    "max": 8.6,
    "min": 8.03,
    "end": 8.09,
    "volume": 2790.37,
    "money": 23309.19
  },
  {
    "time": "2015-11-17",
    "start": 8.7,
    "max": 8.78,
    "min": 8.32,
    "end": 8.37,
    "volume": 3729.04,
    "money": 31709.71
  },
  {
    "time": "2015-09-17",
    "start": 6.1,
    "max": 6.34,
    "min": 5.8,
    "end": 5.83,
    "volume": 2135.64,
    "money": 13039.56
  },
  {
    "time": "2015-09-16",
    "start": 5.58,
    "max": 6.07,
    "min": 5.4,
    "end": 6.07,
    "volume": 1758.57,
    "money": 10132.25
  },
  {
    "time": "2015-09-15",
    "start": 5.81,
    "max": 6.09,
    "min": 5.52,
    "end": 5.52,
    "volume": 1617.12,
    "money": 9248.69
  },
  {
    "time": "2015-09-14",
    "start": 6.98,
    "max": 7.06,
    "min": 6.13,
    "end": 6.13,
    "volume": 1982.9,
    "money": 12989.01
  },
  {
    "time": "2015-07-29",
    "start": 8.35,
    "max": 8.91,
    "min": 7.78,
    "end": 8.88,
    "volume": 4177.18,
    "money": 34893.2
  },
  {
    "time": "2015-07-28",
    "start": 8,
    "max": 9,
    "min": 7.92,
    "end": 8.1,
    "volume": 5114.55,
    "money": 42095.99
  },
  {
    "time": "2015-07-27",
    "start": 9.4,
    "max": 9.99,
    "min": 8.8,
    "end": 8.8,
    "volume": 6001.51,
    "money": 56962.25
  },
  {
    "time": "2015-07-07",
    "start": 6.77,
    "max": 6.88,
    "min": 6.75,
    "end": 6.75,
    "volume": 383.45,
    "money": 2590.85
  },
  {
    "time": "2015-07-06",
    "start": 9.1,
    "max": 9.1,
    "min": 7.5,
    "end": 7.5,
    "volume": 2968.98,
    "money": 24002.6
  },
  {
    "time": "2015-07-03",
    "start": 8.38,
    "max": 8.87,
    "min": 8.33,
    "end": 8.33,
    "volume": 2641.73,
    "money": 22223.44
  },
  {
    "time": "2015-07-02",
    "start": 10.38,
    "max": 10.38,
    "min": 9.26,
    "end": 9.26,
    "volume": 2611.06,
    "money": 24620.81
  },
  {
    "time": "2015-07-01",
    "start": 11.31,
    "max": 11.61,
    "min": 10.29,
    "end": 10.29,
    "volume": 3401.45,
    "money": 37212.87
  },
  {
    "time": "2015-06-30",
    "start": 10.08,
    "max": 11.52,
    "min": 10.01,
    "end": 11.43,
    "volume": 4205.99,
    "money": 45381.06
  },
  {
    "time": "2015-06-29",
    "start": 12.96,
    "max": 12.96,
    "min": 11.12,
    "end": 11.12,
    "volume": 3745.68,
    "money": 44252.47
  },
  {
    "time": "2015-06-19",
    "start": 14.45,
    "max": 14.97,
    "min": 13.62,
    "end": 13.62,
    "volume": 3621.43,
    "money": 51108.31
  },
  {
    "time": "2015-06-18",
    "start": 14.5,
    "max": 16,
    "min": 14.3,
    "end": 15.13,
    "volume": 5046.59,
    "money": 77208.53
  },
  {
    "time": "2015-06-17",
    "start": 14.46,
    "max": 15,
    "min": 14,
    "end": 14.6,
    "volume": 3483.7,
    "money": 50495.84
  },
  {
    "time": "2015-06-16",
    "start": 14,
    "max": 15.1,
    "min": 13.42,
    "end": 14.8,
    "volume": 4844.74,
    "money": 68953.77
  },
  {
    "time": "2015-06-15",
    "start": 14.5,
    "max": 15.09,
    "min": 14.1,
    "end": 14.39,
    "volume": 4008.2,
    "money": 58703.24
  },
  {
    "time": "2015-06-12",
    "start": 14.07,
    "max": 14.97,
    "min": 14,
    "end": 14.37,
    "volume": 5399.47,
    "money": 78592.45
  },
  {
    "time": "2015-06-11",
    "start": 13.4,
    "max": 14.5,
    "min": 13.19,
    "end": 14.13,
    "volume": 5472.93,
    "money": 76037.31
  },
  {
    "time": "2015-06-10",
    "start": 12.95,
    "max": 13.47,
    "min": 12.71,
    "end": 13.37,
    "volume": 4087.74,
    "money": 53951.64
  },
  {
    "time": "2015-06-03",
    "start": 13,
    "max": 13.15,
    "min": 12.2,
    "end": 12.54,
    "volume": 4559.61,
    "money": 57928.58
  },
  {
    "time": "2015-06-02",
    "start": 11.84,
    "max": 12.77,
    "min": 11.48,
    "end": 12.73,
    "volume": 4405.17,
  },
  {
    "time": "2015-05-27",
    "start": 12.89,
    "max": 13.18,
    "min": 12.5,
    "end": 12.66,
    "volume": 4886.86,
    "money": 62349.63
  },
  {
    "time": "2015-05-26",
    "start": 12.4,
    "max": 13.08,
    "min": 11.96,
    "end": 12.92,
    "volume": 5838.51,
    "money": 73409.96
  },
  {
    "time": "2015-05-25",
    "start": 11.7,
    "max": 12.87,
    "min": 11.61,
    "end": 12.3,
    "volume": 6405.2,
    "money": 78937.32
  },
  {
    "time": "2015-05-22",
    "start": 11.39,
    "max": 11.89,
    "min": 11.18,
    "end": 11.71,
    "volume": 5519.87,
    "money": 63515.93
  },
  {
    "time": "2015-05-21",
    "start": 11.27,
    "max": 11.35,
    "min": 11.05,
    "end": 11.33,
    "volume": 4132.8,
    "money": 46318.65
  },
  {
    "time": "2015-05-14",
    "start": 10.18,
    "max": 11.19,
    "min": 10.11,
    "end": 11.19,
    "volume": 4181.77,
    "money": 45399.19
  },
  {
    "time": "2015-05-13",
    "start": 10.2,
    "max": 10.32,
    "min": 10,
    "end": 10.17,
    "volume": 2247.39,
    "money": 22781.23
  },
  {
    "time": "2015-05-12",
    "start": 10.3,
    "max": 10.36,
    "min": 10.01,
    "end": 10.28,
    "volume": 2010.65,
    "money": 20480.63
  },
  {
    "time": "2015-04-30",
    "start": 10.4,
    "max": 11.05,
    "min": 10.4,
    "end": 10.63,
    "volume": 2169.06,
    "money": 23333.06
  },
  {
    "time": "2015-04-29",
    "start": 10.31,
    "max": 10.64,
    "min": 10.25,
    "end": 10.4,
    "volume": 1614.77,
    "money": 16910.96
  },
  {
    "time": "2015-04-28",
    "start": 11.07,
    "max": 11.25,
    "min": 10.46,
    "end": 10.49,
    "volume": 2552.21,
    "money": 27515.88
  },
  {
    "time": "2015-04-22",
    "start": 10.22,
    "max": 10.42,
    "min": 10.08,
    "end": 10.23,
    "volume": 2868.77,
    "money": 29316.49
  },
  {
    "time": "2015-04-21",
    "start": 9.56,
    "max": 10.2,
    "min": 9.4,
    "end": 10.19,
    "volume": 3493.61,
    "money": 34865.01
  },
  {
    "time": "2015-04-14",
    "start": 10.33,
    "max": 10.33,
    "min": 9.98,
    "end": 10.03,
    "volume": 2951.59,
    "money": 29803.4
  },
  {
    "time": "2015-04-13",
    "start": 10.3,
    "max": 10.63,
    "min": 10.2,
    "end": 10.33,
    "volume": 3196.99,
    "money": 33351.76
  },
  {
    "time": "2015-04-10",
    "start": 10.25,
    "max": 10.5,
    "min": 10,
    "end": 10.28,
    "volume": 2565.64,
    "money": 26337.81
  },
  {
    "time": "2015-04-09",
    "start": 9.78,
    "max": 10.48,
    "min": 9.58,
    "end": 10.22,
    "volume": 4316.86,
    "money": 43647.33
  },
  {
    "time": "2015-04-08",
    "start": 9.46,
    "max": 9.86,
    "min": 9.02,
    "end": 9.78,
    "volume": 3683.43,
    "money": 34664.66
  },
  {
    "time": "2015-04-07",
    "start": 9.53,
    "max": 9.87,
    "min": 9.38,
    "end": 9.44,
    "volume": 3874.06,
    "money": 37076.79
  },
  {
    "time": "2015-03-31",
    "start": 8.18,
    "max": 8.5,
    "min": 8.13,
    "end": 8.16,
    "volume": 1938,
    "money": 15989.33
  },
  {
    "time": "2015-03-30",
    "start": 8.2,
    "max": 8.53,
    "min": 8.11,
    "end": 8.26,
    "volume": 2820.79,
    "money": 23532.99
  },
  {
    "time": "2015-03-27",
    "start": 8.4,
    "max": 8.4,
    "min": 8.01,
    "end": 8.28,
    "volume": 4634.57,
    "money": 38032.68
  },
  {
    "time": "2015-01-06",
    "start": 5.89,
    "max": 6.09,
    "min": 5.84,
    "end": 6.07,
    "volume": 1169.3,
    "money": 6980.48
  },
  {
    "time": "2015-01-05",
    "start": 5.89,
    "max": 6,
    "min": 5.75,
    "end": 5.94,
    "volume": 806.1,
    "money": 4751.15
  }
];

const areaStackGradientData = [
  {'day': 'Mon', 'value': 140, 'group': 1},
  {'day': 'Tue', 'value': 232, 'group': 1},
  {'day': 'Wed', 'value': 101, 'group': 1},
  {'day': 'Thu', 'value': 264, 'group': 1},
  {'day': 'Fri', 'value': 90, 'group': 1},
  {'day': 'Sat', 'value': 340, 'group': 1},
  {'day': 'Sun', 'value': 250, 'group': 1},
  {'day': 'Mon', 'value': 120, 'group': 2},
  {'day': 'Tue', 'value': 282, 'group': 2},
  {'day': 'Wed', 'value': 111, 'group': 2},
  {'day': 'Thu', 'value': 234, 'group': 2},
  {'day': 'Fri', 'value': 220, 'group': 2},
  {'day': 'Sat', 'value': 340, 'group': 2},
  {'day': 'Sun', 'value': 310, 'group': 2},
  {'day': 'Mon', 'value': 320, 'group': 3},
  {'day': 'Tue', 'value': 132, 'group': 3},
  {'day': 'Wed', 'value': 201, 'group': 3},
  {'day': 'Thu', 'value': 334, 'group': 3},
  {'day': 'Fri', 'value': 190, 'group': 3},
  {'day': 'Sat', 'value': 130, 'group': 3},
  {'day': 'Sun', 'value': 220, 'group': 3},
  {'day': 'Mon', 'value': 220, 'group': 4},
  {'day': 'Tue', 'value': 402, 'group': 4},
  {'day': 'Wed', 'value': 231, 'group': 4},
  {'day': 'Thu', 'value': 134, 'group': 4},
  {'day': 'Fri', 'value': 190, 'group': 4},
  {'day': 'Sat', 'value': 230, 'group': 4},
  {'day': 'Sun', 'value': 120, 'group': 4},
  {'day': 'Mon', 'value': 220, 'group': 5},
  {'day': 'Tue', 'value': 302, 'group': 5},
  {'day': 'Wed', 'value': 181, 'group': 5},
  {'day': 'Thu', 'value': 234, 'group': 5},
  {'day': 'Fri', 'value': 210, 'group': 5},
  {'day': 'Sat', 'value': 290, 'group': 5},
  {'day': 'Sun', 'value': 150, 'group': 5},
];

const lineMarkerData = [
  {'day': 'Mon', 'value': 10, 'group': 'Highest'},
  {'day': 'Tue', 'value': 11, 'group': 'Highest'},
  {'day': 'Wed', 'value': 13, 'group': 'Highest'},
  {'day': 'Thu', 'value': 11, 'group': 'Highest'},
  {'day': 'Fri', 'value': 12, 'group': 'Highest'},
  {'day': 'Sat', 'value': 12, 'group': 'Highest'},
  {'day': 'Sun', 'value': 9, 'group': 'Highest'},
  {'day': 'Mon', 'value': 1, 'group': 'Lowest'},
  {'day': 'Tue', 'value': -2, 'group': 'Lowest'},
  {'day': 'Wed', 'value': 2, 'group': 'Lowest'},
  {'day': 'Thu', 'value': 5, 'group': 'Lowest'},
  {'day': 'Fri', 'value': 3, 'group': 'Lowest'},
  {'day': 'Sat', 'value': 2, 'group': 'Lowest'},
  {'day': 'Sun', 'value': 0, 'group': 'Lowest'},
];

const lineSectionsData = [
  [
    '00:00',
    '01:15',
    '02:30',
    '03:45',
    '05:00',
    '06:15',
    '07:30',
    '08:45',
    '10:00',
    '11:15',
    '12:30',
    '13:45',
    '15:00',
    '16:15',
    '17:30',
    '18:45',
    '20:00',
    '21:15',
    '22:30',
    '23:45'
  ],
  [
    300,
    280,
    250,
    260,
    270,
    300,
    550,
    500,
    400,
    390,
    380,
    390,
    400,
    500,
    600,
    750,
    800,
    700,
    600,
    400
  ],
];
