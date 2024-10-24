import 'package:flutter_bloc/flutter_bloc.dart';

enum NotificationFilter { all, unread, transaction, report }

class NotificationFilterState {
  final NotificationFilter selectedFilter;
  NotificationFilterState({required this.selectedFilter});
}

class NotificationFilterCubit extends Cubit<NotificationFilterState> {
  NotificationFilterCubit() : super(NotificationFilterState(selectedFilter: NotificationFilter.all));

  void changeFilter(NotificationFilter filter) {
    emit(NotificationFilterState(selectedFilter: filter));
  }
}
