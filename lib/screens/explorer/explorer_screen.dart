// The Main Screen Widget
import 'package:flutter/material.dart';

class ExplorerScreen extends StatefulWidget {
  const ExplorerScreen({super.key});

  @override
  State<ExplorerScreen> createState() => _ExplorerScreenState();
}

class _ExplorerScreenState extends State<ExplorerScreen> {
  int _selectedCategoryIndex = 4; // "الصحة والرياضة" is initially selected

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          children: [
            // --- Custom App Bar ---
            _buildAppBar(),
            const SizedBox(height: 16),

            // --- Category Tabs ---
            _buildCategoryTabs(),
            const SizedBox(height: 24),

            // --- Sports Section ---
            _buildSectionHeader('رياضة'),
            const SizedBox(height: 12),
            _buildSportsList(),
            const SizedBox(height: 24),

            // --- Health Centers Section ---
            _buildSectionHeader('مراكز صحية'),
            const SizedBox(height: 12),
            _buildHealthCentersList(),
          ],
        ),
      ),
    );
  }

  // Helper method for the top app bar
  Widget _buildAppBar() {
    return Container(
      color: const Color(0xFF0A5441),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          const Icon(Icons.tune, color: Colors.white),
          const SizedBox(width: 12),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const TextField(
                textAlign: TextAlign.right,
                decoration: InputDecoration(
                  hintText: 'البحث',
                  border: InputBorder.none,
                  icon: Icon(Icons.search, color: Colors.grey),
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          const Icon(Icons.arrow_forward_ios, color: Colors.white),
        ],
      ),
    );
  }

  // Helper method for the horizontal category tabs
  Widget _buildCategoryTabs() {
    final categories = [
      {'icon': Icons.room_service, 'label': 'الخدمات'},
      {'icon': Icons.store, 'label': 'الاحتياجات اليومية'},
      {'icon': Icons.menu_book, 'label': 'التعليم والثقافة'},
      {'icon': Icons.celebration, 'label': 'الترفيه والفعاليات'},
      {'icon': Icons.sports_soccer, 'label': 'الصحة والرياضة'},
    ];

    return SizedBox(
      height: 90,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        reverse: true, // To start from the right
        itemBuilder: (context, index) {
          final isSelected = _selectedCategoryIndex == index;
          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedCategoryIndex = index;
              });
            },
            child: CategoryTab(
              icon: categories[index]['icon'] as IconData,
              label: categories[index]['label'] as String,
              isSelected: isSelected,
            ),
          );
        },
      ),
    );
  }

  // Helper method for section headers like "Sports"
  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('عرض المزيد', style: TextStyle(color: Colors.grey)),
          Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  // Helper method for the horizontal list of sports cards
  Widget _buildSportsList() {
    return SizedBox(
      height: 200,
      child: ListView(
        scrollDirection: Axis.horizontal,
        reverse: true,
        children: const [
          SportCard(
            imagePath:
                'assets/img/roshanCity.png', // Replace with your image path
            title: 'حديقة سدرة',
            location: 'منطقة أ',
            distance: 'مسافة 1.7 كم',
          ),
          SportCard(
            imagePath: 'assets/img/padel.png', // Replace with your image path
            title: 'كرة قدم',
            location: 'منطقة أ',
            distance: 'مسافة 1.7 كم',
          ),
          SportCard(
            imagePath: 'assets/img/swim.png', // Replace with your image path
            title: 'سباحة',
            location: 'منطقة أ',
            distance: 'مسافة 1.7 كم',
          ),
        ],
      ),
    );
  }

  // Helper method for the vertical list of health center cards
  Widget _buildHealthCentersList() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: const [
          HealthCenterCard(
            imagePath:
                'assets/img/roshanCity.png', // Replace with your image path
            title: 'مستشفى الحبيب',
            location: 'منطقة أ',
            distance: 'مسافة 1.7 كم',
          ),
          SizedBox(height: 12),
          HealthCenterCard(
            imagePath:
                'assets/img/roshanCity.png', // Replace with your image path
            title: 'مركز سدرة',
            location: 'منطقة ب',
            distance: 'مسافة 2.7 كم',
          ),
          SizedBox(height: 12),
          HealthCenterCard(
            imagePath:
                'assets/img/roshanCity.png', // Replace with your image path
            title: 'مركز التأهيل العلاج',
            location: 'منطقة ب',
            distance: 'مسافة 3.7 كم',
          ),
        ],
      ),
    );
  }
}

// --- Reusable Custom Widgets ---

// A single category tab widget
class CategoryTab extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;

  const CategoryTab({
    super.key,
    required this.icon,
    required this.label,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: isSelected ? Colors.white : const Color(0xFF0A5441),
        borderRadius: BorderRadius.circular(12),
        border: isSelected ? Border.all(color: Colors.grey.shade300) : null,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: isSelected ? const Color(0xFF0A5441) : Colors.white,
          ),
          const SizedBox(height: 8),
          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: isSelected ? const Color(0xFF0A5441) : Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

// A card for the horizontal sports list
class SportCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String location;
  final String distance;

  const SportCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.location,
    required this.distance,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: SizedBox(
        width: 150,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Image.asset(imagePath, height: 120, width: 150, fit: BoxFit.cover),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            location,
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            distance,
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 4),
                      const Icon(
                        Icons.location_on,
                        color: Colors.green,
                        size: 16,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// A card for the vertical health centers list
class HealthCenterCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String location;
  final String distance;

  const HealthCenterCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.location,
    required this.distance,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                imagePath,
                width: 100,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            location,
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            distance,
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 4),
                      const Icon(
                        Icons.location_on,
                        color: Colors.green,
                        size: 16,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
