/// Modelo de Actividad
/// Representa una actividad o evento en el sistema de fichaje
class ActivityModel {
  final String id;
  final String userId;
  final ActivityType type;
  final DateTime timestamp;
  final String description;
  final String? location;
  final String? notes;

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
      type: ActivityType.values.firstWhere(
        (e) => e.toString() == 'ActivityType.${json['type']}',
        orElse: () => ActivityType.clockIn,
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

  /// Obtener hora formateada
  String get formattedTime {
    return '${timestamp.hour.toString().padLeft(2, '0')}:${timestamp.minute.toString().padLeft(2, '0')}';
  }
}

/// Tipos de actividad
enum ActivityType {
  clockIn,      // Entrada
  clockOut,     // Salida
  breakStart,   // Inicio de pausa
  breakEnd,     // Fin de pausa
  meeting,      // Reunión
  absence,      // Ausencia
}

/// Extensión para obtener información de tipo de actividad
extension ActivityTypeExtension on ActivityType {
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
}
