module Spree
  module BannersHelper

    def insert_banner(params={})
      # class items show
      cl = params[:class] || "banner"

      # style items show
      style = params[:style] || "list"

      if params[:position].blank?
        if params[:max].blank?
          banner = Banner.enabled.shuffle
        else
          banner = Banner.enabled.shuffle.first(params[:max])
        end
      else
        if params[:max].blank?
          banner = Banner.by_position(Banner::POSITIONS[params[:position]]).shuffle
        else
          banner = Banner.by_position(Banner::POSITIONS[params[:position]]).shuffle.first(params[:max])
        end
      end

      unless banner.blank?
        if (style == "list")
          content_tag(:ul, raw(banner.map do |ban| content_tag(:li, link_to(image_tag(ban.attachment.url(image_size.to_sym)), ban.url), :class => cl) end.join) )
        else
          raw(banner.map do |ban|
            if ban.url?
              content_tag(style.to_sym, link_to(image_tag(ban.attachment.url(:custom)), ban.url), :class => cl)
            else
              content_tag(style.to_sym, image_tag(ban.attachment.url(:custom)), :class => cl)
            end
          end.join)
        end
      end
    end
  end
end
