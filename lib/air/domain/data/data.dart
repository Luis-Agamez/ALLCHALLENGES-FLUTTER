import '../entities/card_travel.dart';

class SeatsRowData {
  const SeatsRowData({this.seats, this.occupiedSeats});

  final int? seats;
  final List<int>? occupiedSeats;

  static const seatsList = [
    SeatsRowData(seats: 14, occupiedSeats: [5]),
  ];

  static const firstSeatsList = [
    SeatsRowData(seats: 2, occupiedSeats: []),
    SeatsRowData(seats: 2, occupiedSeats: []),
    SeatsRowData(seats: 2, occupiedSeats: []),
    SeatsRowData(seats: 2, occupiedSeats: [1, 2]),
  ];
}

List<CardTravel> cardTravels = [
  CardTravel(
      originName: 'New York City',
      originInitials: 'NYC',
      originDestiny: 'San Francisco',
      destinyInitials: 'SFO',
      number: 'AB689',
      hours: '6h 36min',
      date: 'Mayo 10 11:20 pm',
      price: 1200),
  CardTravel(
      originName: 'San Francisco',
      originInitials: 'SFO',
      originDestiny: 'New York City',
      destinyInitials: 'NYC',
      number: 'AB6219',
      hours: '6h 36min',
      date: 'Mayo 21 09:20 am',
      price: 1200),
  CardTravel(
      originName: 'New Orleans',
      originInitials: 'NOL',
      originDestiny: 'Vegas',
      destinyInitials: 'VGA',
      number: 'AB68923',
      hours: '7h 05min',
      date: 'junio 07 2:20 pm',
      price: 1500),
  CardTravel(
      originName: 'Miami',
      originInitials: 'MAM',
      originDestiny: 'New York City',
      destinyInitials: 'NYC',
      number: 'AG2371',
      hours: '3h 40min',
      date: 'junio 22 11:40 am',
      price: 900),
  CardTravel(
      originName: 'Bogota',
      originInitials: 'BOG',
      originDestiny: 'Monteria',
      destinyInitials: 'MON',
      number: 'OR2567',
      hours: '1h 18min',
      date: 'junio 22 11:40 am',
      price: 500)
];
