part of 'download_bloc.dart';

abstract class DownloadEvent extends Equatable {
  const DownloadEvent();
}

class DownloadDatabase extends DownloadEvent {
  final BuildContext context;

  const DownloadDatabase(this.context);

  @override
  List<Object> get props => [context];
}

class CheckDatabaseZipFileIsExist extends DownloadEvent {
  const CheckDatabaseZipFileIsExist();

  @override
  List<Object> get props => [];
}

class CheckDatabaseIsUnzipOrNot extends DownloadEvent {
  const CheckDatabaseIsUnzipOrNot();

  @override
  List<Object> get props => [];
}
