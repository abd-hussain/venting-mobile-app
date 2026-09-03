import 'package:venting_mobile_app/domain/data/api/session_join_response_model.dart';

class SessionCallCredentials {
  const SessionCallCredentials({
    required this.callToken,
    required this.channelId,
    required this.expiresAt,
    this.iceServers = const [],
  });

  final String callToken;
  final String channelId;
  final String expiresAt;
  final List<SessionCallIceServer> iceServers;
}

class SessionCallIceServer {
  const SessionCallIceServer({required this.urls});

  final List<String> urls;
}

SessionCallCredentials sessionCallCredentialsFromApi(SessionJoinData data) {
  return SessionCallCredentials(
    callToken: data.call_token.trim(),
    channelId: data.channel_id.trim(),
    expiresAt: data.expires_at.trim(),
    iceServers: (data.ice_servers ?? const <SessionJoinIceServerModel>[])
        .map(
          (server) => SessionCallIceServer(
            urls: server.urls
                .map((url) => url.trim())
                .where((url) => url.isNotEmpty)
                .toList(),
          ),
        )
        .where((server) => server.urls.isNotEmpty)
        .toList(),
  );
}
