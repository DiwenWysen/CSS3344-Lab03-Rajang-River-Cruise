import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../viewmodels/cruise_viewmodel.dart';

import '../widgets/image_section.dart';
import '../widgets/title_section.dart';
import '../widgets/button_section.dart';
import '../widgets/text_section.dart';
import '../widgets/preferences_section.dart';

class CruiseScreen extends StatelessWidget {
  const CruiseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<CruiseViewModel>();

    return Scaffold(
      body: SafeArea(
        child: OrientationBuilder(
          builder: (context, orientation) {
            if (orientation == Orientation.landscape) {
              return Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: ImageSection(
                      imageUrl: viewModel.cruise.imageUrl,
                    ),
                  ),

                  Expanded(
                    flex: 6,
                    child: ListView(
                      children: [
                        _buildDetails(viewModel),
                      ],
                    ),
                  ),
                ],
              );
            }

            return ListView(
              children: [
                ImageSection(
                  imageUrl: viewModel.cruise.imageUrl,
                ),
                _buildDetails(viewModel),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildDetails(CruiseViewModel viewModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleSection(
          name: viewModel.cruise.name,
          location: viewModel.cruise.location,
          rating: viewModel.cruise.rating,
          starCount: viewModel.starCount,
          onStarPressed: viewModel.incrementStarCount,
        ),

        const ButtonSection(),

        TextSection(
          description: viewModel.cruise.description,
        ),

        PreferenceSection(
          selectedDate: viewModel.visitDate,
          selectedPackage: viewModel.selectedPackage,
          isDarkMode: viewModel.isDarkMode,
          onDateChanged: viewModel.setVisitDate,
          onPackageChanged: viewModel.setSelectedPackage,
          onThemeChanged: viewModel.toggleTheme,
        ),
      ],
    );
  }
}
