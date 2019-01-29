namespace :dev do
  desc "Popula Banco de Dados"
  task setup: :environment do
    puts "Cadastrando..."
    
    ## Tipos Contatos
    kinds = %w(Amigo Comercial Conhecido)

    kinds.each do |kind|
      Kind.create!(
        description: kind
      )
    end
    
    ## Contatos
    30.times do |i|
      Contact.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        birthdate: Faker::Date.between(65.years.ago, 18.years.ago),
        kind: Kind.all.sample
      )
    end
    puts "Cadastrado com Sucesso!"
  end
end