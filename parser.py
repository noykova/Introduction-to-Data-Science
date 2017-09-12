import csv
import json

#convert .csv to .json in Python. 
  
# Open the CSV  
f = open( 'titCsv.csv', 'rU' )  
# Change each fieldname to the appropriate field name. I know, so difficult.  
reader = csv.DictReader( f, fieldnames = ( "PasengerID","Survived","Pclass","Sex","Age","Ticket","Fare","Cabin","Cab" ))  
# Parse the CSV into JSON  
out = json.dumps( [ row for row in reader ] )  
print ("JSON parsed!")  
# Save the JSON  
f = open( 'parsed.json', 'w')  
f.write(out)  
print ("JSON saved!")  


