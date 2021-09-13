class ProdutosController < ApplicationController
    def index
    @produtos = Produto.order(nome: :desc ).limit 6
    @produto_com_desconto = Produto.order(:preco).limit 1
    end

    def new
      @produto = Produto.new
      @departamentos = Departamentos.all
    end


    def create
      produto = params.require(:produto).permit(:nome, :descricao, :preco, :quantidade, :departamento_id)
      @produto = Produto.new valores
      if @produto.save
        flash[:notice] = "Produto salvo com sucesso !"
        redirect_to root_url
      else
        render :new
      end
      redirect_to root_url
    end

    def destroy
      id = params[:id]
      Produto.destroy id
      redirect_to root_url
    end

    def busca
      nome = params[:nome]
      @produtos = Produto.where "nome like ?","%#{nome}%"

      end
    end
