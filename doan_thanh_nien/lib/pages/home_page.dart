// ignore_for_file: library_private_types_in_public_api

import 'package:doan_thanh_nien/pages/activity_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/event/event_event.dart';
import '../bloc/event_bloc.dart';
import '../bloc/state/event_state.dart';
import '../components/my_activity_tile.dart';
import '../components/my_appbar.dart';
import '../components/my_drawer.dart';
import '../components/my_heading.dart';
import '../helpers/search_delegate.dart';

class HomePage extends StatefulWidget {
  final String selectedCategory;
  const HomePage({super.key, required this.selectedCategory});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedCategory = 'All';
  String searchQuery = '';

  void _onSearchChanged(String query) {
    setState(() {
      searchQuery = query.toLowerCase();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EventBloc()..add(LoadEvents(page: 0, limit: 10)),
      child: Scaffold(
        appBar: MyAppbar(
          onPressed: () {
            showSearch(
              context: context,
              delegate: ActivitySearchDelegate(
                activities: context.read<EventBloc>().state is EventLoaded
                    ? (context.read<EventBloc>().state as EventLoaded)
                        .events
                        .map((e) => e.toVolunteerActivity())
                        .toList()
                    : [],
                onSearchChanged: _onSearchChanged,
              ),
            );
          },
          icon: Icons.search_outlined,
        ),
        drawer: MyDrawer(
          onSelectCategory: (category) {
            setState(() {
              selectedCategory = category;
            });
            context.read<EventBloc>().add(LoadEvents(page: 0, limit: 10));
          },
        ),
        body: BlocBuilder<EventBloc, EventState>(
          builder: (context, state) {
            if (state is EventLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is EventError) {
              return Center(child: Text(state.message));
            }
            if (state is EventLoaded) {
              final filteredEvents = state.events.where((event) {
                if (selectedCategory != 'All' && event.eventType != selectedCategory) {
                  return false;
                }
                if (searchQuery.isNotEmpty) {
                  return event.name.toLowerCase().contains(searchQuery) ||
                      event.description.toLowerCase().contains(searchQuery);
                }
                return true;
              }).toList();

              return Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    const MyHeading(text: 'Các hoạt động nổi bật'),
                    const SizedBox(height: 25),
                    Expanded(
                      child: ListView.builder(
                        itemCount: filteredEvents.length,
                        itemBuilder: (context, index) {
                          final event = filteredEvents[index];
                          return MyActivityTile(
                            activity: event.toVolunteerActivity(),
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ActivityDetailPage(
                                  activity: event.toVolunteerActivity(),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            }
            return const Center(child: Text('Không có hoạt động nào'));
          },
        ),
      ),
    );
  }
}
