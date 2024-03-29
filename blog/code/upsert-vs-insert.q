// upsert vs insert

show t:flip`time`sym`price`qty!"PSFJ"$\:()              // simple table
t upsert(.z.p;`IPM;50f;15)                              // upsert a single row
count t                                                 // table is not changed
`t upsert(.z.p;`IPM;50f;15)                             // upsert in place
count t                                                 // table is modified

`t insert(.z.p;`IPM;50f;15)                             // insert in place
show t
// t insert(.z.p;`IPM;50f;15)                           // 'type error, insert cannot accept a table as left arg

// {x insert(.z.p;`IPM;50f;15)}0#t                      // can't use insert with a local variable
{x upsert(.z.p;`IPM;50f;15)}0#t                         // upsert can


show kt:1!flip`ID`time`sym`price`qty!"JPSFJ"$\:()       // keyed table
kt upsert(1;.z.p;`IPM;50f;15)
count kt
`kt upsert(1;.z.p;`IPM;50f;15)
`kt insert(2;.z.p;`IPM;50f;15)
show kt
// kt insert(2;.z.p;`IPM;50f;15)                        // same behaviour vs simple table

`kt upsert(1;.z.p;`NEW;75f;20)                          // upsert record with existing key overwrites old record
show kt
// `kt insert(2;.z.p;`NEW2;30f;75)                      // 'insert error


t:([]time:5?.z.p;sym:upper 5?`3;price:5?50f;qty:5?50)
`:t/ upsert .Q.en[`:.;t]                                // write to disk splayed, will create files
delete t from `.
show get`:t

t2:([]time:5?.z.p;sym:upper 5?`3;price:5?50f;qty:5?50)
`:t upsert .Q.en[`:.;]t2                                // upsert can append to disk
count get`:t
