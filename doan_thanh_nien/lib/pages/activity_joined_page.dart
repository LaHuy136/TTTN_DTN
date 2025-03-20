import 'package:doan_thanh_nien/components/my_appbar.dart';
import 'package:doan_thanh_nien/components/my_heading.dart';
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
        appBar: const MyAppbar(),
        body: BlocBuilder<EventBloc, EventState>(
          builder: (context, state) {
            if (state is EventLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is EventError) {
              return Center(child: Text('Error: ${state.message}'));
            } else if (state is EventLoaded) {
              return Column(
                children: [
                  const SizedBox(
                    height: 8,
                  ),
                  const MyHeading(text: 'Các hoạt động đã tham gia'),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: state.events
                            .map((event) => _buildEventCard(context, event))
                            .toList(),
                      ),
                    ),
                  ),
                ],
              );
            }
            return const Center(child: Text('No events found'));
          },
        ),
      ),
    );
  }

  Widget _buildEventCard(BuildContext context, Event event) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        elevation: 3,
        // margin: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (event.eventImages != null && event.eventImages!.isNotEmpty)
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image.network(
                  event.eventImages!.first.imageUrl,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    event.name,
                    style: TextStyle(
                      color: AppColor.textColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    event.description,
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColor.textColor,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(
                        Icons.date_range,
                        size: 16,
                        color: AppColor.textColor,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '${_formatDate(event.date)} - ${_formatDate(event.endDate)}',
                        style:
                            TextStyle(fontSize: 14, color: AppColor.textColor),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        color: AppColor.textColor,
                        size: 16,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        event.location,
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColor.textColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(
                        Icons.people,
                        size: 16,
                        color: AppColor.textColor,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '${event.currentRegistrations}/${event.maxRegistrations} người tham gia',
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColor.textColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Điểm: ${event.score}',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppColor.textColor,
                        ),
                      ),
                      Text(
                        event.eventType,
                        style: TextStyle(
                            fontSize: 14,
                            color: AppColor.textColor,
                            fontWeight: FontWeight.bold, textBaseline: TextBaseline.alphabetic),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }
}
