def READ(str)
    return str
end

def EVAL(str)
    return str
end

def PRINT(str)
    return str
end

# repl
def REP(str)
    return PRINT(EVAL(READ(str)))
end

# repl loop
while true
    print 'user> '
    if input = gets
        puts REP(input)
    else
        exit(0)
    end
end
