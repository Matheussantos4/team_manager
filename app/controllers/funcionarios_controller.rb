class FuncionariosController < ApplicationController
    def index
        @funcionarios = Funcionario.order :nome
    end
    
    def create
        funcionario = params.require(:funcionario).permit(:nome, :email, :cargo, :salario)
        Funcionario.create funcionario
        redirect_to root_url
    end
    
    def destroy
        id = params[:id]
        Funcionario.destroy id
        redirect_to root_url
    end    
end
