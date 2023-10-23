class TransactionsController < ApplicationController
  before_action :set_transaction, only: %i[show edit update destroy]

  # GET /transactions or /transactions.json
  def index
    @transactions = Transaction.all
  end

  # GET /transactions/1 or /transactions/1.json
  def show; end

  # GET /transactions/new
  def new
    @transaction = Transaction.new
  end

  # GET /transactions/1/edit
  def edit; end

  # POST /transactions or /transactions.json
def create
  category_id = params[:transaction][:category_id]
  @transaction = Transaction.new(author_id: User.first.id, **transaction_params)
  puts "Debug Info: category_id=#{category_id}, name=#{@transaction.name}, amount=#{@transaction.amount}"

  if category_id.present?
    @transaction.category_id = category_id

    if @transaction.save
      flash[:success] = 'Successfully captured transaction.'
      redirect_to transactions_path(author_id: User.first.id, id: category_id)
    else
      flash[:error] = 'There was an error while capturing the transaction.'
      puts "Failed to save transaction."
      puts "Transaction errors: #{transaction.errors.full_messages.join(', ')}"
      render :new
    end
  else
    flash[:error] = 'No category was selected for the transaction.'
    render :new
  end
end

  # PATCH/PUT /transactions/1 or /transactions/1.json
  def update
    respond_to do |format|
      if @transaction.update(transaction_params)
        format.html { redirect_to transaction_url(@transaction), notice: 'Transaction was successfully updated.' }
        format.json { render :show, status: :ok, location: @transaction }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transactions/1 or /transactions/1.json
  def destroy
    @transaction.destroy

    respond_to do |format|
      format.html { redirect_to transactions_url, notice: 'Transaction was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_transaction
    @transaction = Transaction.find(params[:id])
  end


def transaction_params
  params.require(:transaction).permit(:name, :amount, :user_id, category_ids: [])
end







end
