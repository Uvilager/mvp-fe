import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mvp_fe/core/providers/theme_provider.dart'; // Import theme provider
import 'package:mvp_fe/core/routes/app_router.dart';
import 'package:mvp_fe/core/theme/app_theme.dart'; // Import theme definitions

Future<void> main() async {
  // Ensure widgets are initialized before loading theme preferences
  WidgetsFlutterBinding.ensureInitialized();
  
  // Load the .env file (with error handling)
  try {
    await dotenv.load(fileName: ".env");
  } catch (e) {
    // If .env file doesn't exist, continue with default values
    print('Warning: .env file not found, using default values');
  }
  
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the theme provider state
    final themeModeAsyncValue = ref.watch(themeNotifierProvider);
    final router = ref.watch(routerProvider);

    // Use a default theme mode while loading, or handle error state
    final currentThemeMode = themeModeAsyncValue.when(
      data: (mode) => mode,
      loading: () => ThemeMode.system, // Or ThemeMode.light
      error: (err, stack) {
        print('Error loading theme: $err');
        return ThemeMode.system; // Fallback theme mode
      },
    );

    // Corrected structure: Single MaterialApp with routerConfig
    return MaterialApp.router(
      routerConfig: router, // Use routerConfig directly
      debugShowCheckedModeBanner: false,
      title: 'MVP App', // Updated title
      theme: AppTheme.lightTheme, // Set light theme
      darkTheme: AppTheme.darkTheme, // Set dark theme
      themeMode: currentThemeMode, // Set theme mode from provider
    );
  }
}
