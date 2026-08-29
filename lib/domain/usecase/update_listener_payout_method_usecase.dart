import 'package:fpdart/fpdart.dart';
import 'package:venting_mobile_app/domain/data/app/listener_payouts.dart';
import 'package:venting_mobile_app/domain/data/exceptions/main_api_exception.dart';
import 'package:venting_mobile_app/domain/repository/api/listener/listener_payouts_repository.dart';

class UpdateListenerPayoutMethodUsecase {
  final ListenerPayoutsRepository listenerPayoutsRepository;

  const UpdateListenerPayoutMethodUsecase(this.listenerPayoutsRepository);

  TaskEither<Exception, ListenerBankAccount> call({
    required String accountHolderName,
    required String bankName,
    required String ibanOrAccountNumber,
    String? swiftCode,
  }) {
    return listenerPayoutsRepository
        .updatePayoutMethod(
          body: listenerBankAccountToApiBody(
            accountHolderName: accountHolderName,
            bankName: bankName,
            ibanOrAccountNumber: ibanOrAccountNumber,
            swiftCode: swiftCode,
          ),
        )
        .map((response) {
          final method = response.data;
          final holder = method.account_holder_name?.trim() ?? '';
          final bank = method.bank_name?.trim() ?? '';
          final iban = method.iban_or_account?.trim() ?? '';

          if (holder.isEmpty || bank.isEmpty || iban.isEmpty) {
            throw const MainAPIException(
              status: 'failed',
              type: 'parse',
              code: -3,
              message: 'Invalid payout method response',
            );
          }

          return ListenerBankAccount(
            methodId: method.id,
            accountHolderName: holder,
            bankName: bank,
            ibanOrAccountNumber: iban,
            swiftCode: method.swift_code?.trim().isNotEmpty == true
                ? method.swift_code!.trim()
                : null,
          );
        });
  }
}
