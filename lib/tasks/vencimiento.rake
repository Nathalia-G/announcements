namespace :vencimiento do
  desc "TODO"
  task borrar_vencidos: :environment do
  @consulta=Announcement.where("date <= ?", DateTime.now.strftime)
  
  puts "_________________________________"
  puts @consulta
  puts "_________________________________"

  end

end
