Spree::Admin::TaxonsController.class_eval do
  def available_taxons
    @banner = Spree::Banner.find(params[:banner_id])
    @taxons = params[:q].blank? ? [] : Spree::Taxon.where('lower(name) LIKE ?', "%#{params[:q].mb_chars.downcase}%")
    @taxons.delete_if { |taxon| @banner.taxons.include?(taxon) }

    respond_with(:admin, @banner, @taxons)
  end

  def remove_taxon
    @banner = Spree::Banner.find(params[:banner_id])
    @taxon = Spree::Taxon.find(params[:id])
    @banner.taxons.delete(@taxon)
    @banner.save
    @taxons = @banner.taxons

    respond_with(@taxon) { |format| format.js { render_js_for_destroy } }
  end

  def selected_taxons
    @taxons = Spree::Banner.find(params[:banner_id]).taxons

    respond_with(:admin, @taxons)
  end

  def select_taxon
    @banner = Spree::Banner.find(params[:banner_id])
    @taxon = Spree::Taxon.find(params[:id])
    @banner.taxons << @taxon
    @banner.save
    @taxons = @banner.taxons

    respond_with(:admin, @banner, @taxons)
  end
end
