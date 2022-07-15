class ServiceBase
    include HTTParty

    base_uri ENV['URI']
    
    def initialize()
        @options = {}
        @parameters = {}
        @headers = {}
        @fields = {}
        @end_point = ''
        @cookies = ''
        @payloadRequest = ''
        @path_parameter = ''
        
        self.clear_all()
        self.start_header()
    end

    def start_header()
        self.add_header('Content-Type', 'application/json')
        self.add_header('Accept', 'application/json')
    end

    def clear_all()
        @parameters.clear if @parameters
        @headers.clear if @headers
        @fields.clear if @fields
        @cookies = ''
        @payloadRequest = ''
    end

    def add_field(field, value)
        @fields[field] = value
    end

    def get_fields()
        @fields
    end

    def add_header(header, value)
        @headers[header] = value
    end

    def add_query_parameter(param, value)
        @parameters[param] = value
    end

    def get()
        self.logRequest('GET')
        if (@cookies != '')
            self.class.default_cookies.add_cookies(@cookies)
        end
        @@response = self.class.get(@end_point + @path_parameter, :query => @parameters, :headers => @headers)
        self.logResponse()
        self.clear_all()
        self.start_header()
        @@response
    end

    def post(bodyAux)
        @payloadRequest = bodyAux.to_s
        self.logRequest('POST')

        if (@cookies != '')
            self.class.default_cookies.add_cookies(@cookies)
        end

        @@response = self.class.post(@end_point+@path_parameter, :body => bodyAux.to_json,  :query => @parameters, :headers => @headers)
        self.logResponse()
        self.clear_all()
        self.start_header()
        @@response
    end

    def logRequest(method)
        puts '========================================'
        puts '>>>>>>>>>>>>>   REQUEST    <<<<<<<<<<<<<'
        puts '----------------------------------------'
        
        printLog( 'URL: ' , ENV['URI'].to_s + @end_point.to_s + @path_parameter.to_s)
        printLog( 'Method: ', method.to_s)
        printLog( 'Parameters: ', @parameters.to_s)
        printLog( 'Headers: ', @headers.to_s)
        if (@payloadRequest != '')
            printLog( 'Body: ', @payloadRequest.to_s)
        end

        puts '----------------------------------------'

    end

    def printLog(title, message)
        Allure.add_attachment(name: title, source: message, type: Allure::ContentType::TXT, test_case: false)
        puts '    ' + title + message    
    end

    def logResponse()
        puts '========================================'
        puts '>>>>>>>>>>>>>   RESPONSE   <<<<<<<<<<<<<'
        puts '----------------------------------------'
        printLog( 'StatusCode Response: ', @@response.code.to_s)
        if (@@response.body.to_s.length > 1000)
            printLog( 'Body Response: ', @@response.body.to_s[0,1000] + '...')
        else 
            printLog( 'Body Response: ', @@response.body.to_s)
        end
        puts '----------------------------------------'

    end

    def check_int(obj)
        if /[0-9]/.match(obj)
            res = obj.to_i
        else    
            res = obj.to_s
        end
        res
    end

    def field_value(campo)
        sp = campo.to_s.split(".")
        body =  JSON.parse(@@response.body)

        if sp.length == 1
            res = body[check_int(sp[0])]
        elsif sp.length == 2
            res = body[check_int(sp[0])][check_int(sp[1])]
        elsif sp.length == 3
            res = body[check_int(sp[0])][check_int(sp[1])][check_int(sp[2])]
        else
            res = 'numero de campos maior que 3 (refatorar field_value)'
        end
        res
    end
end