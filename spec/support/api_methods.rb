def parsed_body
    @parsed_body ||= JSON.parse(response.body, symbolize_names: true)
end

def parsed_header
    @parsed_header ||= JSON.parse(response.header, symbolize_names: true)
end