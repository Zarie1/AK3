.syntax unified
.cpu cortex-m4
.thumb

.global lab1

lab1:
    push {lr}

    // Вхідні значення (a = 4, b = 6, c = 3)
    mov r0, #4      // a
    mov r1, #6      // b
    mov r2, #3      // c

    // r3 = a + b
    add r3, r0, r1

    // r3 = (a + b) / 2 (ділення на 2 через зсув вправо на 1)
    lsrs r3, r3, #1

    // Обчислення факторіалу c (регістр r2)
    mov r4, #1
    mov r5, r2 

factorial_loop:
    cmp r5, #1
    ble factorial_done
    mul r4, r4, r5
    subs r5, r5, #1
    b factorial_loop

factorial_done:
    add r0, r3, r4  // r0 = (a + b)/2 + c!
    pop {pc}
