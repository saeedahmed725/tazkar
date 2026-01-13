part of 'download_bloc.dart';

abstract class DownloadState extends Equatable {
  const DownloadState();
}

class DownloadInitial extends DownloadState {
  @override
  List<Object> get props => [];
}

class DownloadLoading extends DownloadState {
  @override
  List<Object> get props => [];
}

class DownloadDone extends DownloadState {
  final bool isDone;

  const DownloadDone(this.isDone);

  @override
  List<Object> get props => [isDone];
}

class CheckDatabaseDone extends DownloadState {
  final Unit unit;
  const CheckDatabaseDone(this.unit);

  @override
  List<Object> get props => [unit];
}

class CheckDatabaseExistDone extends DownloadState {
  final bool isExist;

  const CheckDatabaseExistDone(this.isExist);

  @override
  List<Object> get props => [isExist];
}

class DownloadFailed extends DownloadState {
  final Failure failure;

  const DownloadFailed(this.failure);

  @override
  List<Object> get props => [failure];
}
