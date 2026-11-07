import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  static const String _offersKey = 'cached_offers';
  static const String _pendingQrKey = 'pending_qr_scans';

  // --- OFERTAS ---
  static Future<void> saveOffers(List<dynamic> offers) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_offersKey, jsonEncode(offers));
  }

  static Future<List<dynamic>> getCachedOffers() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(_offersKey);
    if (jsonString != null) {
      return jsonDecode(jsonString) as List<dynamic>;
    }
    return [];
  }

  // --- QRs PENDIENTES ---
  static Future<void> addPendingQr(String qrToken) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> pending = prefs.getStringList(_pendingQrKey) ?? [];
    if (!pending.contains(qrToken)) {
      pending.add(qrToken);
      await prefs.setStringList(_pendingQrKey, pending);
    }
  }

  static Future<List<String>> getPendingQrs() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(_pendingQrKey) ?? [];
  }

  static Future<void> clearPendingQrs() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_pendingQrKey);
  }
}