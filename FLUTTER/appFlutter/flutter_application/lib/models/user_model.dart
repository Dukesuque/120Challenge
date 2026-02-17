/// Modelo de Usuario
/// Representa los datos de un usuario de la aplicación WorkTime
class UserModel {
  // Propiedades del usuario
  final String id;              // ID único del usuario
  final String name;            // Nombre completo
  final String email;           // Email
  final String position;        // Cargo/Puesto
  final int age;                // Edad
  final String? avatarUrl;      // URL del avatar (opcional)
  final String? phone;          // Teléfono (opcional)
  final String? department;     // Departamento (opcional)
  final DateTime? startDate;    // Fecha de inicio en la empresa (opcional)

  // Constructor
  // 'required' = obligatorio, sin '?' = no puede ser null
  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.position,
    required this.age,
    this.avatarUrl,      // Estos son opcionales
    this.phone,
    this.department,
    this.startDate,
  });

  /// Crear un UserModel desde JSON
  /// Esto es útil cuando recibes datos de una API
  /// Ejemplo: UserModel.fromJson(jsonData)
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      position: json['position'] as String,
      age: json['age'] as int,
      avatarUrl: json['avatarUrl'] as String?,
      phone: json['phone'] as String?,
      department: json['department'] as String?,
      // Si startDate existe en el JSON, lo convertimos a DateTime
      startDate: json['startDate'] != null 
          ? DateTime.parse(json['startDate'] as String)
          : null,
    );
  }

  /// Convertir el UserModel a JSON
  /// Útil para enviar datos a una API o guardar en base de datos
  /// Ejemplo: user.toJson()
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'position': position,
      'age': age,
      'avatarUrl': avatarUrl,
      'phone': phone,
      'department': department,
      // Si startDate existe, lo convertimos a String ISO 8601
      'startDate': startDate?.toIso8601String(),
    };
  }

  /// Método copyWith para crear una copia con modificaciones
  /// Esto es útil para mantener la inmutabilidad
  /// Ejemplo: user.copyWith(name: "Nuevo Nombre")
  UserModel copyWith({
    String? id,
    String? name,
    String? email,
    String? position,
    int? age,
    String? avatarUrl,
    String? phone,
    String? department,
    DateTime? startDate,
  }) {
    return UserModel(
      id: id ?? this.id,                    // Si 'id' es null, usa el actual
      name: name ?? this.name,
      email: email ?? this.email,
      position: position ?? this.position,
      age: age ?? this.age,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      phone: phone ?? this.phone,
      department: department ?? this.department,
      startDate: startDate ?? this.startDate,
    );
  }

  /// Método toString para debugging
  /// Útil cuando haces print(user)
  @override
  String toString() {
    return 'UserModel(id: $id, name: $name, email: $email, position: $position)';
  }
}