class FuncionariosController < ApplicationController
    def index
        @funcionarios = Funcionario.order :nome
    end    
end
