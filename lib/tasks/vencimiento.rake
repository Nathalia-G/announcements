namespace :vencimiento do
  desc "TODO"
  task borrar_vencidos: :environment do
    @vencidos=Announcement.select("id").where("date <= ?", DateTime.now.strftime)
    @vencidos.each do |anuncio|
      anuncio.destroy
    end
  end
end
