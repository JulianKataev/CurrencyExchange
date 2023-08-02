// FIXME: Довольно абстрактное имя.
// FIXME: Что мы знаем об этих данных?
// FIXME: 1) они в HTTP-ответе (HTTP Response)
// FIXME: 2) конкретно в теле (Payload) ответа
// FIXME: 3) это результат запроса курса конкретно одной валюты
// FIXME: Возможно это CurrencyExchangeRateResponsePayload
struct CurrencyExchangeRateResponsePayload: Codable {
    let result: String
    let provider, documentation, termsOfUse: String
    let timeLastUpdateUnix: Int
    let timeLastUpdateUTC: String
    let timeNextUpdateUnix: Int
    let timeNextUpdateUTC: String
    let timeEOLUnix: Int
    let baseCode: String
    let rates: [String: Float]

    enum CodingKeys: String, CodingKey {
        case result, provider, documentation
        case termsOfUse = "terms_of_use"
        case timeLastUpdateUnix = "time_last_update_unix"
        case timeLastUpdateUTC = "time_last_update_utc"
        case timeNextUpdateUnix = "time_next_update_unix"
        case timeNextUpdateUTC = "time_next_update_utc"
        case timeEOLUnix = "time_eol_unix"
        case baseCode = "base_code"
        case rates
    }
}