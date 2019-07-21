import 'package:rxdart/rxdart.dart';

import '../models/ticket_model.dart';
import '../resources/repository.dart';

class TicketsBloc {
  final _repository = Repository();
  final _ticketsFetcher = PublishSubject<TicketModel>();

  Observable<TicketModel> get allTickets => _ticketsFetcher.stream;

  fetchAllTickets() async {
    TicketModel itemModel = await _repository.fetchAllTickets();
    _ticketsFetcher.sink.add(itemModel);
  }

  dispose() {
    _ticketsFetcher.close();
  }
}

final bloc = TicketsBloc();
