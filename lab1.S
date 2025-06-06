.global lab1
.syntax unified

lab1:
    push {lr}         // Зберігаємо адресу повернення

    mov r0, #9       // a = 9
    mov r1, #3        // b = 3
    mov r2, #5        // c = 5

    mul r3, r0, r1    // r3 = a * b
    cmp r3, #10       // Порівнюємо (a * b) з 10
    bge case_ge_10    // Якщо (a * b) >= 10, переходимо до першого випадку

    // Випадок (a * b) < 10: (a * b) * c
    mul r3, r3, r2    // r3 = (a * b) * c
    b done            // Переходимо до завершення

case_ge_10:
    orr r3, r0, r1    // r3 = a | b
    mul r3, r3, r2    // r3 = (a | b) * c

done:
    mov r5, r3        // Зберігаємо результат у r5
    pop {pc}          // Повернення
