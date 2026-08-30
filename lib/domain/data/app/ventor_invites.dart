import 'package:venting_mobile_app/domain/data/api/ventor_invites_response_model.dart';
import 'package:venting_mobile_app/domain/data/api/ventor_rewards_response_model.dart';
import 'package:venting_mobile_app/domain/data/app/ventor_rewards.dart';

enum VentorInviteItemStatus { pending, joined, firstSession, bookedCall }

class VentorInviteItemData {
  const VentorInviteItemData({
    required this.id,
    required this.name,
    required this.status,
    required this.pointsEarned,
  });

  final String id;
  final String name;
  final VentorInviteItemStatus status;
  final int pointsEarned;
}

class VentorInvitesOverviewData {
  const VentorInvitesOverviewData({
    required this.inviteCode,
    required this.inviteLink,
    required this.totalInvited,
    required this.invitePointsEarned,
    required this.items,
    required this.earnRules,
  });

  final String inviteCode;
  final String inviteLink;
  final int totalInvited;
  final int invitePointsEarned;
  final List<VentorInviteItemData> items;
  final VentorRewardEarnRulesData earnRules;
}

VentorInvitesOverviewData ventorInvitesOverviewFromApi({
  required VentorInvitesData invites,
  VentorRewardEarnRulesModel? earnRules,
}) {
  return VentorInvitesOverviewData(
    inviteCode: invites.invite_code.trim(),
    inviteLink: invites.invite_link.trim(),
    totalInvited: invites.total_invited,
    invitePointsEarned: invites.invite_points_earned,
    items: [for (final item in invites.items) _inviteItemFromApi(item)],
    earnRules: VentorRewardEarnRulesData(
      pointsPerSession: earnRules?.points_per_session ?? 0,
      pointsPerFriendRegister: earnRules?.points_per_friend_register ?? 0,
      pointsPerInviteFirstSession:
          earnRules?.points_per_invite_first_session ?? 0,
      pointsPerFriendBooking: earnRules?.points_per_friend_booking ?? 0,
    ),
  );
}

VentorInviteItemData _inviteItemFromApi(VentorInviteItemModel item) {
  return VentorInviteItemData(
    id: item.id.trim(),
    name: item.name.trim(),
    status: _inviteStatusFromApi(item.status),
    pointsEarned: item.points_earned,
  );
}

VentorInviteItemStatus _inviteStatusFromApi(String raw) {
  return switch (raw.trim().toLowerCase()) {
    'joined' => VentorInviteItemStatus.joined,
    'first_session' => VentorInviteItemStatus.firstSession,
    'booked_call' => VentorInviteItemStatus.bookedCall,
    _ => VentorInviteItemStatus.pending,
  };
}
