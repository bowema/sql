# Comments per story

Table name: content_actions

{user_id | content_id | content_type ('post', 'photo', 'comment') | target_id}  
Note:
- story: post or photo
- target_id: when a user commented on a story, the target_id indicates which story was commented

|user_id | content_id | content_type | target_id|
|---|---|---|---|
|1|5|post|Null|
|17|6|photo|Null|
|16|20|comment|5|

1) Generate a distribution for the #comments per story.  
2) Does this count for stories with 0 comments?
