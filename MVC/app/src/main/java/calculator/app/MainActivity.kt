package calculator.app

import android.os.Bundle
import android.widget.Button
import android.widget.ImageButton
import android.widget.TextView
import androidx.appcompat.app.AppCompatActivity
import calculator.app.model.CalculatorModel

class MainActivity : AppCompatActivity() {

    private lateinit var tvInput: TextView
    private lateinit var tvOldInput: TextView
    private lateinit var tvCurrentOperand: TextView
    private val calculatorModel = CalculatorModel()

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        // Initialize UI elements
        tvInput = findViewById(R.id.tvInput)
        tvOldInput = findViewById(R.id.tvOldInput)
        tvCurrentOperand = findViewById(R.id.tvCurrentOperand)

        val buttons = listOf(
            R.id.btnZero to "0",
            R.id.btnOne to "1",
            R.id.btnTwo to "2",
            R.id.btnThree to "3",
            R.id.btnFour to "4",
            R.id.btnFive to "5",
            R.id.btnSix to "6",
            R.id.btnSeven to "7",
            R.id.btnEight to "8",
            R.id.btnNine to "9",
            R.id.btnDot to "."
        )

        buttons.forEach { (id, value) ->
            findViewById<Button>(id).setOnClickListener { appendToInput(value) }
        }

        findViewById<Button>(R.id.btnPLus).setOnClickListener { setOperand("+") }
        findViewById<Button>(R.id.btnMinus).setOnClickListener { setOperand("-") }
        findViewById<Button>(R.id.btnMultiply).setOnClickListener { setOperand("×") }
        findViewById<Button>(R.id.btnDivide).setOnClickListener { setOperand("÷") }

        findViewById<Button>(R.id.allClear).setOnClickListener { clearAll() }
        findViewById<Button>(R.id.clear).setOnClickListener { clearInput() }
        findViewById<ImageButton>(R.id.btnBackspace).setOnClickListener { backspace() }

        findViewById<Button>(R.id.btnEqual).setOnClickListener { calculateResult() }
    }

    private fun appendToInput(value: String) {
        if (value == "." && calculatorModel.currentInput.contains(".")) return
        calculatorModel.currentInput += value
        updateInputDisplay()
    }

    private fun setOperand(op: String) {
        if (calculatorModel.currentInput.isNotEmpty()) {
            if (calculatorModel.oldInput.isEmpty()) {
                calculatorModel.oldInput = calculatorModel.currentInput
            } else if (calculatorModel.operand.isNotEmpty()) {
                calculateResult() // Auto-calculate before chaining operations
            }
            calculatorModel.operand = op
            calculatorModel.currentInput = ""
            updateInputDisplay()
            updateOperandDisplay()
        }
    }

    private fun calculateResult() {
        calculatorModel.oldInput = calculatorModel.calculateResult()
        calculatorModel.currentInput = ""
        calculatorModel.operand = ""
        updateInputDisplay()
        updateOperandDisplay()
        tvOldInput.text = calculatorModel.oldInput
    }

    private fun clearAll() {
        calculatorModel.clearAll()
        updateInputDisplay()
        updateOperandDisplay()
        tvOldInput.text = ""
    }

    private fun clearInput() {
        calculatorModel.currentInput = ""
        updateInputDisplay()
    }

    private fun backspace() {
        if (calculatorModel.currentInput.isNotEmpty()) {
            calculatorModel.currentInput = calculatorModel.currentInput.dropLast(1)
            updateInputDisplay()
        }
    }

    private fun updateInputDisplay() {
        tvInput.text = calculatorModel.currentInput
    }

    private fun updateOperandDisplay() {
        tvCurrentOperand.text = calculatorModel.operand
    }
}
