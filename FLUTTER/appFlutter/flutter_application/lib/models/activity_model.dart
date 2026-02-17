/// Modelo de Actividad
/// Representa una actividad o evento en el sistema de fichaje
class ActivityModel {
  final String id;              // ID único de la actividad
  final String userId;          // ID del usuario que hizo la actividad
  final ActivityType type;      // Tipo de actividad (entrada, salida, etc.)
  final DateTime timestamp;     // Fecha y hora de la actividad
  final String description;     // Descripción de la actividad
  final String? location;       // Ubicación (opcional)
  final String? notes;          // Notas adicionales (opcional)

  ActivityModel({
    required this.id,
    required this.userId,
    required this.type,
    required this.timestamp,
    required this.description,
    this.location,
    this.notes,
  });

  /// Crear desde JSON
  factory ActivityModel.fromJson(Map<String, dynamic> json) {
    return ActivityModel(
      id: json['id'] as String,
      userId: json['userId'] as String,
      // Convertir el string del tipo a enum
      type: ActivityType.values.firstWhere(
        (e) => e.toString() == 'ActivityType.${json['type']}',
        orElse: () => ActivityType.clockIn, // Valor por defecto
      ),
      timestamp: DateTime.parse(json['timestamp'] as String),
      description: json['description'] as String,
      location: json['location'] as String?,
      notes: json['notes'] as String?,
    );
  }

  /// Convertir a JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      // Convertir el enum a string (solo la última parte)
      'type': type.toString().split('.').last,
      'timestamp': timestamp.toIso8601String(),
      'description': description,
      'location': location,
      'notes': notes,
    };
  }

  /// Copiar con modificaciones
  ActivityModel copyWith({
    String? id,
    String? userId,
    ActivityType? type,
    DateTime? timestamp,
    String? description,
    String? location,
    String? notes,
  }) {
    return ActivityModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      type: type ?? this.type,
      timestamp: timestamp ?? this.timestamp,
      description: description ?? this.description,
      location: location ?? this.location,
      notes: notes ?? this.notes,
    );
  }

  /// Obtener hora formateada (HH:mm)
  /// Ejemplo: "14:30"
  String get formattedTime {
    return '${timestamp.hour.toString().padLeft(2, '0')}:'
           '${timestamp.minute.toString().padLeft(2, '0')}';
  }

  /// Obtener fecha formateada
  /// Ejemplo: "15/02/2024"
  String get formattedDate {
    return '${timestamp.day.toString().padLeft(2, '0')}/'
           '${timestamp.month.toString().padLeft(2, '0')}/'
           '${timestamp.year}';
  }

  @override
  String toString() {
    return 'ActivityModel(id: $id, type: ${type.displayName}, time: $formattedTime)';
  }
}

/// Tipos de actividad en el sistema de fichaje
enum ActivityType {
  clockIn,      // Entrada/Fichar entrada
  clockOut,     // Salida/Fichar salida
  breakStart,   // Inicio de pausa/descanso
  breakEnd,     // Fin de pausa/descanso
  meeting,      // Reunión
  absence,      // Ausencia/Falta
}

/// Extensión para obtener información adicional del tipo de actividad
/// Esto nos permite añadir métodos y propiedades a los enums
extension ActivityTypeExtension on ActivityType {
  /// Nombre para mostrar en la UI
  String get displayName {
    switch (this) {
      case ActivityType.clockIn:
        return 'Entrada';
      case ActivityType.clockOut:
        return 'Salida';
      case ActivityType.breakStart:
        return 'Inicio pausa';
      case ActivityType.breakEnd:
        return 'Fin pausa';
      case ActivityType.meeting:
        return 'Reunión';
      case ActivityType.absence:
        return 'Ausencia';
    }
  }

  /// Nombre del icono (para usar con Icons)
  String get iconName {
    switch (this) {
      case ActivityType.clockIn:
        return 'login';
      case ActivityType.clockOut:
        return 'logout';
      case ActivityType.breakStart:
        return 'pause';
      case ActivityType.breakEnd:
        return 'play';
      case ActivityType.meeting:
        return 'meeting';
      case ActivityType.absence:
        return 'cancel';
    }
  }

  /// Color asociado al tipo de actividad
  /// Retornamos el valor del color en hexadecimal
  int get colorValue {
    switch (this) {
      case ActivityType.clockIn:
        return 0xFF4CAF50;  // Verde (success)
      case ActivityType.clockOut:
        return 0xFFFF5252;  // Rojo (error)
      case ActivityType.breakStart:
        return 0xFFFFB300;  // Amarillo (warning)
      case ActivityType.breakEnd:
        return 0xFF4DA3FF;  // Azul (primary)
      case ActivityType.meeting:
        return 0xFF42A5F5;  // Azul claro (info)
      case ActivityType.absence:
        return 0xFF7C7F85;  // Gris (textTertiary)
    }
  }
}