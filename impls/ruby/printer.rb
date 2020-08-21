require_relative 'brackets'

def pr_str(mal_data)
    if mal_data
        if mal_data.kind_of?(Float)
            pr_num(mal_data)
        elsif mal_data.kind_of?(Symbol)
            print mal_data.to_s
        elsif mal_data.kind_of?(Array)
            pr_list(mal_data)
        end 
    end
end

def pr_num(mal_data)
    if mal_data == mal_data.to_i
        print mal_data.to_i.to_s
    else
        print mal_data.to_s
    end
end

def pr_list(mal_list)
    print mal_list[0].to_s
    mal_list.each_with_index do |val, index|
        if index == 0
            next
        elsif index + 1 == mal_list.length
            if val == :unbalanced
                print 'unbalanced'
                return
            end
            pr_str(val)
        else
            pr_str(val)
            print(' ')
        end
    end
    print BRACKETS[mal_list[0]]
end