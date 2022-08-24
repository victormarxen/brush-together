class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @toothbrushes = Toothbrush.all
    @markers = @toothbrushes.geocoded.map do |toothbrush|
      {
        lat: toothbrush.latitude,
        lng: toothbrush.longitude,
        info_window: render_to_string(partial: "info_window", locals: { toothbrush: toothbrush }),
        image_url: helpers.asset_url("brush.jpeg")
      }
    end
  end

  def cards
  end
end
