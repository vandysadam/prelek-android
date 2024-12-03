part of 'pay_bloc_bloc.dart';

abstract class PaymentEvent extends Equatable {
  const PaymentEvent();

  @override
  List<Object> get props => [];
}

class walletidChanged extends PaymentEvent {
  const walletidChanged({required this.wallet_id});

  final String wallet_id;

  @override
  List<Object> get props => [wallet_id];
}

class WalletUnfocused extends PaymentEvent {}

class CashAmountChanged extends PaymentEvent {
  const CashAmountChanged({required this.cash_amount});

  final String cash_amount;

  @override
  List<Object> get props => [cash_amount];
}

class CashAmountUnfocused extends PaymentEvent {}

class PayApi extends PaymentEvent {
  final String wallet_id;
  final double cash_amount;

  PayApi({required this.wallet_id, required this.cash_amount});
}
