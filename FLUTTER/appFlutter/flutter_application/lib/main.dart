import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'core/theme/app_theme.dart';
import 'core/routes/app_routes.dart';

/// Punto de entrada de la aplicación WorkTime
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Configurar orientación de pantalla (solo vertical)
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // Configurar la barra de estado
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: Colors.black,
      systemNavigationBarIconBrightness: Brightness.light,
    ),
  );

  runApp(const WorkTimeApp());
}

/// Widget principal de la aplicación
class WorkTimeApp extends StatelessWidget {
  const WorkTimeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      // Título de la aplicación
      title: 'WorkTime',
      
      // Quitar el banner de DEBUG
      debugShowCheckedModeBanner: false,
      
      // Aplicar nuestro tema personalizado
      theme: AppTheme.darkTheme,
      
      // ← CONFIGURACIÓN DEL ROUTER
      // Aquí conectamos GoRouter con MaterialApp
      routerConfig: AppRoutes.router,
    );
  }
}