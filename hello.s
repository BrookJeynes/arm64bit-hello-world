// --
// Assembler program to print "Hello, world!"
// to standard output.
// --

// Define `_start` as a global symbol so the linker can
// find it
.global _start

// Starting point of the application
_start:
    // write(int fd, const void *buf, size_t count)
    mov    x0, #1          // fd = STDOUT_FILENO
    ldr    x1, =msg        // buf = msg
    ldr    x2, =len        // count = len
    mov    x8, #64         // `write()` is syscall #64
    svc    #0              // Invoke syscall

    // exit(int status)
    mov    x0, #0     // status = 0
    mov    x8, #93    // exit is syscall #93
    svc    #0         // invoke syscall

.data
msg: .ascii "Hello, world!\n"
len = . - msg
