import 'package:venting_mobile_app/domain/data/api/listener_earnings_response_model.dart';
import 'package:venting_mobile_app/domain/data/api/listener_payout_response_model.dart';

class ListenerPayoutBalances {
  const ListenerPayoutBalances({
    required this.available,
    required this.pending,
    required this.lifetime,
  });

  final double available;
  final double pending;
  final double lifetime;
}

class ListenerBankAccount {
  const ListenerBankAccount({
    required this.methodId,
    required this.accountHolderName,
    required this.bankName,
    required this.ibanOrAccountNumber,
    this.swiftCode,
  });

  final String methodId;
  final String accountHolderName;
  final String bankName;
  final String ibanOrAccountNumber;
  final String? swiftCode;
}

enum ListenerPayoutHistoryStatus { completed, pending, failed }

class ListenerPayoutHistoryEntry {
  const ListenerPayoutHistoryEntry({
    required this.id,
    required this.amount,
    required this.date,
    required this.status,
    required this.methodLabel,
    this.reference,
  });

  final String id;
  final double amount;
  final DateTime date;
  final ListenerPayoutHistoryStatus status;
  final String methodLabel;
  final String? reference;
}

class ListenerPaymentPayoutsOverview {
  const ListenerPaymentPayoutsOverview({
    required this.balances,
    this.bankAccount,
  });

  final ListenerPayoutBalances balances;
  final ListenerBankAccount? bankAccount;
}

ListenerPaymentPayoutsOverview listenerPaymentPayoutsOverviewFromApi({
  required ListenerPayoutBalancesData balances,
  required ListenerPayoutMethodsData methods,
}) {
  return ListenerPaymentPayoutsOverview(
    balances: ListenerPayoutBalances(
      available: balances.available.toDouble(),
      pending: balances.pending.toDouble(),
      lifetime: balances.lifetime.toDouble(),
    ),
    bankAccount: listenerBankAccountFromApi(methods),
  );
}

List<ListenerPayoutHistoryEntry> listenerPayoutHistoryFromApi(
  ListenerPayoutsListData payouts,
) {
  return [
    for (final item in payouts.items) listenerPayoutHistoryEntryFromApi(item),
  ];
}

ListenerBankAccount? listenerBankAccountFromApi(
  ListenerPayoutMethodsData data,
) {
  if (data.methods.isEmpty) return null;

  final defaultId = data.default_method?.trim();
  ListenerPayoutMethodModel? method;

  if (defaultId != null && defaultId.isNotEmpty) {
    for (final item in data.methods) {
      if (item.id == defaultId) {
        method = item;
        break;
      }
    }
  }

  if (method == null || !_isBankMethod(method)) {
    for (final item in data.methods) {
      if (_isBankMethod(item)) {
        method = item;
        break;
      }
    }
  }

  if (method == null || !_isBankMethod(method)) return null;

  final holder = method.account_holder_name?.trim() ?? '';
  final bankName = method.bank_name?.trim() ?? '';
  final iban = method.iban_or_account?.trim() ?? '';
  if (holder.isEmpty || bankName.isEmpty || iban.isEmpty) return null;

  return ListenerBankAccount(
    methodId: method.id,
    accountHolderName: holder,
    bankName: bankName,
    ibanOrAccountNumber: iban,
    swiftCode: method.swift_code?.trim().isNotEmpty == true
        ? method.swift_code!.trim()
        : null,
  );
}

ListenerPayoutHistoryEntry listenerPayoutHistoryEntryFromApi(
  ListenerPayoutItemModel item,
) {
  return ListenerPayoutHistoryEntry(
    id: item.id,
    amount: item.amount.toDouble(),
    date: DateTime.tryParse(item.date)?.toLocal() ?? DateTime.now(),
    status: _historyStatusFromApi(item.status),
    methodLabel: item.method_label.trim(),
    reference: item.reference?.trim().isNotEmpty == true
        ? item.reference!.trim()
        : null,
  );
}

Map<String, dynamic> listenerBankAccountToApiBody({
  required String accountHolderName,
  required String bankName,
  required String ibanOrAccountNumber,
  String? swiftCode,
}) {
  return {
    'account_holder_name': accountHolderName,
    'bank_name': bankName,
    'iban_or_account_number': ibanOrAccountNumber,
    if (swiftCode != null && swiftCode.trim().isNotEmpty)
      'swift_code': swiftCode.trim(),
  };
}

bool _isBankMethod(ListenerPayoutMethodModel method) {
  return method.type.trim().toLowerCase() == 'bank';
}

ListenerPayoutHistoryStatus _historyStatusFromApi(String raw) {
  return switch (raw.trim().toLowerCase()) {
    'completed' => ListenerPayoutHistoryStatus.completed,
    'failed' => ListenerPayoutHistoryStatus.failed,
    _ => ListenerPayoutHistoryStatus.pending,
  };
}
