import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'app_colors.dart';

/// Tema de la aplicación WorkTime
/// Configuración completa del tema oscuro profesional y minimalista
class AppTheme {
  /// Tema oscuro principal de la aplicación
  static ThemeData get darkTheme {
    return ThemeData(
      // Usar Material Design 3
      useMaterial3: true,
      
      // Tema oscuro
      brightness: Brightness.dark,
      
      // Esquema de colores principal
      colorScheme: const ColorScheme.dark(
        // Color principal de la app
        primary: AppColors.primary,
        // Versión oscura del color principal
        primaryContainer: AppColors.primaryDark,
        // Color secundario (usamos el mismo primary)
        secondary: AppColors.primary,
        // Color de superficie (fondos de cards, dialogs, etc.)
        surface: AppColors.backgroundSecondary,
        // Color de error
        error: AppColors.error,
        // Colores de texto sobre los colores anteriores
        onPrimary: AppColors.textPrimary,
        onSecondary: AppColors.textPrimary,
        onSurface: AppColors.textPrimary,
        onError: AppColors.textPrimary,
      ),

      // Color de fondo principal de las pantallas
      scaffoldBackgroundColor: AppColors.backgroundPrimary,

      // ============================================
      // APPBAR - Barra superior de la app
      // ============================================
      appBarTheme: const AppBarTheme(
        // Color de fondo
        backgroundColor: AppColors.backgroundPrimary,
        // Sin sombra
        elevation: 0,
        // Título centrado
        centerTitle: true,
        // Barra de estado (la barra superior del móvil)
        systemOverlayStyle: SystemUiOverlayStyle.light,
        // Estilo de los iconos
        iconTheme: IconThemeData(
          color: AppColors.iconPrimary,
          size: 24,
        ),
        // Estilo del título
        titleTextStyle: TextStyle(
          color: AppColors.textPrimary,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),

      // ============================================
      // CARDS - Tarjetas de contenido
      // ============================================
      cardTheme: CardThemeData(
        // Color de fondo
        color: AppColors.backgroundCard,
        // Sin sombra
        elevation: 0,
        // Bordes redondeados con línea
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: const BorderSide(
            color: AppColors.border,
            width: 1,
          ),
        ),
        // Margen alrededor de las cards
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),

      // ============================================
      // BOTONES ELEVADOS - Botones principales
      // ============================================
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          // Color de fondo
          backgroundColor: AppColors.primary,
          // Color del texto
          foregroundColor: AppColors.textPrimary,
          // Sin sombra
          elevation: 0,
          // Padding interno
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          // Bordes redondeados
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          // Estilo del texto
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      // ============================================
      // BOTONES DE TEXTO - Botones secundarios
      // ============================================
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          // Color del texto
          foregroundColor: AppColors.primary,
          // Padding interno
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          // Estilo del texto
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      // ============================================
      // BOTONES CON BORDE - Botones terciarios
      // ============================================
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          // Color del texto
          foregroundColor: AppColors.primary,
          // Borde
          side: const BorderSide(color: AppColors.primary, width: 2),
          // Padding interno
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          // Bordes redondeados
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          // Estilo del texto
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      // ============================================
      // INPUTS - Campos de texto
      // ============================================
      inputDecorationTheme: InputDecorationTheme(
        // Fondo relleno
        filled: true,
        fillColor: AppColors.backgroundSecondary,
        
        // Borde normal
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.border),
        ),
        
        // Borde cuando está habilitado pero no enfocado
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.border),
        ),
        
        // Borde cuando está enfocado
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.primary, width: 2),
        ),
        
        // Borde cuando hay error
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.error),
        ),
        
        // Borde cuando hay error y está enfocado
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.error, width: 2),
        ),
        
        // Padding interno del texto
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        
        // Estilo del hint (texto de ayuda)
        hintStyle: const TextStyle(
          color: AppColors.textSecondary,
          fontSize: 16,
        ),
        
        // Estilo del label
        labelStyle: const TextStyle(
          color: AppColors.textSecondary,
          fontSize: 16,
        ),
        
        // Estilo del label cuando está enfocado
        floatingLabelStyle: const TextStyle(
          color: AppColors.primary,
          fontSize: 16,
        ),
      ),

      // ============================================
      // BOTTOM NAVIGATION BAR - Barra de navegación inferior
      // ============================================
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        // Color de fondo
        backgroundColor: AppColors.backgroundSecondary,
        // Color del item seleccionado
        selectedItemColor: AppColors.primary,
        // Color del item no seleccionado
        unselectedItemColor: AppColors.iconSecondary,
        // Tipo fijo (todos los items siempre visibles)
        type: BottomNavigationBarType.fixed,
        // Elevación
        elevation: 8,
        // Estilo del texto seleccionado
        selectedLabelStyle: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
        // Estilo del texto no seleccionado
        unselectedLabelStyle: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),
      ),

      // ============================================
      // ICONOS - Configuración general de iconos
      // ============================================
      iconTheme: const IconThemeData(
        color: AppColors.iconPrimary,
        size: 24,
      ),

      // ============================================
      // DIVIDER - Líneas divisoras
      // ============================================
      dividerTheme: const DividerThemeData(
        color: AppColors.border,
        thickness: 1,
        space: 1,
      ),

      // ============================================
      // FLOATING ACTION BUTTON
      // ============================================
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.textPrimary,
        elevation: 4,
      ),

      // ============================================
      // TIPOGRAFÍA - Estilos de texto
      // ============================================
      textTheme: const TextTheme(
        // ========== TÍTULOS GRANDES ==========
        // Para títulos principales de pantalla
        displayLarge: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: AppColors.textPrimary,
        ),
        displayMedium: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: AppColors.textPrimary,
        ),
        displaySmall: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: AppColors.textPrimary,
        ),
        
        // ========== TÍTULOS DE SECCIONES ==========
        // Para títulos de secciones dentro de pantallas
        headlineLarge: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w600,
          color: AppColors.textPrimary,
        ),
        headlineMedium: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: AppColors.textPrimary,
        ),
        headlineSmall: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: AppColors.textPrimary,
        ),
        
        // ========== TÍTULOS PEQUEÑOS ==========
        // Para títulos de cards y elementos
        titleLarge: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: AppColors.textPrimary,
        ),
        titleMedium: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: AppColors.textPrimary,
        ),
        titleSmall: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: AppColors.textPrimary,
        ),
        
        // ========== TEXTO DEL CUERPO ==========
        // Para párrafos y contenido general
        bodyLarge: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: AppColors.textPrimary,
        ),
        bodyMedium: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: AppColors.textPrimary,
        ),
        bodySmall: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: AppColors.textSecondary,
        ),
        
        // ========== ETIQUETAS ==========
        // Para labels de botones, badges, etc.
        labelLarge: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: AppColors.textPrimary,
        ),
        labelMedium: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: AppColors.textSecondary,
        ),
        labelSmall: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w400,
          color: AppColors.textSecondary,
        ),
      ),
    );
  }
}