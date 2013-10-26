class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :destroy, :download]

  # GET /items
  # GET /items.json
  def index
    @item  = Item.new(expires_at: Time.now.since(1.weeks))
    @items = Item.active
  end

  # GET /items/1
  # GET /items/1.json
  def show
  end

  def download
    Item.increment_counter :download_count, @item.id
    send_data @item.content, filename: @item.original_name, type: @item.content_type
  end

  # POST /items
  # POST /items.json
  def create
    @item = build_item

    respond_to do |format|
      if @item.save
        format.html { redirect_to items_path, notice: 'アップロードしたでー' }
        format.json { render action: 'show', status: :created, location: @item }
      else
        format.html { render action: 'new' }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST /items/1
  # POST /items/1.json
  def destroy
    respond_to do |format|
      if @item.authenticate(item_params[:password])
        @item.destroy
        format.html { redirect_to items_url, notice: '削除しましたー' }
        format.json { head :no_content }
      else
        format.html { redirect_to @item, alert: 'パスワード違うでー' }
        format.json { head :no_content , status: :unauthorized }
      end
    end
  end

  private

    def build_item
      if file = item_params[:content]
        item = Item.new(item_params.except(:content))
        item.size          = file.size
        item.content       = file.read
        item.content_type  = file.content_type
        item.original_name = file.original_filename
        item.name        ||= item.original_name
      else
        item = Item.new
      end

      item.download_count = 0
      item
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.active.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:name, :content, :expires_at, :password, :password_confirmation, :message)
    end
end
