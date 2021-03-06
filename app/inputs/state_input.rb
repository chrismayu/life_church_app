#encoding: utf-8

class StateInput < SimpleForm::Inputs::Base
  def input
    @builder.select(attribute_name, state_options2, { :selected => 'Please Select' },{ :class => "input-medium" })
  end

  private

  # The "Selecione..." string could also be translated with something like: I18n.t("helpers.select.prompt')
  def state_options
 
  
        [
          ['Alabama', 'AL'],
          ['Alaska', 'AK'],
          ['Arizona', 'AZ'],
          ['Arkansas', 'AR'],
          ['California', 'CA'],
          ['Colorado', 'CO'],
          ['Connecticut', 'CT'],
          ['Delaware', 'DE'],
          ['District of Columbia', 'DC'],
          ['Florida', 'FL'],
          ['Georgia', 'GA'],
          ['Hawaii', 'HI'],
          ['Idaho', 'ID'],
          ['Illinois', 'IL'],
          ['Indiana', 'IN'],
          ['Iowa', 'IA'],
          ['Kansas', 'KS'],
          ['Kentucky', 'KY'],
          ['Louisiana', 'LA'],
          ['Maine', 'ME'],
          ['Maryland', 'MD'],
          ['Massachusetts', 'MA'],
          ['Michigan', 'MI'],
          ['Minnesota', 'MN'],
          ['Mississippi', 'MS'],
          ['Missouri', 'MO'],
          ['Montana', 'MT'],
          ['Nebraska', 'NE'],
          ['Nevada', 'NV'],
          ['New Hampshire', 'NH'],
          ['New Jersey', 'NJ'],
          ['New Mexico', 'NM'],
          ['New York', 'NY'],
          ['North Carolina', 'NC'],
          ['North Dakota', 'ND'],
          ['Ohio', 'OH'],
          ['Oklahoma', 'OK'],
          ['Oregon', 'OR'],
          ['Pennsylvania', 'PA'],
          ['Puerto Rico', 'PR'],
          ['Rhode Island', 'RI'],
          ['South Carolina', 'SC'],
          ['South Dakota', 'SD'],
          ['Tennessee', 'TN'],
          ['Texas', 'TX'],
          ['Utah', 'UT'],
          ['Vermont', 'VT'],
          ['Virginia', 'VA'],
          ['Washington', 'WA'],
          ['West Virginia', 'WV'],
          ['Wisconsin', 'WI'],
          ['Wyoming', 'WY']
        ]
  
    
  end

  def selected_value
    value = object.send(attribute_name)
    value && value.strftime("%H:%M:%S")
  end
  
  def state_options2
 
    state=  {"United States" =>  
      [[ "Please Select"], 
        [ "Alabama (AL)"],  
      [ "Alaska (AK)"],  
      [ "Arizona (AZ)"],
      [ "Arkansas (AR)"],             
      [ "California (CA)"],
      [ "Colorado (CO)"],
      [ "Connecticut (CT)"],
      [ "Delaware (DE)"],
      [ "District of Columbia (DC)"],    
      [ "Florida (FL)"],
      [ "Georgia (GA)"],
      [ "Guam (GU)"],
      [ "Hawaii (HI)"],
      [ "Idaho (ID)"],
      [ "Illinois (IL)"],
      [ "Indiana (IN)"],
      [ "Iowa (IA)"],
      [ "Kansas (KS)"],
      [ "Kentucky (KY)"],
      [ "Louisiana (LA)"],
      [ "Maine (ME)"],
      [ "Maryland (MD)"],
      [ "Massachusetts (MA)"],
      [ "Michigan (MI)"],
      [ "Minnesota (MN)"],
      [ "Mississippi (MS)"],
      [ "Missouri (MO)"],
      [ "Montana (MT)"],
      [ "Nebraska (NE)"],
      [ "Nevada (NV)"],
      [ "New Hampshire (NH)"],
      [ "New Jersey (NJ)"],
      [ "New Mexico (NM)"],
      [ "New York (NY)"],
      [ "North Carolina (NC)"],
      [ "North Dakota (ND)"],
      [ "Ohio (OH)"],
      [ "Oklahoma (OK)"],
      [ "Oregon (OR)"],
      [ "Pennyslvania (PA)"],
      [ "Puerto Rico (PR)"],
      [ "Rhode Island (RI)"],
      [ "South Carolina (SC)"],
      [ "South Dakota (SD)"],
      [ "Tennessee (TN)"],
      [ "Texas (TX)"],
      [ "Utah (UT)"],
      [ "Vermont (VT)"],
      [ "Virginia (VA)"],
      [ "Virgin Islands (VI)"],
      [ "Washington (WA)"],
      [ "West Virginia (WV)"],
      [ "Wisconsin (WI)"],
      [ "Wyoming (WY)"]],
    " Canada" =>
      [[ "Please Select"], 
      [ "Alberta (AB)"],
      [ "British Columbia (BC)"],
      [ "Manitoba (MB)"],
      [ "New Brunswick (NB)"],
      [ "Newfoundland and Labrador (NL)"],
      [ "Northwest Territories (NT)"],
      [ "Nova Scotia (NS)"],
      [ "Nunavut (NU)"],
      [ "Prince Edward Island (PE)"],
      [ "Saskatchewan (SK)"],
      [ "Ontario (ON)"],
      [ "Quebec (QC)"],
      [ "Yukon (YT)"]],
    }
    
    
    state.sort 
    
  end
  
  
  
end