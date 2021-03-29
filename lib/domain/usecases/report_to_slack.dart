import 'package:injectable/injectable.dart';
import 'package:minitel_toolbox/data/datasources/slack/slack_remote_data_source.dart';

@injectable
class ReportToSlack {
  final SlackRemoteDataSource dataSource;

  const ReportToSlack(this.dataSource);

  Future<String> call(
    String text, {
    Map<String, String>? attachments,
    String channel = 'projet_flutter_notif',
  }) {
    return dataSource.report(
      text,
      attachments: attachments,
      channel: channel,
    );
  }
}
