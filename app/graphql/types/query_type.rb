# frozen_string_literal: true

# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    field :contatos,
      [Types::ContatoType],
      null: false, 
      description: "Retorna uma lista de contatos"
  
      def contatos
        Contato.all
      end 
      
    field :contatos_por_nome, [Types::ContatoType], null: false, description: "Busca contatos por nome" do
      argument :nome, String, required: true
    end

    def contatos_por_nome(nome:)
      Contato.where("nome LIKE ?", "%#{nome}%")
    end
  end
end

