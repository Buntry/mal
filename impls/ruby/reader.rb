require_relative 'brackets'

class Reader
    attr_accessor :pos
    attr_accessor :tokens

    def initialize(tokens)
        self.tokens = tokens || []
        self.pos = 0
    end

    def next
        self.pos += 1
        return self.tokens[self.pos - 1]
    end

    def peek
        return self.tokens[self.pos]
    end
end

def read_str(str)
    return read_form(Reader.new(tokenize(str)))
end

def tokenize(str)
    mal_token_pattern = /[\s,]*(~@|[\[\]{}()'`~^@]|"(?:\\.|[^\\"])*"?|;.*|[^\s\[\]{}('"`,;)]*)/
    return str.scan(mal_token_pattern).flatten.select { |t| t.length > 0 }
end

def read_form(reader)
    if token = reader.peek()
        if closer = BRACKETS[token[0].to_sym]
            return read_list(reader, token[0], closer)
        elsif token[0] = '"'
            return
        else
            return read_atom(reader)
        end
    end
end

def read_list(reader, opener, closer)
    result = []
    reader.next() # left paren
    result << opener.to_sym
    while token = reader.peek()
        if token == closer
            reader.next()
            return result
        end
        
        result << read_form(reader)
    end
    
    result << :unbalanced
    return result
end

def read_atom(reader)
    token = reader.next()
    if is_number?(token)
        return token.to_f
    end
    return token.to_sym
end

def is_number?(str)
  true if Float(str) rescue false
end