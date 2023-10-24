class TransactionsController < ApplicationController
  before_action :set_transaction, only: %i[show edit update destroy]

  # GET /transactions or /transactions.json
  def index
    @transactions = Transaction.includes(:categories)
  end

  # GET /transactions/1 or /transactions/1.json
  def show; end

  # GET /transactions/new
  def new
    @transaction = Transaction.new
    @category = Category.find(params[:category_id]) if params[:category_id].present?
  end

  # GET /transactions/1/edit
  def edit; end

  # POST /transactions or /transactions.json
  def create
  category_id = params[:transaction][:category_id]
  puts "Category ID: #{category_id}"
  # @transaction = Transaction.new(author_id: current_user.id, **transaction_params)
  @transaction = Transaction.new(author_id: current_user.id, category_id: category_id, **transaction_params)


  if category_id.present?
    @transaction.category_id = category_id

    respond_to do |format|
      if @transaction.save
        flash[:success] = 'Successfully created a new transaction.'
        format.html { redirect_to category_path(category_id), notice: 'Transaction was successfully created.' }
        format.json { render :show, status: :created, location: @transaction }
      else
        flash[:error] = 'There was an error while creating the transaction.'
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
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
  params.require(:transaction).permit(:name, :amount, :category_id)
end

end
