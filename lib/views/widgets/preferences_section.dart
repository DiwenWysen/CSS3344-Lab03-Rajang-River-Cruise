import 'package:flutter/material.dart';

class PreferenceSection extends StatelessWidget {
  final DateTime? selectedDate;
  final String selectedPackage;
  final bool isDarkMode;

  final Function(DateTime) onDateChanged;
  final Function(String) onPackageChanged;
  final Function(bool) onThemeChanged;

  const PreferenceSection({
    super.key,
    required this.selectedDate,
    required this.selectedPackage,
    required this.isDarkMode,
    required this.onDateChanged,
    required this.onPackageChanged,
    required this.onThemeChanged,
  });

  final List<String> packages = const [
    'Private River Cruise',
    'Sunset Cruise',
    'Sunrise Cruise',
    'Rural Cruise',
    'SMI Park Cruise',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Visit Date',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),

          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              icon: const Icon(Icons.calendar_month),
              label: Text(
                selectedDate == null
                    ? 'Select Visit Date'
                    : '${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}',
              ),
              onPressed: () async {
                final DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: selectedDate ?? DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime.now().add(
                    const Duration(days: 365),
                  ),
                );

                if (pickedDate != null) {
                  onDateChanged(pickedDate);
                }
              },
            ),
          ),

          const SizedBox(height: 20),

          const Text(
            'Cruise Package',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),

          DropdownButtonFormField<String>(
            value: selectedPackage,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.directions_boat),
            ),
            items: packages.map((String package) {
              return DropdownMenuItem<String>(
                value: package,
                child: Text(package),
              );
            }).toList(),
            onChanged: (String? newValue) {
              if (newValue != null) {
                onPackageChanged(newValue);
              }
            },
          ),

          const SizedBox(height: 20),

          SwitchListTile(
            contentPadding: EdgeInsets.zero,
            title: const Text('Dark Mode'),
            secondary: const Icon(Icons.dark_mode),
            value: isDarkMode,
            onChanged: onThemeChanged,
          ),
        ],
      ),
    );
  }
}
