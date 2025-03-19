import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/event_bloc.dart';
import '../bloc/event/event_event.dart';
import '../bloc/state/event_state.dart';
import '../models/event.dart';
import '../themes/colors.dart';

class ActivityJoinedPage extends StatelessWidget {
  const ActivityJoinedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EventBloc()..add(LoadEvents()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Hoạt động đã tham gia'),
          backgroundColor: AppColor.appBarColor,
        ),
        body: BlocBuilder<EventBloc, EventState>(
          builder: (context, state) {
            if (state is EventLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is EventError) {
              return Center(child: Text('Error: ${state.message}'));
            } else if (state is EventLoaded) {
              return ListView.builder(
                itemCount: state.events.length,
                itemBuilder: (context, index) {
                  final event = state.events[index];
                  return _buildEventCard(context, event);
                },
              );
            }
            return const Center(child: Text('No events found'));
          },
        ),
      ),
    );
  }

  Widget _buildEventCard(BuildContext context, Event event) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (event.eventImages!.isNotEmpty)
            Image.network(
              event.eventImages!.first.imageUrl,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  event.name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  event.description,
                  style: const TextStyle(fontSize: 14),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.calendar_today, size: 16),
                    const SizedBox(width: 4),
                    Text(
                      '${_formatDate(event.date)} - ${_formatDate(event.endDate)}',
                      style: const TextStyle(fontSize: 14),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.location_on, size: 16),
                    const SizedBox(width: 4),
                    Text(
                      event.location,
                      style: const TextStyle(fontSize: 14),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.people, size: 16),
                    const SizedBox(width: 4),
                    Text(
                      '${event.currentRegistrations}/${event.maxRegistrations} người tham gia',
                      style: const TextStyle(fontSize: 14),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Điểm: ${event.score}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      event.eventType,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.blue[700],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }
}
