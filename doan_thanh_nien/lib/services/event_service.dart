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
} 