-- Advertiser Spend and ROI metircs
-- Advertiser info table with columns advertiser_id, ad_id, and spend, where spend is what the advertiser paid for this ad
-- Ad info table with columns ad_id, user_id, and price, where pice is how much the user_id spend through this ad, assuming all prices>0.

-- Question: 
-- The fraction of advertisers has at least one conversion
-- What metrics would you show to advertisers

SELECT SUM(CASE WHEN price IS NOT NULL THEN 1 ELSE 0 END)::FLOAT/COUNT(*) AS fraction
FROM
    (SELECT *
     FROM fb.advertiser
     LEFT JOIN fb.ad USING(ad_id)) InnerQ;