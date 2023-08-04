// FIXME: Currency — это одна конкретная валюта USD, RUB, UZS, KZT, etc.
// FIXME: Что нам нужно о ней знать для приложения?
// FIXME: Только ее код. Т.е. Currency — это код валюты. Возможно, это CurrencyCode. Нарисуй единственное свойство `value`.
// FIXME: В этом приложении Currency поведением не обладает, а значит это скорее всего структура
// FIXME: Также нам нужно отличать одну валюту от другой. Структуры equatable из коробки, если свойства — примитивы

// FIXME: *Что будет, если создать в системе Currency с несуществующим кодом?
// FIXME: Типа, CurrencyCode(value: "SPARTA-MONEY"), а не CurrencyCode(value: "USD")?
struct CurrencyCode {
    // FIXME: информация о том «что» и «во что» мы конвертим и так есть у Interactor'a
    let value: ValidCurrencyCodesEnum
    
    init(value: ValidCurrencyCodesEnum) {
        self.value = value
    }
}
