.data
.text
.globl fat
fat:

    pushq %rbp
    movq  %rsp, %rbp
    subq  $16, %rsp

    cmpl  $0, %edi
    jne else_if

    movl  $1, %eax
    jmp end_if

else_if:

    movq  %rdi, -8(%rbp)

    subl  $1, %edi
    call  fat
    
    movq  -8(%rbp), %rdi
    imull %edi, %eax

end_if:

leave
ret
