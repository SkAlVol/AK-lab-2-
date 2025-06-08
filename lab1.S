.global lab1
.syntax unified

lab1:
    push {lr}         // Зберігаємо адресу повернення

    mov r0, #15       // a = 15
    mov r1, #7        // b = 7
    mov r2, #4        // c = 4

    sub r3, r0, r1    // r3 = a - b
    bmi negative_case // Якщо (a - b) < 0, переходимо до іншого випадку

    add r3, r0, r1    // r3 = a + b (якщо a - b >= 0)
    b compute_division // Переходимо до ділення

negative_case:
    mov r3, r0        // r3 = a
    sub r3, r1        // r3 = a - b

compute_division:
    bl division       // Викликаємо функцію ділення
    mov r5, r0        // Зберігаємо результат у r5

    pop {pc}          // Повернення

// Функція цілочисельного ділення r3 / c
division:
    push {lr}         // Зберігаємо адресу повернення
    sdiv r0, r3, r2   // r0 = r3 / c
    pop {pc}          // Повертаємося
