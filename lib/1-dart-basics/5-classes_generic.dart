// ignore_for_file: avoid_print

// Classe 'User' representa um usuário e tem um método 'celebrate' para indicar que o usuário está celebrando.
class User {
  User();

  celebrate() {
    print('User is celebrating 🎉');
  }
}

// Classe 'UserAccount' herda de 'User' e representa uma conta de usuário com informações financeiras.
class UserAccount extends User {
  final double balance;
  final double estimatedPropertyValue;
  final bool specialClient;

  // Construtor da classe 'UserAccount' com parâmetros obrigatórios e opcionais.
  UserAccount({
    required this.balance,
    required this.estimatedPropertyValue,
    this.specialClient = false,
  });
}

/////////////////////////////////////////
// Classes relacionadas à especificação (Specification) para avaliar critérios.

// Classe abstrata 'Specification' define um contrato para verificar critérios de satisfação.
abstract class Specification<T> {
  bool isSatisfied(T entity);

  const Specification();

  // Sobrecarga dos operadores '&' e '|' para ter a possibilidade de combinar especificações com uma sintaxe mais legível.
  Specification<T> operator &(final Specification<T> other) {
    return AndSpecification(this, other);
  }

  Specification<T> operator |(final Specification<T> other) {
    return OrSpecification(this, other);
  }
}

// Classe 'AndSpecification' combina duas especificações com 'E lógico'.
class AndSpecification<T> extends Specification<T> {
  final Specification<T> first;
  final Specification<T> second;

  const AndSpecification(this.first, this.second);

  @override
  bool isSatisfied(final T entity) {
    return first.isSatisfied(entity) && second.isSatisfied(entity);
  }
}

// Classe 'OrSpecification' combina duas especificações com 'OU lógico'.
class OrSpecification<T> extends Specification<T> {
  final Specification<T> first;
  final Specification<T> second;

  const OrSpecification(this.first, this.second);

  @override
  bool isSatisfied(final T entity) {
    return first.isSatisfied(entity) || second.isSatisfied(entity);
  }
}

// Classe abstrata 'UserSpecification' é uma especificação relacionada a usuários.
abstract class UserSpecification<T extends User> extends Specification<T> {
  const UserSpecification();
}

// Classe 'LoanForSpecialCustomerSpecification' verifica se um usuário é um cliente especial.
class LoanForSpecialCustomerSpecification
    extends UserSpecification<UserAccount> {
  const LoanForSpecialCustomerSpecification();

  @override
  bool isSatisfied(final UserAccount entity) {
    return entity.specialClient;
  }
}

// Classe 'LoanWithMinimumAmountSpecification' verifica se o saldo do usuário atende a um valor mínimo.
class LoanWithMinimumAmountSpecification extends Specification<UserAccount> {
  static const double minimumAmount = 1000;

  const LoanWithMinimumAmountSpecification();

  @override
  bool isSatisfied(final UserAccount entity) {
    return entity.balance >= minimumAmount;
  }
}

// Classe 'LoanWithPropertyGuaranteeSpecification' verifica se o valor estimado da propriedade do usuário é suficiente.
class LoanWithPropertyGuaranteeSpecification
    extends Specification<UserAccount> {
  static const double minimumHousePropertyValue = 100000; // 100 mil

  const LoanWithPropertyGuaranteeSpecification();

  @override
  bool isSatisfied(final UserAccount entity) {
    return entity.estimatedPropertyValue >= 100000;
  }
}

void main() {
  // Criando uma instância de 'UserAccount' para um usuário fictício.
  final userAccount = UserAccount(
    balance: 3455,
    estimatedPropertyValue: 105067,
    specialClient: false,
  );

  // Criando instâncias de especificações para avaliação de elegibilidade de empréstimo.
  const loanWithMinimumAmountSpec = LoanWithMinimumAmountSpecification();
  const loanWithPropertyGuaranteeSpec =
      LoanWithPropertyGuaranteeSpecification();
  const loanForSpecialCustomerSpec = LoanForSpecialCustomerSpecification();

  // Combinando especificações usando o operador '&' (E lógico).
  final eligibilityForLoan =
      loanWithMinimumAmountSpec & loanWithPropertyGuaranteeSpec;

  // Avaliando a elegibilidade do usuário para um empréstimo.
  print(eligibilityForLoan.isSatisfied(userAccount));

  ///////////////////

  // Combinando especificações usando o operador '|' (OU lógico).
  final eligibilityForSpecialLoan = loanForSpecialCustomerSpec |
      (loanWithMinimumAmountSpec & loanWithPropertyGuaranteeSpec);

  // Avaliando a elegibilidade do usuário para um empréstimo especial.
  if (eligibilityForSpecialLoan.isSatisfied(userAccount)) {
    userAccount.celebrate();
  }
}
