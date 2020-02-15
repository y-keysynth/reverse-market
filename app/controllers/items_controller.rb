class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit, :create, :update, :destroy, :show_myself, :show_close_myself, :show_sell, :show_watch_list]
  # GET /items
  # GET /items.json
  def index
    @items ||= Item.all.order(created_at: "DESC").page(params[:page])
  end

  # GET /items/1
  # GET /items/1.json
  def show
    @sell_user = User.find_by(id: @item.seller_id)
  end

  def show_myself
    @items = Item.where(user_id: current_user.id).where(seller_id: nil).order(created_at: "DESC").page(params[:page])
  end

  def show_close_myself
    @items = Item.where(user_id: current_user.id).where.not(seller_id: nil).order(created_at: "DESC").page(params[:page])
  end

  def show_sell
    @items = Item.where(seller_id: current_user.id).order(created_at: "DESC").page(params[:page])
  end

  def show_watch_list
    ids = Like.where(user_id: current_user.id).pluck(:item_id)
    @items = Item.where(id: ids).order(created_at: "DESC").page(params[:page])
  end

  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items
  # POST /items.json
  def create
    @item = Item.new(item_params)
    @item.user_id = current_user.id

    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: 'Item was successfully created.' }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    if @item.update(item_params)
      redirect_to @item, notice: 'Item was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_url, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:title, :details, :price, :seller_id)
      # .merge(user_id: current_user.id)
    end
end
