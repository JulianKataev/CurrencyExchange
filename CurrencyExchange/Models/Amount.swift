class Amount {
    // FIXME: В финансовых системах сомнительно хранить деньги в типах с плавающей запятой, только в с фиксированной
    // FIXME: Понятно, что от плавающей части избавиться сложно, но это интересная задача, помимо Чистой Архитектуры
    var amount: Float
    
    init(amount: Float) {
        self.amount = amount
    }
}
