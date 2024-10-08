library(httr)
library(jsonlite)
res = GET(
  url = "https://randomuser.me/api/",
  query = list(
    results=500,
    nat="ca",
    inc="gender,name,dob"
   )
)

data = fromJSON(content(res, "text"))
write.csv(data$results,"/usr/local/airflow/files/users.csv", row.names = FALSE)