import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hackthon/commons/widgets/ctx_common.dart';

class Zone extends StatelessWidget {
  // Parameters to make the widget reusable
  final String imagePath;
  final String title;
  final String location;
  final String category;
  final SvgPicture categoryIcon;
  final bool isNew;

  const Zone({
    super.key,
    required this.imagePath,
    required this.title,
    required this.location,
    required this.category,
    required this.categoryIcon,
    this.isNew = false, // Default to false, so the "New" banner is optional
  });

  @override
  Widget build(BuildContext context) {
    // Using a Card for the shadow and overall shape
    return Card(
      clipBehavior:
          Clip.antiAlias, // Ensures content respects the card's rounded corners
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      elevation: 5,
      child: SizedBox(
        width: 300, // Giving the card a fixed width
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- Image Section with "New" Banner ---
            Stack(
              children: [
                Image.asset(
                  imagePath,
                  height: 150,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                // Show the "New" banner only if isNew is true
                if (isNew)
                  Positioned(
                    top: 10,
                    left: 10,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.green.shade600,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text('new'.tr(), style: context.smallTextBold),
                    ),
                  ),
              ],
            ),

            // --- Middle Section with Title and Location ---
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      title,
                      textAlign: TextAlign.right,
                      style: context.normalTextBold.copyWith(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0A5441),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        location,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey.shade600,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Icon(
                        Icons.location_on,
                        color: Colors.green.shade600,
                        size: 20,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // --- Bottom Section with Category ---
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 12.0,
                vertical: 10.0,
              ),
              color: const Color(0xFF0A5441), // Dark green color
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(category, style: context.normalTextRegular),
                  const SizedBox(width: 8),
                  categoryIcon,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
