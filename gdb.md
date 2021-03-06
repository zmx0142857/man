Note

    Before using gdb, run gcc with option -g to generate debug infomation.

Basic

    <return>                Repeat last command.
    help <cmd>              Help on gdb commands.
    quit                    Quit.
    file <filename>         Load executable file.
    list                    List source code, by default 10 lines.

Flow Control

    run                     Run from start until breakpoint or the end.
    continue                Continue to run.
    break                   Set breakpoint to current line.
    break <n>               Set breakpoint to line n.
    break <function>        Set breakpoint to beginning of function.
    break *<address>        Set breakpoint to address.
    delete <n>              Delete breakpoint numbered n.
    step                    Do one step, ascend into function.
    next                    Do one step, step over function.
    si/ni                   Like s/n, but one step in assemble.
    finish                  Finish current function.

Display

    print <variable>        Print variable value.
    display <format>        Set the infomation format at break. For
                            example, 'display /i $pc' shows assemble
                            command in hex format.
    undisplay <n>           Cancel previous display option numbered n.
    info <object>           Show info. For example, 'i break' shows
                            breakpoint infomation.
    bt                      Show function stack.
    examine <address>       Examine data at address.
