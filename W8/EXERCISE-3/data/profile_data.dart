import 'package:flutter/material.dart';

import '../model/profile_tile_model.dart';

ProfileData ronanProfile = ProfileData(
  name: "Ronan",
  position: "Flutter Developer",
  avatarUrl: 'assets/w8_avatar/boy_avatar.jpg',
  tiles: [
    TileData(icon: Icons.phone, title: "Phone Number", value: "+123 456 7890"),
    TileData(icon: Icons.location_on, title: "Address", value: "123 Cambodia"),
    TileData(icon: Icons.email, title: "Mail", value: "ronan.ogogr@cadt.edu"),
  ],
);

ProfileData sivmeyProfile = ProfileData(
  name: "Sivmey",
  position: "CS Student",
  avatarUrl: 'assets/w8_avatar/girl_avatar.jpg',
  tiles: [
    TileData(icon: Icons.phone, title: "Phone Number", value: "+096 123 4567"),
    TileData(icon: Icons.location_on, title: "Address", value: "National Road 6, Bridge02, Prek Leap, Phnom Penh"),
    TileData(icon: Icons.email, title: "Mail", value: "sivmey@cadt.edu.kh"),
    TileData(icon: Icons.school, title: "University", value: "CADT"),
    TileData(icon: Icons.class_, title: "Year 3", value: "2025-2026"),
    TileData(icon: Icons.volunteer_activism, title: "Volunteer", value: "NextGen")
    ],
  );
