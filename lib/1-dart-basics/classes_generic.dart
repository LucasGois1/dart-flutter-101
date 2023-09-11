// ignore_for_file: avoid_print

class User {
  User();

  celebrate() {
    print('User is celebrating 🎉');
  }
}

class UserAccount extends User {
  final double balance;
  final double estimatedPropertyValue;
  final bool specialClient;

  UserAccount({
    required this.balance,
    required this.estimatedPropertyValue,
    this.specialClient = false,
  });
}

/////////////////////////////////////////
abstract class Specification<T> {
  bool isSatisfied(T entity);

  const Specification();

  Specification<T> operator &(final Specification<T> other) {
    return AndSpecification(this, other);
  }

  Specification<T> operator |(final Specification<T> other) {
    return OrSpecification(this, other);
  }
}

class AndSpecification<T> extends Specification<T> {
  final Specification<T> first;
  final Specification<T> second;

  const AndSpecification(this.first, this.second);

  @override
  bool isSatisfied(final T entity) {
    return first.isSatisfied(entity) && second.isSatisfied(entity);
  }
}

class OrSpecification<T> extends Specification<T> {
  final Specification<T> first;
  final Specification<T> second;

  const OrSpecification(this.first, this.second);

  @override
  bool isSatisfied(final T entity) {
    return first.isSatisfied(entity) || second.isSatisfied(entity);
  }
}

abstract class UserSpecification<T extends User> extends Specification<T> {
  const UserSpecification();
}

class LoanForSpecialCustomerSpecification
    extends UserSpecification<UserAccount> {
  const LoanForSpecialCustomerSpecification();

  @override
  bool isSatisfied(final UserAccount entity) {
    return entity.specialClient;
  }
}

class LoanWithMinimumAmountSpecification extends Specification<UserAccount> {
  static const double minimumAmount = 1000;

  const LoanWithMinimumAmountSpecification();

  @override
  bool isSatisfied(final UserAccount entity) {
    return entity.balance >= minimumAmount;
  }
}

class LoanWithPropertyGuaranteeSpecification
    extends Specification<UserAccount> {
  static const double minimumHousePropertyValue = 100000; // 100mil

  const LoanWithPropertyGuaranteeSpecification();

  @override
  bool isSatisfied(final UserAccount entity) {
    return entity.estimatedPropertyValue >= 100000;
  }
}

void main() {
  final userAccount = UserAccount(
    balance: 3455,
    estimatedPropertyValue: 105067,
    specialClient: false,
  );

  const loanWithMinimumAmountSpec = LoanWithMinimumAmountSpecification();
  const loanWithPropertyGuaranteeSpec =
      LoanWithPropertyGuaranteeSpecification();
  const loanForSpecialCustomerSpec = LoanForSpecialCustomerSpecification();

  final eligibilityForLoan =
      loanWithMinimumAmountSpec & loanWithPropertyGuaranteeSpec;

  print(eligibilityForLoan.isSatisfied(userAccount));

  ///////////////////

  final eligibilityForSpecialLoan = loanForSpecialCustomerSpec |
      (loanWithMinimumAmountSpec & loanWithPropertyGuaranteeSpec);

  print(eligibilityForSpecialLoan.isSatisfied(userAccount));
}
