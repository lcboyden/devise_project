class TodosController < ApplicationController
  
  before_action :set_todo, only: [:show, :edit, :update]
  
  def index
    @todos = current_user.todos
  end

  def show
  end

  def new
    @todo = Todo.new
    # @accounts = Account.new
    # @account = Account.new
    render partial: 'form'
  end

  def create
    @todo = current_user.todos.new(todo_params)
    
    if @todo.save
      # flash[:success] = "Account Created!"
      redirect_to todos_path
    
    else
      # flash[:error] = "Error" #{account.errors.full_messages.join("\n")}
      render :new
    end
  end

  def edit
    render partial: 'form'
  end

  def update
    if @todo.update(todo_params)
      redirect_to todos_path
    else
      render :edit
    end
  end

  def destroy
    @todo.destroy
    redirect_to todos_path
  end

  private
    def todo_params
      params.require(:todo).permit(:list, :task)
    end
  
    def set_todo
      @todo = current_user.todos.find(params[:id])
    end
end








# before_action
  
#   def index
#     #check to see if the user is logged in first

#     @accounts = current_user.accounts
#   end

#   def show
#     #check to see if the user is logged in first
#   end

#   def new
#     #check to see if the user is logged in first
#     @accounts = Account.new
#   end

#   def create
#     # @account = User.find(params[:id]).accounts.new(account_params)
#     @account = current_user.accounts.new(account_params)
#     if @account.save
#       flash[:success] = "Account Created!"
#       redirect_to accounts_path
#     else
#     flash[:error] = "Error" #{account.errors.full_messages.join("\n")}
#       render :new
#     end

#   end

#   def edit
#     #check to see if the user is logged in first
#   end

#   private
#   def account_params
#     params.require(:account).permit(:name, :balance)
#   end
# end