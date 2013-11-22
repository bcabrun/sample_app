class User < ActiveRecord::Base
	# Salvar email em minusculo para não haver problemas de compatibilidade
	before_save { self.email = email.downcase }
	
	# Nome
	validates :name, presence: true, length: { maximum: 50 }  	#Hash no final dos argumentos ñ precisa dos {}. Hash de options, muito comum.
	
	# Email
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i 	# Letra inicial maiuscula cria constante. # Rubular p/ treinar Regex.
	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
				uniqueness: { case_sensitive: false }
	
	# Password
	has_secure_password
	# O que o has_secure_password faz:
		# Add password and password_confirmation attributes, 
		# require the presence of the password, require that they match, 
		# and add an authenticate method to compare an encrypted password to the password_digest to authenticate users.
	# O que requer:
		# Coluna password_digest
	validates :password, length: { minimum: 6 } # presence e confirmation automáticos pelo has_secure_password

end
