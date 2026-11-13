
import 'package:flutter/material.dart';
import '../models/cruise_model.dart';

class CruiseViewModel extends ChangeNotifier {
  // Cruise information
  final CruiseModel cruise = CruiseModel(
    name: 'Rajang River Cruise',
    location: 'Sibu, Sarawak',
    description:
    'Experience the beauty of the Rajang River and discover '
        'the surrounding attractions with our river cruise.',
    imageUrl: 'assets/images/rajang_river.jpg',
    rating: 4.5,
    starCount: 41,
  );

  // App states
  DateTime? _visitDate;
  String _selectedPackage = 'Private River Cruise';
  bool _isDarkMode = false;
  int _starCount = 41;

  // Getters
  DateTime? get visitDate => _visitDate;
  String get selectedPackage => _selectedPackage;
  bool get isDarkMode => _isDarkMode;
  int get starCount => _starCount;

  // Update visit date
  void setVisitDate(DateTime date) {
    _visitDate = date;
    notifyListeners();
  }

  // Update cruise package
  void setSelectedPackage(String package) {
    _selectedPackage = package;
    notifyListeners();
  }

  // Toggle dark mode
  void toggleTheme(bool value) {
    _isDarkMode = value;
    notifyListeners();
  }

  // Increase star count
  void incrementStarCount() {
    _starCount++;
    notifyListeners();
  }
}
