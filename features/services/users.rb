class Users < ServiceBase
    def initialize()
        super()
        @end_point = '/users'
    end

    def add_user_in_the_path(user)
        @path_parameter = '/' + user.to_s
    end
end