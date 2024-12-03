part of 'pay_bloc_bloc.dart';

class PaymentState extends Equatable {
  const PaymentState({
    this.wallet_id = '',
    this.cash_amount = '',
    this.payment,
    this.message = '',
    this.postApiStatus = PostApiStatus.initial,
  });

  final String wallet_id;
  final String cash_amount;
  final Payment? payment;
  final String message;
  final PostApiStatus postApiStatus;

  PaymentState copyWith({
    String? wallet_id,
    String? cash_amount,
    Payment? payment,
    String? message,
    PostApiStatus? postApiStatus,
  }) {
    return PaymentState(
      wallet_id: wallet_id ?? this.wallet_id,
      cash_amount: cash_amount ?? this.cash_amount,
      message: message ?? this.message,
      payment: payment ?? this.payment,
      postApiStatus: postApiStatus ?? this.postApiStatus,
    );
  }

  @override
  List<Object?> get props => [
        wallet_id,
        cash_amount,
        message,
        payment,
        postApiStatus,
      ];
}

class Payment {
  final String wallet_id;
  final int cash_amount;

  Payment({
    required this.wallet_id,
    required this.cash_amount,
  });

  factory Payment.fromJson(Map<String, dynamic> json) {
    return Payment(
      wallet_id: json['wallet_id'],
      cash_amount: json['cash_amount'],
    );
  }
}
