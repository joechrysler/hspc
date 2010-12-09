require 'prawn'
 pdf = Prawn::Document.new
 pdf.text("Prawn Rocks")
 pdf.render_file('prawn.pdf')
