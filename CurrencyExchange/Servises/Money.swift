// FIXME: Деньги — это просто деньги. Что мы знаем о них? — 1) Кол-во 2) Какая валюта
// FIXME: Т.е. здесь нужен amount типа Amount и currency типа Currency :)
// FIXME: Если currency убрать, то получится у.е.
class Money {
    // FIXME: ой, а так делать нельзя :)
    // FIXME: все т.н. Value Objects должны быть иммутабельны, т.е. let
    // FIXME: и в этом деньги больше на структуру похожи, а там Swift сам тебе выругается про иммутабельность
    var amount: Float?
    
    init(amount: Float? = nil) {
        self.amount = amount
    }

    // FIXME: мы же вроде хотим получить amount новой валюты из amount текущей, не?
    // FIXME: т.е. у меня УЖЕ есть экземпляр денег с amount внутри, зачем еще один amount?
    // FIXME: если для того, чтобы конвертить любое кол-во (любой amount), то это уже не к Money относится,
    // FIXME: а к отдельному DomainService, который умеет такое вытворять :)
    func converted(amount: Amount, exchangeRate: ExchangeRate) -> Money {
        self.amount = amount.amount * exchangeRate.rate
        return Money(amount: self.amount)
    }
}
