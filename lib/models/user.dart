class User {
  final String id;
  final String name;
  final String email;
  final String phone;
  final String bio;
  final String profilePictureUrl;

  const User({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.bio,
    required this.profilePictureUrl,
  });

  User copyWith({
    String? id,
    String? name,
    String? email,
    String? phone,
    String? bio,
    String? profilePictureUrl,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      bio: bio ?? this.bio,
      profilePictureUrl: profilePictureUrl ?? this.profilePictureUrl,
    );
  }

  @override
  String toString() {
    return 'User(id: $id, name: $name, email: $email, phone: $phone, bio: $bio, profilePictureUrl: $profilePictureUrl)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is User &&
        other.id == id &&
        other.name == name &&
        other.email == email &&
        other.phone == phone &&
        other.bio == bio &&
        other.profilePictureUrl == profilePictureUrl;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        email.hashCode ^
        phone.hashCode ^
        bio.hashCode ^
        profilePictureUrl.hashCode;
  }
}