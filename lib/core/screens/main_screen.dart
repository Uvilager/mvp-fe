import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

// No longer need to import individual screen types here for IndexedStack
// import '../../features/leaderboard/presentation/screens/leaderboard_screen.dart';
// DashboardPage import is no longer needed here

// selectedIndexProvider is no longer the primary way to manage state, GoRouter handles it.
// We might still use a provider to *calculate* the index from the route if needed,
// but direct state update is replaced by navigation.

class MainScreen extends ConsumerWidget {
  /// The widget to display in the body of the Scaffold.
  /// Should be the active screen selected by the ShellRoute.
  final Widget child;

  const MainScreen({required this.child, super.key});

  // Helper method to determine the selected index based on the current route
  int _calculateSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).matchedLocation;
    if (location.startsWith('/projects')) {
      return 0;
    }
    if (location.startsWith('/fundraisers')) {
      return 1;
    }
    if (location.startsWith('/home')) {
      return 2;
    }
    if (location.startsWith('/sponsors')) {
      return 3;
    }
    if (location.startsWith('/settings')) {
      return 4;
    }
    return 2;
  }

  // Helper method to navigate to the correct route based on index
  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        GoRouter.of(context).go('/projects');
        break;
      case 1:
        GoRouter.of(context).go('/fundraisers');
        break;
      case 2:
        GoRouter.of(context).go('/home');
        break;
      case 3:
        GoRouter.of(context).go('/sponsors');
        break;
      case 4:
        GoRouter.of(context).go('/settings');
        break;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int selectedIndex = _calculateSelectedIndex(context);

    // EXACT same colors as other screens
    const Color primaryColor = Color(0xFFf08a6e);
    const Color secondaryColor = Color(0xFF2c3e50);
    const Color lightColor = Color(0xFFf9f7f4);
    const Color whiteColor = Colors.white;

    return Scaffold(
      body: child,
      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: selectedIndex,
        onItemTapped: (index) => _onItemTapped(index, context),
      ),
    );
  }
}

class CustomBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const CustomBottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Color(0xFFf08a6e);
    const Color whiteColor = Colors.white;

    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: primaryColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 0,
            blurRadius: 20,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(
                icon: Icons.assignment_outlined,
                activeIcon: Icons.assignment,
                index: 0,
                isSelected: selectedIndex == 0,
              ),
              _buildNavItem(
                icon: Icons.volunteer_activism_outlined,
                activeIcon: Icons.volunteer_activism,
                index: 1,
                isSelected: selectedIndex == 1,
              ),
              // Larger Home Button
              _buildHomeButton(
                isSelected: selectedIndex == 2,
              ),
              _buildNavItem(
                icon: Icons.handshake_outlined,
                activeIcon: Icons.handshake,
                index: 3,
                isSelected: selectedIndex == 3,
              ),
              _buildNavItem(
                icon: Icons.settings_outlined,
                activeIcon: Icons.settings,
                index: 4,
                isSelected: selectedIndex == 4,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required IconData icon,
    required IconData activeIcon,
    required int index,
    required bool isSelected,
  }) {
    const Color whiteColor = Colors.white;
    
    return GestureDetector(
      onTap: () => onItemTapped(index),
      child: Container(
        padding: const EdgeInsets.all(12),
        child: Icon(
          isSelected ? activeIcon : icon,
          color: isSelected ? whiteColor : whiteColor.withOpacity(0.7),
          size: 26,
        ),
      ),
    );
  }

  Widget _buildHomeButton({
    required bool isSelected,
  }) {
    const Color primaryColor = Color(0xFFf08a6e);
    const Color whiteColor = Colors.white;
    
    return GestureDetector(
      onTap: () => onItemTapped(2),
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          color: whiteColor,
          shape: BoxShape.circle,
          border: Border.all(
            color: whiteColor,
            width: 3,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              spreadRadius: 0,
              blurRadius: 10,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Icon(
          isSelected ? Icons.home : Icons.home_outlined,
          color: primaryColor,
          size: 30,
        ),
      ),
    );
  }
}
