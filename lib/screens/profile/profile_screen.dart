import 'package:flutter/material.dart';

// The Main Profile Screen Widget
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _allowNotifications = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      // Using CustomScrollView to easily combine the app bar and list
      body: CustomScrollView(
        slivers: [
          // --- Custom App Bar ---
          SliverAppBar(
            backgroundColor: Theme.of(context).primaryColor,
            pinned: true, // Keeps the app bar visible
            automaticallyImplyLeading: false, // Removes the default back button
            centerTitle: true,
            title: const Text(
              'طلال الثبيتي',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            leading: TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.edit, color: Colors.white, size: 16),
              label: const Text('تعديل', style: TextStyle(color: Colors.white)),
            ),
            actions: const [
              Padding(
                padding: EdgeInsets.only(left: 16.0),
                child: CircleAvatar(
                  radius: 24,
                  // Replace with your actual image path
                  backgroundImage: AssetImage(
                    'assets/img/Frame 2147238288(2).png',
                  ),
                ),
              ),
            ],
            // --- User Status Chip ---
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(40.0),
              child: Container(
                margin: const EdgeInsets.only(bottom: 10),
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'متفاعل',
                      style: TextStyle(
                        color: Color(0xFF0A5441),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 4),
                    Icon(Icons.star, color: Colors.amber, size: 16),
                  ],
                ),
              ),
            ),
          ),

          // --- List of Profile Options ---
          SliverList(
            delegate: SliverChildListDelegate([
              // --- Account Section ---
              const _SectionHeader(title: 'الحساب'),
              _ProfileMenuItem(
                icon: Icons.location_on_outlined,
                text: 'العنوان الحالي',
                onTap: () {},
              ),
              _ProfileMenuItem(
                icon: Icons.favorite_border,
                text: 'الإعجابات السابقة',
                onTap: () {},
              ),
              _ProfileMenuItem(
                icon: Icons.chat_bubble_outline,
                text: 'الإستفسارات السابقة',
                onTap: () {},
              ),
              _ProfileMenuItem(
                icon: Icons.insert_comment_outlined,
                text: 'الإجابات السابقة',
                onTap: () {},
              ),

              // --- Settings Section ---
              const _SectionHeader(title: 'الإعدادات'),
              _ProfileMenuItem(
                iconWidget: Checkbox(
                  value: _allowNotifications,
                  onChanged: (bool? value) {
                    setState(() {
                      _allowNotifications = value!;
                    });
                  },
                  activeColor: Theme.of(context).primaryColor,
                ),
                text: 'السماح بالاشعارات',
                onTap: () {
                  setState(() {
                    _allowNotifications = !_allowNotifications;
                  });
                },
              ),

              // --- Help Section ---
              const _SectionHeader(title: 'المساعدة'),
              _ProfileMenuItem(
                icon: Icons.support_agent,
                text: 'اتصل بنا',
                onTap: () {},
              ),
              _ProfileMenuItem(
                icon: Icons.help_outline,
                text: 'الأسئلة الشائعة',
                onTap: () {},
              ),
              _ProfileMenuItem(
                icon: Icons.article_outlined,
                text: 'الشروط والأحكام',
                onTap: () {},
              ),
              const SizedBox(height: 20),
            ]),
          ),
        ],
      ),
    );
  }
}

// --- Reusable Custom Widgets ---

/// A simple text widget for section headers (e.g., "الحساب").
class _SectionHeader extends StatelessWidget {
  final String title;
  const _SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.black54,
        ),
      ),
    );
  }
}

/// A reusable tappable list item for the profile screen.
class _ProfileMenuItem extends StatelessWidget {
  final String text;
  final IconData? icon;
  final Widget? iconWidget; // To allow for widgets like Checkbox
  final VoidCallback onTap;

  const _ProfileMenuItem({
    required this.text,
    this.icon,
    this.iconWidget,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  text,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                iconWidget ?? Icon(icon, color: Colors.grey.shade600),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
