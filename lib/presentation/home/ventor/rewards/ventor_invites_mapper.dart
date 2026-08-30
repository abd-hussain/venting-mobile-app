import 'package:venting_mobile_app/domain/data/app/ventor_invites.dart';
import 'package:venting_mobile_app/presentation/home/ventor/rewards/ventor_rewards_models.dart';

VentorInviteHistoryItem ventorInviteHistoryItemFromData(
  VentorInviteItemData item,
) {
  return VentorInviteHistoryItem(
    id: item.id,
    name: item.name,
    status: _statusFromData(item.status),
    pointsEarned: item.pointsEarned,
  );
}

VentorInviteStatus _statusFromData(VentorInviteItemStatus status) {
  return switch (status) {
    VentorInviteItemStatus.pending => VentorInviteStatus.pending,
    VentorInviteItemStatus.joined => VentorInviteStatus.joined,
    VentorInviteItemStatus.firstSession => VentorInviteStatus.firstSession,
    VentorInviteItemStatus.bookedCall => VentorInviteStatus.bookedCall,
  };
}
