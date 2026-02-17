/// Modelo de Resumen
/// Representa el resumen de horas trabajadas en un período
class SummaryModel {
  final String userId;
  final int month;
  final int year;
  final double totalHours;
  final double expectedHours;
  final double extraHours;
  final double pendingHours;
  final List<DailySummary> dailySummaries;

  SummaryModel({
    required this.userId,
    required this.month,
    required this.year,
    required this.totalHours,
    required this.expectedHours,
    required this.extraHours,
    required this.pendingHours,
    required this.dailySummaries,
  });

  /// Crear desde JSON
  factory SummaryModel.fromJson(Map<String, dynamic> json) {
    return SummaryModel(
      userId: json['userId'] as String,
      month: json['month'] as int,
      year: json['year'] as int,
      totalHours: (json['totalHours'] as num).toDouble(),
      expectedHours: (json['expectedHours'] as num).toDouble(),
      extraHours: (json['extraHours'] as num).toDouble(),
      pendingHours: (json['pendingHours'] as num).toDouble(),
      dailySummaries: (json['dailySummaries'] as List<dynamic>)
          .map((e) => DailySummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  /// Convertir a JSON
  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'month': month,
      'year': year,
      'totalHours': totalHours,
      'expectedHours': expectedHours,
      'extraHours': extraHours,
      'pendingHours': pendingHours,
      'dailySummaries': dailySummaries.map((e) => e.toJson()).toList(),
    };
  }

  /// Obtener porcentaje de horas completadas
  double get completionPercentage {
    if (expectedHours == 0) return 0;
    return (totalHours / expectedHours) * 100;
  }

  /// Obtener nombre del mes
  String get monthName {
    const months = [
      'Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio',
      'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'
    ];
    return months[month - 1];
  }
}

/// Resumen diario
class DailySummary {
  final DateTime date;
  final double hours;
  final DayStatus status;

  DailySummary({
    required this.date,
    required this.hours,
    required this.status,
  });

  /// Crear desde JSON
  factory DailySummary.fromJson(Map<String, dynamic> json) {
    return DailySummary(
      date: DateTime.parse(json['date'] as String),
      hours: (json['hours'] as num).toDouble(),
      status: DayStatus.values.firstWhere(
        (e) => e.toString() == 'DayStatus.${json['status']}',
        orElse: () => DayStatus.pending,
      ),
    );
  }

  /// Convertir a JSON
  Map<String, dynamic> toJson() {
    return {
      'date': date.toIso8601String(),
      'hours': hours,
      'status': status.toString().split('.').last,
    };
  }

  /// Obtener día del mes
  int get day => date.day;
}

/// Estado del día
enum DayStatus {
  complete,    // Jornada completa
  incomplete,  // Jornada incompleta
  absence,     // Ausencia
  pending,     // Sin fichar
}

/// Extensión para obtener información de estado del día
extension DayStatusExtension on DayStatus {
  String get displayName {
    switch (this) {
      case DayStatus.complete:
        return 'Jornada completa';
      case DayStatus.incomplete:
        return 'Jornada incompleta';
      case DayStatus.absence:
        return 'Ausencia';
      case DayStatus.pending:
        return 'Sin fichar';
    }
  }
}
