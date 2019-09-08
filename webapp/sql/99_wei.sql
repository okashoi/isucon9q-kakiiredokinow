alter table items add index(seller_id);

alter table items add index(status);

alter table items add index(created_at, status);
