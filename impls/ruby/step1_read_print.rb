require_relative 'printer'
require_relative 'reader'

def READ(str)
    return read_str(str)
end

def EVAL(md)
    return md
end

def PRINT(md)
    return pr_str(md)
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
