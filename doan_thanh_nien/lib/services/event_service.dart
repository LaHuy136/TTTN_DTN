import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/event.dart';

class EventService {
  static const String baseUrl = 'https://servicescore-backend-1.onrender.com/api/v1';

  Future<List<Event>> getEvents({int page = 0, int limit = 10}) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/events/all?page=$page&limit=$limit'),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        final List<dynamic> eventsJson = data['events'];
        return eventsJson.map((json) => Event.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load events: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching events: $e');
    }
  }

Future<List<Event>> getRegisteredEvents(String token) async {
  try {
    final response = await http.get(
      Uri.parse('$baseUrl/registrations/user/getevents'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      // Parse response trực tiếp thành List
      final List<dynamic> eventsJson = json.decode(response.body);
      print('API response: $eventsJson'); // Log để kiểm tra

      return eventsJson.map((json) {
        try {
          return Event.fromJson(json);
        } catch (e) {
          print('Error parsing event JSON: $json');
          print('Error details: $e');
          throw e;
        }
      }).toList();
    } else {
      throw Exception('Failed to load registered events: ${response.statusCode}');
    }
  } catch (e) {
    throw Exception('Error fetching registered events: $e');
  }
}

  Future<void> registerEvent(int eventId, String token) async {
    final response = await http.post(
      Uri.parse('$baseUrl/registrations/$eventId'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to register for event');
    }
  }
} 