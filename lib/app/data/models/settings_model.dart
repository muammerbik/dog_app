// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class SettingsModel {
  final String title;
  final Widget icon;
  SettingsModel({
    required this.title,
    required this.icon,
  });
}

List<SettingsModel> settingsModelList = [
  SettingsModel(title: "Premium", icon: const Icon(Icons.money)),
  SettingsModel(title: "Share app", icon: const Icon(Icons.send)),
  SettingsModel(title: "Rate US", icon: const Icon(Icons.star)),
  SettingsModel(title: "Contact Us", icon: const Icon(Icons.contact_emergency)),
   SettingsModel(title: "Terms of service", icon: const Icon(Icons.document_scanner_outlined)),
   SettingsModel(title: "Privacy Policy", icon: const Icon(Icons.private_connectivity)),



];
