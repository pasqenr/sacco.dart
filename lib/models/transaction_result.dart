import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'transaction_result.g.dart';

/// Represents the result that is returned when broadcasting a transaction.
@JsonSerializable(explicitToJson: true)
class TransactionResult extends Equatable {
  /// String representing the hash of the transaction.
  /// Note that this hash is always present, even if the transaction was
  /// not sent successfully.
  final String hash;

  /// Tells if the transaction was sent successfully or not.
  final bool success;

  /// Tells which error has verified if the sending was not successful.
  /// Please note that this field is going to be:
  /// - `null` if [success] is `true`.
  /// - a valid [TransactionError] if [success] is `false`
  final TransactionError error;

  TransactionResult({
    @required this.hash,
    @required this.success,
    this.error,
  })  : assert(hash != null),
        assert(success || error != null);

  @override
  List<Object> get props {
    return [hash, success, error];
  }

  factory TransactionResult.fromJson(Map<String, dynamic> json) =>
      _$TransactionResultFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionResultToJson(this);
}

/// Contains the data related to an error that has occurred when
/// broadcasting the transaction.
@JsonSerializable(explicitToJson: true)
class TransactionError extends Equatable {
  final int errorCode;
  final String errorMessage;

  TransactionError({
    @required this.errorCode,
    @required this.errorMessage,
  });

  @override
  List<Object> get props {
    return [errorCode, errorMessage];
  }

  factory TransactionError.fromJson(Map<String, dynamic> json) =>
      _$TransactionErrorFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionErrorToJson(this);
}
