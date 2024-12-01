package calculator.app.model

data class CalculatorModel(
    var currentInput: String = "",
    var oldInput: String = "",
    var operand: String = ""
) {
    fun calculateResult(): String {
        if (oldInput.isNotEmpty() && currentInput.isNotEmpty() && operand.isNotEmpty()) {
            val num1 = oldInput.toDoubleOrNull()
            val num2 = currentInput.toDoubleOrNull()
            if (num1 != null && num2 != null) {
                return when (operand) {
                    "+" -> (num1 + num2).toString()
                    "-" -> (num1 - num2).toString()
                    "×" -> (num1 * num2).toString()
                    "÷" -> if (num2 != 0.0) (num1 / num2).toString() else "Error"
                    else -> "Error"
                }
            }
        }
        return ""
    }

    fun clearAll() {
        currentInput = ""
        oldInput = ""
        operand = ""
    }
}
