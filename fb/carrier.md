CASE STUDY

The process of FB sending requests to carrier and carrier sending message to users is as the following:
FB -(send verification code)-> mobile carriers -(send as sms)-> user -(confirm)-> FB

Note: FB has logs between FB and carrier and user's confirmation (see tables below), but FB doesn't not have information from carrier to users.
FB can send multiple requests to carriers in a day, but users only need to respond once.

sms_send  
`| ds (date) | carrier | country | phone num | event_type |`
- event_type：(type of request/message) "confirm", "recovery",...

confirm  
`| ds | phone |`

- Warm-up: how many requests fb sent to each carrier yesterday?
- Q1: If the confirmation rate decreased by x%, what might be the reason?
- Q2: Assume the number of messages FB sent don’t change, but confirmation rate decreased by x%, why?
- Q3: Assume carrier is the reason for confirmation decrease, how to find which carrier? (sql)
- Q4: If multiple carrier are down at the same time, FB needs to contact 5, how to choose?
