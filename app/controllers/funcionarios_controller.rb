class FuncionariosController < ApplicationController
    def index
        @funcionarios = Funcionario.order :nome
    end

    def new
        @funcionario = Funcionario.new
    end
    
    def create
        valores = params.require(:funcionario).permit(:nome, :email, :cargo, :salario)
        @funcionario = Funcionario.new valores
        if @funcionario.save
            flash[:notice] = "Funcionario cadastrado com sucesso!"
            redirect_to root_url
            SlackNotifier::CLIENT.ping "Novo funcionário cadastrado!"
        else
            render :new
        end         
    end
    
    def destroy
        id = params[:id]
        Funcionario.destroy id
        redirect_to root_url
        SlackNotifier::CLIENT.ping "Um funcionário foi removido!"
    end
    
    def busca
        @nome = params[:nome]
        @funcionarios = Funcionario.where "nome like ?", "%#{@nome}%"
    end

    def edit
        id = params[:id]
        @funcionario = Funcionario.find(id)
        render :new
    end

    def update
        id = params[:id]
        @funcionario = Funcionario.find(id)
        valores = params.require(:funcionario).permit(:nome, :email, :cargo, :salario)
        if @funcionario.update valores
            flash[:notice] = "Funcionario atualizado com sucesso"
            redirect_to root_url
        else
            render :new
        end         
    end
    
end
