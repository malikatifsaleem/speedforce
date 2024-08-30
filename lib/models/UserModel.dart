class User {
  final int? id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? gender;
  final String? phone;
  final String? avatar;
  final int? earnings;
  final String? role;
  final String? status;
  final String? isVerified;
  final String? joinedAt;
  final String? ratings;
  final String? bio;

  User({
     this.id,
     this.firstName,
     this.lastName,
    required this.email,
     this.gender,
     this.phone,
     this.avatar,
     this.earnings,
     this.role,
     this.status,
     this.isVerified,
     this.joinedAt,
     this.ratings,
     this.bio,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      email: json['email'],
      gender: json['gender'],
      phone: json['phone'],
      avatar: json['avatar'],
      earnings: json['earnings'],
      role: json['role'],
      status: json['status'],
      isVerified: json['is_verified'],
      joinedAt: json['joined_at'],
      ratings: json['ratings'],
      bio: json['bio'],
    );
  }
}
