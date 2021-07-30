db = db.getSiblingDB('case_sequencing_db')

db.results.update({},
  [{
    $set: {Material: {$toLower:"$Material" },
    Species: { $toLower: "$Species" },
    Project: { $toUpper: "$Project" },
    Sample_Origin: { $toUpper: "$Sample_Origin" },
    Date_Isolation:
    {
    $convert:{
      input: "$Date_Isolation",
      to:"int",
      onError: "$Date_Isolation",
      onNull: ""
     },
},
    Date_Acquisition:
    {
    $convert:{
      input: "$Date_Acquisition",
      to:"int",
      onError: "$Date_Acquisition",
      onNull: ""
    },
},

}}],
{ multi: true}
)