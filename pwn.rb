$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require '/Library/Ruby/Gems/1.8/gems/prawn-0.8.4/lib/prawn.rb'

Prawn.debug = true

Prawn::Document.generate("alignment.pdf") do
  text "This text should be left aligned"
  text "This text should be centered", :align => :center    
  text "This text should be right aligned", :align => :right
  
  pad(20) { text "This is Flowing from the left. " * 20 }
  
  pad(20) { text "This is Flowing from the center. " * 20, :align => :center }
  
  pad(20) { text "This is Flowing from the right. " * 20, :align => :right }
end
