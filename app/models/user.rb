class User < ApplicationRecord
 has_secure_password
 has_many :metrics
 enum user_type: [:patient, :doctor]
end
